Script "stack_bst_card_id_1002"

/*
# Name: card id 1002 of stack "bst"
# ID: card id 1002 of stack "bst"
# Hash: uBO5xKNf/9beFwAJpvjWnA==
*/


local sTemplatePropsA, sBasePath

constant kExtension = ".livecodescript" // linting and syntax highlighting only works for .livecodescript
constant kExtensions = "rev.livecode.openxtalk.hyperxtalk"
constant kDisableLog = false

local sSkipSets         // custom property sets to skip
local sSkipKeys         // custop property keys to skip (default set only)
local sMissingTemplates // array of missing template props
local sFailedExports    // stacks with export errors
local sExportPath       // path for exported files
local sSourcePath       // path for stacks to export
local sStackPath        // path of current stack being worked
local sPreviousExports  // array of exported stacks to track deletions
local sInfo             // launch command and args

on startup
   put getCommandLineInfo() into sInfo
   --
   set the itemdel to "/"
   if sInfo["args"][1] is empty then
      put the item 1 to -2 of (the filename of this stack) & "/" into sBasePath
      put field "exportFolder" into sExportPath
      if sExportPath is "./" then
         put sBasePath into sExportPath
      else if sExportPath begins with "." then
         put sBasePath before sExportPath
      end if
      set the defaultFolder to sExportPath
      --
      put field "sourceFolder" into sSourcePath
      if sSourcePath is "./" then
         put sBasePath into sSourcePath
      else if sSourcePath begins with "." then
         put sBasePath before sSourcePath
      end if
   else
      put the defaultFolder into sBasePath
      if char -1 of sBasePath is not "/" then put "/" after sBasePath
      put sBasePath into sSourcePath
      if sInfo["args"][1] is "-" then
         put sBasePath & "HXT/" into sExportPath
      else
         put sBasePath into sExportPath
      end if
   end if
   --
   delete file "bst.log" -- clear log file
   _log "========================================"
   _log "Starting export"
   _log "-- Source:" && sSourcePath
   _log "-- Destination:" && sExportPath
   --
   getTemplateProps
   put field "propertySets" into sSkipSets
   put field "propertyKeys" into sSkipKeys
   --
   send "BinaryStackTrackerMain" to me in 0 milliseconds
end startup

command BinaryStackTrackerMain
   local tArg
   --
   if sInfo["args"][1] is empty then
      repeat for each line tArg in field "folders"
         getPreviousExports tArg
         processFolderOrStack tArg
      end repeat
   else
      repeat for each element tArg in sInfo["args"]
         processFolderOrStack tArg
      end repeat
   end if
   _log "Ending export"
   _log "========================================"
   
   _log "Deleting extra stacks"
   repeat for each line tExtra in the keys of sPreviousExports
      _log "   " & tExtra
      revDeleteFolder sExportPath & tExtra
   end repeat
   _log "========================================"
   
   _log "Missing templates:" & lf & (the keys of sMissingTemplates)
   _log "========================================"
   _log "Failed stack exports:" & lf & (the keys of sFailedExports)
   _log "========================================"
   if the hilite of button "autoClose" then
      send "quit" to me in 0 milliseconds
   end if
end BinaryStackTrackerMain

command processFolderOrStack pPath
   local tFiles, tFolder, tStack
   --
   if there is a file (sSourcePath & pPath) then
      set the itemdel to "."
      if item -1 of pPath is not among the items of kExtensions then
         //_log "Skipping file" && pPath
         exit processFolderOrStack
      end if
      put pPath into field "currentPath"
      try
         lock messages
         put the long id of stack (sSourcePath & pPath) into tStack
         put the long id of stack (the mainstack of tStack) into tStack
         unlock messages
         set the itemdel to "/"
         delete item -1 of pPath
         if pPath is empty then
            put "./" into pPath
         end if
         exportStack tStack, pPath
      catch e
         if tStack is empty then put pPath into tStack
         _log "Cannot process" && tStack & lf & e
         put true into sFailedExports[tStack]
         exit processFolderOrStack
      end try
      try
         // ensure stack removed from memory after export
         lock messages
         close tStack
         delete stack tStack
         unlock messages
      end try
   else if there is a folder (sSourcePath & pPath) then
      _log "Exporting folder:" && pPath
      put files(sSourcePath & pPath) & lf & folders(sSourcePath & pPath) into tFiles
      if char -1 of pPath is not "/" then put "/" after pPath
      repeat for each line tFile in tFiles
         if tFile is empty then next repeat        // skip empty lines
         if tFile begins with "." then next repeat // skip hidden files and folders
         if tFile is "notes" then next repeat      // skip notes folder
         processFolderOrStack (pPath & tFile)
      end repeat
   else
      _log "Cannot find file or folder" && pPath
   end if
   wait 0 milliseconds with messages
end processFolderOrStack

on exportStack pStackLongId, pPath
   local xDataA, tStackName, tSubstack
   --
   //_log pStackLongId
   set the itemdel to "/"
   repeat while pPath begins with "../"
      put the item 2 to -1 of pPath into pPath
   end repeat
   if char -1 of pPath is not "/" then put "/" after pPath
   --
   // put "0.0.1" into xDataA["#stackTrackerVersion"]
   // put the version into xDataA["#ideVersion"]
   // put getIde() into xDataA["#ideName"]
   --
   put the short name of pStackLongId into tStackName
   put tStackName into xDataA["#mainstack"]
   put item 1 to -2 of the filename of pStackLongId into sStackPath
   put pPath & (item -1 of the filename of pStackLongId) \
         & ".bst" into pPath
   delete variable sPreviousExports[pPath] -- stack still exists, remove from list
   put sExportPath & pPath & "/" into pPath
   ensureFolder pPath
   --
   local tOldHash, tNewHash
   put url ("binfile:" & pPath & tStackName & ".md5") into tOldHash
   put messageDigest(url ("binfile:" & the filename of pStackLongId), "MD5") into tNewHash
   if tOldHash is tNewHash then
      //_log "Stack" && tStackName && "has not changed, skipping export"
      exit exportStack
   end if
   --
   revDeleteFolder pPath & "assets"
   revDeleteFolder pPath & "scripts"
   ensureFolder pPath & "assets/"
   ensureFolder pPath & "scripts/"
   --
   getStackData tStackName, xDataA, pPath
   repeat for each line tSubstack in xDataA[tStackName]["#substacks"]
      getStackData tSubstack, xDataA, pPath
   end repeat
   --
   encodeBinary xDataA, pPath
   saveStackJson xDataA, pPath
   put tNewHash into url ("binfile:" & pPath & tStackName & ".md5")
end exportStack

on saveStackJson xDataA, pPath
   local tUsePhoton, tFileName, tJson
   --
   if the version begins with "11" then
      put false into tUsePhoton
   else
      put true into tUsePhoton
   end if
   --
   if tUsePhoton then
      put JSONStringify(xDataA,,true) into tJson
   else if the version begins with "11" then
      put jsonEncodeForDisplay(xDataA) into tJson
   else
      put jsonEncode(xDataA) into tJson
   end if
   --
   put pPath & xDataA["#mainstack"] & ".json" into tFileName
   put textEncode(tJson, "UTF-8") into url ("binfile:" & tFilename)
end saveStackJson

command getStackData pStackName, @xDataA, pPath
   local tStackLongID, tObjectID, tObjectLongID, tObjectLongName, tAddress
   --
   //_log "getStackData" && pStackName
   put "stack" && _q(pStackName) into tStackLongID
   if pStackName is not xDataA["#mainstack"] then
      put " of stack" && _q(xDataA["#mainstack"]) after tStackLongID
   else
      put the substacks of tStackLongID into \
            xDataA[pStackName]["#substacks"]
   end if
   --
   // ensure group-editing mode is disabled
   // cardIDs are not properly returned if enabled
   try
      set the editBackground of stack pStackName to false
   end try
   --
   put pStackName into tAddress[1]
   getUniqueProps tStackLongID, xDataA, tAddress
   getPropertySets tStackLongID, xDataA, tAddress
   exportScript pStackName, tStackLongID, tStackLongID, pPath
   put "childcontrols" into tAddress[2]
   --
   put tStackLongID into xDataA[pStackName]["longID"]
   put the backgroundIDs of tStackLongID into xDataA[pStackName]["backgroundIDs"]
   put the sharedGroupIDs of tStackLongID into xDataA[pStackName]["sharedGroupIDs"]
   put the cardIDs of tStackLongID into xDataA[pStackName]["cardIDs"]
   --
   // Manually build all long IDs so that the short stack name is used
   // and to ensure that references do not change based on whether a
   // card has been visited and which card is currently selected
   --
   // save background and shared group scripts and objects
   repeat for each line tObjectID in xDataA[pStackName]["sharedGroupIDs"]
      // background/shared groups can provide inconsistent long IDs
      // force a short version that does not use group/card
      put "bkgnd id" && tObjectID && "of" && tStackLongID into tObjectLongID
      put _longName(tObjectLongID, tStackLongID) into tObjectLongName
      put "bkgnd" into word 1 of tObjectLongName
      getUniqueProps tObjectLongID, xDataA, tAddress
      getPropertySets tObjectLongID, xDataA, tAddress
      exportScript pStackName, tObjectLongID, tObjectLongName, pPath
      getChildControlData pStackName, xDataA, tObjectLongID, tObjectLongName, tAddress, pPath
   end repeat
   --
   // save card scripts and objects
   repeat for each line tObjectID in xDataA[pStackName]["cardIDs"]
      put "card id" && tObjectID && "of" && tStackLongID into tObjectLongID
      put _longName(tObjectLongID, tStackLongID) into tObjectLongName
      getUniqueProps tObjectLongID, xDataA, tAddress
      getPropertySets tObjectLongID, xDataA, tAddress
      exportScript pStackName, tObjectLongID, tObjectLongName, pPath
      getChildControlData pStackName, xDataA, tObjectLongID, tObjectLongName, tAddress, pPath
   end repeat
end getStackData

command getChildControlData \
      pStackName,      /* stack short name            */ \
      @xDataA,         /* export data array           */ \
      pObjectLongID,   /* long ID of parent control   */ \
      pObjectLongName, /* long name of parent control */ \
      pAddress         /* address in data array       */ \
      pPath            /* path to export folder       */
   local tChildControlIDs, tControlLongID, tControlLongName, tSharedGroupIDs
   local tStackLongID, tIndex
   --
   try
      if the dgProps["Control Type"] of pObjectLongID is "Data Grid" then
         // do not export the automatically generated dgGrid groups and controls
         put "#data grid group" into xDataA[pAddress]["childcontrols"]
         exit getChildControlData
      end if
      --
      put the childControlIDs of pObjectLongID into tChildControlIDs
      if tChildControlIDs is empty then exit getChildControlData
   catch tError
      exit getChildControlData
   end try
   --
   //_log "getChildControlData" && pObjectLongID
   put xDataA[pStackName]["longID"] into tStackLongID
   put xDataA[pStackName]["sharedGroupIDs"] into tSharedGroupIDs
   --
   put item 2 of the extents of pAddress into tIndex
   put word 3 of pObjectLongID into pAddress[tIndex + 1]
   --
   if xDataA[pAddress]["customproperties"]["viewProp"] is not empty then
      // do not export data view group child controls
      put "#data view group" into xDataA[pAddress]["childcontrols"]
      exit getChildControlData
   end if
   --
   put "childcontrols" into pAddress[tIndex + 2]
   --
   repeat for each line tControlID in tChildControlIDs
      if tControlID is among the lines of tSharedGroupIDs then
         put "#shared group" into xDataA[pAddress][tControlID]
         next repeat
      end if
      put the abbreviated id of control id tControlID of tStackLongID && "of" \
            && pObjectLongID into tControlLongID
      put _longName(tControlLongID, pObjectLongName) into tControlLongName
      getUniqueProps tControlLongID, xDataA, pAddress
      getPropertySets tControlLongID, xDataA, pAddress
      exportScript pStackName, tControlLongID, tControlLongName, pPath
      getChildControlData pStackName, xDataA, tControlLongID, tControlLongName, pAddress, pPath
   end repeat
end getChildControlData

command exportScript pStackName, pObjectLongID, pObjectLongName, pPath
   local tScript, tFileName, tHeader
   --
   try
      if pObjectLongID is empty then exit exportScript
      if the script of pObjectLongID is empty then exit exportScript
   catch e
      exit exportScript
   end try
   --
   //_log "exportScript" && pObjectLongID
   put the script of pObjectLongID into tScript
   --
   // generate file name
   put "stack_" & replaceText(pStackName, space, "_") into tFileName
   if word 1 of pObjectLongID is not "stack" then
      put "_" & replaceText(word 1 to 3 of pObjectLongID, space, "_") after tFileName
   end if
   --
   // build file header
   put "Script" && _q(tFileName) & lf & lf into tHeader
   put "/*" & lf after tHeader
   put "# Name:" && pObjectLongName & lf after tHeader
   put "# ID:" && pObjectLongID & lf after tHeader
   put "# Hash:" && base64encode(messageDigest(tScript, "MD5")) & lf after tHeader
   put "*/" & lf after tHeader
   --
   put tHeader & lf & lf before tScript
   --
   put pPath & "scripts/" & tFileName & kExtension into tFileName
   put textEncode(tScript, "UTF-8") into url ("binfile:" & tFileName)
end exportScript

command getUniqueProps pObject, @xDataA, pAddress
   local tKind, tProps, tControl, tIndex
   --
   //_log "getUniqueProps" && pObject
   put word 1 of pObject into tKind
   if tKind is "stack" then
      put the short name of pObject into tControl
   else
      put word 3 of pObject into tControl
      put item 2 of the extents of pAddress into tIndex
      put tControl into pAddress[tIndex + 1]
   end if
   --
   // getting properties of a colorPalette or toolbar crashes HyperXTalk
   // using a try block does not prevent the crash, so we skip it entirely
   if tKind is among the items of "colorPalette,toolbar" then
      put "%no properties%" into xDataA[pAddress]["properties"]
   else
      try
         put the properties of pObject into xDataA[pAddress]["properties"]
      catch e
         put "%no properties%" into xDataA[pAddress]["properties"]
      end try
   end if
   put sTemplatePropsA[tKind] into tProps
   --
   if tKind is "widget" then
      put the kind of pObject into xDataA[pAddress]["$kind"]
      //_log "exporting widget" && pObject & lf & xDataA[pAddress]["$kind"]
      // widgets without export code crash HyperXTalk, so we skip them
      if xDataA[pAddress]["$kind"] is not among the items of \
            "com.livecode.widget.colorSwatch,com.livecode.widget.gradientRampEditor," \
            & "com.livecode.widget.tile" then
         export pObject to array xDataA[pAddress]
      end if
      put the id of pObject into tProps["id"]
      put the rect of pObject into tProps["rect"]
      put the short name of pObject into tProps["name"]
      put tProps into xDataA[pAddress]["properties"]
      put empty into tProps
   else if tKind is "field" and xDataA[pAddress]["properties"]["sharedText"] is false \
         and pAddress[3] is in xDataA[pAddress[1]]["sharedGroupIDs"] then
      getNonSharedText pObject, xDataA, pAddress
   else if tProps is empty then
      _log tKind && "does not have property template"
      put true into sMissingTemplates[tKind]
   end if
   --
   // split fileName property into name and path
   // record path relative to the stack path
   if xDataA[pAddress]["properties"]["filename"] is not empty then
      local tLeft, tRight
      put xDataA[pAddress]["properties"]["filename"] into tLeft
      put sStackPath into tRight
      set the itemdel to "/"
      repeat while item 1 of tLeft is item 1 of tRight
         delete item 1 of tLeft
         delete item 1 of tRight
      end repeat
      put item -1 of tLeft into xDataA[pAddress]["properties"]["filename"]
      put item 1 to -2 of tLeft into xDataA[pAddress]["properties"]["filepath"]
   end if
   --
   local tKeys
   put the keys of xDataA[pAddress]["properties"] into tKeys
   repeat for each line l in tKeys
      if xDataA[pAddress]["properties"][l] is tProps[l] then
         delete variable xDataA[pAddress]["properties"][l]
      end if
   end repeat
   // HXT added `markdownText` but it duplicates data already captured
   // Removing the key and only keeping the `htmltext` export
   delete variable xDataA[pAddress]["properties"]["markdownText"]
   --
   try
      put the name of pObject into xDataA[pAddress]["#name"]
   catch e
      put tKind && tControl into xDataA[pAddress]["#name"]
      _log "error getting name for" && pObject && ":" && e
   end try
end getUniqueProps

command getNonSharedText pObject, @xDataA, pAddress
   local tCardIds, tControl
   --
   put xDataA[pAddress[1]]["cardIDs"] into tCardIds
   repeat for each line tCardId in tCardIds
      put "control id" && word 3 of pObject && "of card id" && tCardId && \
            "of stack" && _q(pAddress[1]) into tControl
      try
         put the htmltext of tControl into \
               xDataA[pAddress]["properties"]["htmlText"][tCardId]
      catch e
         _log "error getting nonsharedtext for" && pObject & lf & e
      end try
   end repeat
end getNonSharedText

command getPropertySets pObject, @xDataA, pAddress
   local tControl, tIndex
   //_log "getPropertySets" && pObject
   if word 1 of pObject is "stack" then
      put the short name of pObject into tControl
   else
      put word 3 of pObject into tControl
      put item 2 of the extents of pAddress into tIndex
      put tControl into pAddress[tIndex + 1]
   end if
   --
   try
      repeat for each line l in the custompropertysets of pObject
         if l is among the lines of sSkipSets then next repeat
         put the customproperties[l] of pObject into \
               xDataA[pAddress]["custompropertysets"][l]
      end repeat
      --
      put the customproperties of pObject into xDataA[pAddress]["customproperties"]
      if xDataA[pAddress]["customproperties"] is empty then
         delete variable xDataA[pAddress]["customproperties"]
      else
         repeat for each key l in xDataA[pAddress]["customproperties"]
            if l is among the lines of sSkipKeys then
               delete variable xDataA[pAddress]["customproperties"][l]
            end if
         end repeat
      end if
   catch e
      _log "error getting customproperties for" && pObject & lf & e
   end try
end getPropertySets

command encodeBinary @xDataA, pExportPath, pObject, pPath, pLevel
   local tValue, tPath, tProp, tFileName
   if pLevel is not an integer then put 0 into pLevel
   add 1 to pLevel
   repeat for each key l in xDataA
      if xDataA[l] is an array then
         put pPath into tPath
         if pLevel mod 2 is 1 then 
            put l & "_" after tPath
            if pLevel is 1 or l is an integer then
               put word 1 of xDataA[l]["#name"] into pObject
            end if
         end if
         encodeBinary xDataA[l], pExportPath, pObject, tPath, pLevel
      else if len(xDataA[l]) > 254 then
         put pPath & l into tPath
         set the itemdel to "_"
         if l is a number then
            put item -2 of tPath into tProp
         else
            put l into tProp
         end if
         set the itemdel to ","
         if pObject is "image" then
            put "assets/" & tPath & ".png" into tFileName
            put xDataA[l] into url ("binfile:" & pExportPath & tFileName)
         else if tProp is among the items of "htmltext,text,svg path" then
            put "assets/" & tPath & ".txt" into tFileName
            put textEncode(xDataA[l], "UTF-8") into url ("binfile:" & pExportPath & tFileName)
         else
            put "assets/" & tPath & ".bin" into tFileName
            put xDataA[l] into url ("binfile:" & pExportPath & tFileName)
         end if
         put "%file%:" && tFileName into xDataA[l]
      else if xDataA[l] is an ascii string or xDataA[l] is empty then
         -- leave alone
      else if xDataA[l] is strictly a binary string then
         put base64encode(xDataA[l]) into tValue
         if l is "htmlText" then put xDataA[l] into xDataA[l]["text"]
         put tValue into xDataA[l]["%base64%"]
      end if
   end repeat
end encodeBinary

command getPreviousExports pFolder
   local tFolders
   put folders(sExportPath & pFolder) into tFolders
   repeat for each line tFolder in tFolders
      if tFolder is empty then next repeat        // skip empty lines
      if tFolder begins with "." then next repeat // skip hidden folders
      if tFolder ends with ".bst" then
         put true into sPreviousExports[pFolder & "/" & tFolder]
      else
         getPreviousExports pFolder & "/" & tFolder
      end if
   end repeat
end getPreviousExports

command getTemplateProps
   -- commented out templates crash HyperXTalk
   put the properties of the templateAudioClip into sTemplatePropsA["audioclip"]
   put the properties of the templateButton into sTemplatePropsA["button"]
   put the properties of the templateCard into sTemplatePropsA["card"]
   --put the properties of the templateEPS into sTemplatePropsA["eps"]
   put the properties of the templateField into sTemplatePropsA["field"]
   put the properties of the templateGraphic into sTemplatePropsA["graphic"]
   put the properties of the templateGroup into sTemplatePropsA["group"]
   put the properties of the templateGroup into sTemplatePropsA["bkgnd"]
   put the properties of the templateImage into sTemplatePropsA["image"]
   --put the properties of the templatePlayer into sTemplatePropsA["player"]
   put the properties of the templateScrollbar into sTemplatePropsA["scrollbar"]
   put the properties of the templateStack into sTemplatePropsA["stack"]
   --put the properties of the templateVideoClip into sTemplatePropsA["videoclip"]
end getTemplateProps

function _q pText
   return quote & pText & quote
end _q

private function _longName pObjectLongID, pParentLongName
   try
      return (the abbreviated name of pObjectLongID) && "of" && pParentLongName
   catch e
      return pObjectLongID
   end try
end _longName

function getIde
   local tHome
   --
   try
      put the long name of stack "home" into tHome
   catch e
      put the commandName into tHome
   end try
   --
   if tHome contains "hyperx" then
      return "HyperXTalk"
   else if tHome contains "openx" then
      return "OpenXTalk"
   else if tHome contains "livecode" then
      return "LiveCode"
   else
      return "unknown"
   end if
end getIde

private command ensureFolder pFolder
   set the itemDelimiter to slash
   repeat with x = 2 to the number of items of pFolder
      if there is no folder item 1 to x of pFolder then
         create folder (item 1 to x of pFolder)
      end if
   end repeat
end ensureFolder

private command _log pText
   if kDisableLog is true then exit _log
   --
   put the long time & " - " & line 1 of pText & lf after url ("file:./bst.log")
   delete line 1 of pText
   if pText is empty then exit _log
   --
   local tText
   repeat for each line tLine in pText
      put "   " & tLine & lf after tText
   end repeat
   put tText after url ("file:./bst.log")
end _log

/*****************************************************************************
* MARK: getCommandLineInfo
*****************************************************************************/

function getCommandLineInfo
   local tRawArg, tSelfCommand, tSelfScript, tInArgs, tArgs
   --
   put false into tInArgs
   --
   // Treat everything up to & including the first
   // ".hyperxtalk[script]" file as the command for running the test
   // runner, and everything after it as test runner arguments
   put the commandName into tSelfCommand[1]
   repeat for each element tRawArg in the commandArguments
      --
      if tInArgs then
         put tRawArg into tArgs[1 + the number of elements in tArgs]
      else
         put tRawArg into tSelfCommand[1 + the number of elements in tSelfCommand]
         if tRawArg ends with ".hyperxtalkscript" or \
               tRawArg ends with ".hyperxtalk" or \
               tRawArg ends with ".livecodescript" or \
               tRawArg ends with ".livecode" then
            put tRawArg into tSelfScript
            put true into tInArgs
         end if
      end if
      --
   end repeat
   --
   local tInfo
   put tSelfCommand into tInfo["self-command"]
   put tSelfScript into tInfo["self-script"]
   put tArgs into tInfo["args"]
   --
   return tInfo
end getCommandLineInfo

/*****************************************************************************
* MARK: revDeleteFolder / revWindowsFromUnixPath / revSetWindowsShellCommand
*****************************************************************************/

on revDeleteFolder pSrcFolder
   set the itemdelimiter to "."
   if the platform is "Win32" then
      revSetWindowsShellCommand
      -- check for Win 2000, XP, Vista
      if item 1 of (word 2 of the systemVersion) >= "5" then
         get shell ("rmdir /s /q" && revWindowsFromUnixPath(quote&pSrcFolder&quote))
      else
         get shell ("deltree /Y" && revWindowsFromUnixPath(quote&pSrcFolder&quote))
      end if
   else
      get shell ("rm -rf" && quote&pSrcFolder&quote)
   end if
   return the result
end revDeleteFolder

function revWindowsFromUnixPath pUnixPath
   replace "/" with "\" in pUnixPath
   return pUnixPath
end revWindowsFromUnixPath

on revSetWindowsShellCommand
   if the platform is not "Win32" then exit revSetWindowsShellCommand
   set the hideConsoleWindows to true
   set the shellCommand to $COMSPEC
end revSetWindowsShellCommand


