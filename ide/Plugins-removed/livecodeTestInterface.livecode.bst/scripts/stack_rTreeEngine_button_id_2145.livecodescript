Script "stack_rTreeEngine_button_id_2145"

/*
# Name: button "TreeMenu" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2145 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: jWceY8YBDllfHpIjQITpsg==
*/


local tClickField
local sTreeClickLoc
local sLongCardID
local tLineNum

on treeID theID
   put theID into tClickField
   put word 5 to - 1 of tClickField into sLongCardID
   
   put lineOffset("Use Global Data" , the text of me) into tLineNum
   if the useGlobalData of tClickField is true
   then
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!c" into character 1 to 2 of line tLineNum of me
      end if
   else
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!n" into character 1 to 2 of line tLineNum of me
      end if
      if tLineNum is not empty and tLineNum is not 0
      then
         set the useGlobalData of tClickField to false
      end if
   end if
   put lineOffset("Use Connection Lines" , the text of me) into tLineNum
   if the useConnectionLines of tClickField is true
   then
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!c" into character 1 to 2 of line tLineNum of me
      end if
   else
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!n" into character 1 to 2 of line tLineNum of me
      end if
      if tLineNum is not empty and tLineNum is not 0
      then
         set the useConnectionLines of tClickField to false
      end if
   end if
   put lineOffset("Use First Badge" , the text of me) into tLineNum
   if the useFirstBadge of tClickField is true
   then
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!c" into character 1 to 2 of line tLineNum of me
      end if
   else
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!n" into character 1 to 2 of line tLineNum of me
      end if
      if tLineNum is not empty and tLineNum is not 0
      then
         set the useBadges of tClickField to false
      end if
   end if
   put lineOffset("Use Left Badges" , the text of me) into tLineNum
   if the useLeftBadges of tClickField is true
   then
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!c" into character 1 to 2 of line tLineNum of me
      end if
   else
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!n" into character 1 to 2 of line tLineNum of me
      end if
      if tLineNum is not empty and tLineNum is not 0
      then
         set the useLeftBadges of tClickField to false
      end if
   end if
   put lineOffset("Show Invisible Nodes" , the text of me) into tLineNum
   if the showInvisibleNodes of tClickField is true
   then
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!c" into character 1 to 2 of line tLineNum of me
      end if
   else
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!n" into character 1 to 2 of line tLineNum of me
      end if
      if tLineNum is not empty and tLineNum is not 0
      then
         set the showInvisibleNodes of tClickField to false
      end if
   end if
   put lineOffset("Use Sublines" , the text of me) into tLineNum
   if the useSublines of tClickField is true
   then
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!c" into character 1 to 2 of line tLineNum of me
      end if
   else
      if tLineNum is not empty and tLineNum is not 0
      then
         put "!n" into character 1 to 2 of line tLineNum of me
      end if
      if tLineNum is not empty and tLineNum is not 0
      then
         set the useSublines of tClickField to false
      end if
   end if
end treeID

on treeClickLoc theValue
   put theValue into sTreeClickLoc
end treeClickLoc

on menuPick pItemName
   local tFieldID
   local tPath
   local tName
   local tLastNodeID
   local tFile
   local tFileText
   local tTabNum
   local tParentID
   local tRootNodeIDs
   local tParentDepth
   local tLabel
   local tNodeData
   local tFileTextChunk
   local tChunkLineNum
   local tChildren
   local tRect
   local bcdFld
local bcdGrc
local crrPcc
local drgInr
local edtInr
local cnnLns
local vrlScr
local hrlScr
local theName
local tCounter
local tLockLocs
local ndeBcd
local frtIcn
local scdIcn
local thdIcn
local ndeTxt
local frtBde
local tLongNodeTemplateID
local tCustomPropertiesA
local tNodeDataA
local tIDs
local tIDpath
local tNodeTypeA
local tIndentA
local tLeafA
local tCustomProperties
local tCardID
local tLongStackID
local tLongMainStackID
local tControlID
local tOwnerName
local tOwnerID
local tLongRelativeCardName
local tLongRelativeControlName
local tLongRelativeParentName
local tLongControlName
local tLongScriptID
local tLongPropertiesID
local tLongCustomPropertiesID
local tLongCustomPropertySetsID
local ms


   lock screen
   if tClickField is not empty
   then
      switch pItemName
         case "Build Tree from|File System"
            # Choose a directory to start in.
            answer folder "Please choose a Directory!"
            if it is empty then break
            put it into tPath
            dispatch "delete_allNodeData" to tClickField
            set the itemDelimiter to "/"
            put the last item of tPath into tName
            # Create the Node and set some Node properties.
            dispatch "new_node" to tClickField
            put the lastNodeID of tClickField into tLastNodeID
            set the nodeData[tLastNodeID,"name"] of tClickField to tName
            set the nodeData[tLastNodeID,"sourcePath"] of tClickField to tPath
            set the nodeData[tLastNodeID,"expanded"] of tClickField to false
            # Render the Tree.
            dispatch "render_tree" to tClickField
            break
         case "Build Tree from|Text file"
            answer file "Please choose a text file!" with "C:/" with filter "Text Files , *.txt" # Choose a directory to start in.
            if it is empty then break
            put it into tPath
            put "file:" & tPath into tFile
            put URL tFile into tFileText
            dispatch "delete_allNodeData" to tClickField
            put the lastNodeID of tClickField into tLastNodeID
            repeat for each line sLine in tFileText
               add 1 to tLastNodeID
               add 1 to tLineNum
               put 0 into tTabNum
               repeat for each character sCharacter in sLine
                  if sCharacter is not tab then exit repeat
                  add 1 to tTabNum
               end repeat
               put tLastNodeID into tParentID
               if tTabNum is 0
               then
                  put cr & tLastNodeID after tRootNodeIDs
               end if
               put tTabNum into tParentDepth
               put sLine into tLabel
               replace tab with empty in tLabel
               put tLabel into tNodeData[tLastNodeID]["label"]
               put line tLineNum + 1 to - 1 of tFileText into tFileTextChunk
               put tLineNum into tChunkLineNum
               put empty into tChildren
               repeat for each line tChunkLine in tFileTextChunk
                  add 1 to tChunkLineNum
                  put 0 into tTabNum
                  repeat for each character sCharacter in tChunkLine
                     if sCharacter is not tab then exit repeat
                     add 1 to tTabNum
                  end repeat
                  if tTabNum > tParentDepth + 1 then next repeat
                  if tTabNum < tParentDepth + 1 then exit repeat
                  put cr & tChunkLineNum after tChildren
               end repeat
               if character 1 of tChildren is cr then delete character 1 of tChildren
               put tChildren into tNodeData[tParentID]["children"]
            end repeat
            if character 1 of tRootNodeIDs is cr then delete character 1 of tRootNodeIDs
            set the rootNodeIDs of tClickField to tRootNodeIDs
            set the nodeData of tClickField to tNodeData
            dispatch "renderTree" to tClickField
            break
         case "Restore|Default Controls"
            answer warning "This will delete all controls in the rTree group and replace them with default controls!" & cr & cr & "Are you sure you want to do this?" with "Yes" and "No"
            if it is "No"
            then
               exit to top
            end if
            put the rect of tClickField into tRect
            -- repeat for each item tControlName in "backgroundField,backgroundGraphic,cornerPiece,connectionLines,verticalScrollbar,horizontalScrollbar,dragIndicator,editIndicator,nodeTemplate"
               -- if there is a control tControlName of tClickField then delete control tControlName of tClickField
            -- end repeat
            send "delete_nodeContainers" to tClickField
            repeat with i = the number of controls of tClickField down to 1
               delete control i of tClickField
            end repeat
            go sLongCardID
            start editing tClickField
            if there is no control "backgroundField" of tClickField
            then
               create field "backgroundField"
               put the long ID of it into bcdFld
               set the opaque of it to true
               set the lockText of it to true
               set the autoHilite of it to true
               set the threeD of it to false
               set the showBorder of it to false
            end if
            if there is no control "backgroundGraphic" of tClickField
            then
               create graphic "backgroundGraphic"
               put the long ID of it into bcdGrc
               set the lineSize of it to 1
            end if
            if there is no control "cornerPiece" of tClickField
            then
               create graphic "cornerPiece"
               put the long ID of it into crrPcc
               set the opaque of it to true
               set the backgroundColor of it to 228,228,228
               set the foregroundColor of it to 228,228,228
            end if
            if there is no control "dragIndicator" of tClickField
            then
               create graphic "dragIndicator"
               set the visible of it to false
               put the long ID of it into drgInr
               set the enabled of it to false
               set the foregroundColor of it to 0,0,255
            end if
            if there is no control "editIndicator" of tClickField
            then
               create graphic "editIndicator"
               set the visible of it to false
               put the long ID of it into edtInr
               set the enabled of it to false
               set the foregroundColor of it to 0,0,255
            end if
            if there is no control "connectionLines" of tClickField
            then
               create graphic "connectionLines"
               set the style of it to "line"
               set the visible of it to false
               put the long ID of it into cnnLns
               set the enabled of it to false
               set the foregroundColor of it to 128,128,128
            end if
            if there is no control "verticalScrollbar" of tClickField
            then
               create scrollbar "verticalScrollbar"
               put the long ID of it into vrlScr
               set the behavior of it to the long ID of button "verticalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
               create scrollbar "horizontalScrollbar"
               put the long ID of it into hrlScr
               set the behavior of it to the long ID of button "horizontalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
            end if
            
            if there is no control "nodeTemplate" of tClickField
            then
               lock screen
               lock messages
               set the lockLoc of tClickField to true
               create graphic "nodeBackground"
               put the long ID of it into ndeBcd
               set the width of it to 1
               set the height of it to 1
               set the opaque of it to true
               set the lineSize of it to 0
   
               create button "firstIcon"
               set the visible of it to true
               put the long ID of it into frtIcn
               set the opaque of it to false
               set the showBorder of it to false
               set the showName of it to false
               set the autoHilite of it to false
               set the sharedHilite of it to false
               set the traversalOn of it to false
               set the threeD of it to false
               set the hiliteBorder of it to false
               set the borderWidth of it to 0
               set the margins of it to 0
               set the name of it to empty
               set the textSize of it to 1
               set the icon of it to "plus"
               set the height of it to 16 -- the formattedHeight of it
               set the width of it to 16 -- the formattedWidth of it
               set the name of it to "firstIcon"
   
               create button "secondIcon"
               set the visible of it to true
               put the long ID of it into scdIcn
               set the opaque of it to false
               set the showBorder of it to false
               set the showName of it to false
               set the autoHilite of it to false
               set the sharedHilite of it to false
               set the traversalOn of it to false
               set the threeD of it to false
               set the hiliteBorder of it to false
               set the borderWidth of it to 0
               set the margins of it to 0
               set the name of it to empty
               set the textSize of it to 1
               set the icon of it to "xpopen.gif"
               set the height of it to 16 -- the formattedHeight of it
               set the width of it to 16 -- the formattedWidth of it
               set the name of it to "secondIcon"
   
               create button "thirdIcon"
               set the visible of it to true
               put the long ID of it into thdIcn
               set the opaque of it to false
               set the showBorder of it to false
               set the showName of it to false
               set the autoHilite of it to false
               set the sharedHilite of it to false
               set the traversalOn of it to false
               set the threeD of it to false
               set the hiliteBorder of it to false
               set the borderWidth of it to 0
               set the margins of it to 0
               set the name of it to empty
               set the textSize of it to 1
               set the icon of it to "property.png"
               set the height of it to 16 -- the formattedHeight of it
               set the width of it to 16 -- the formattedWidth of it
               set the name of it to "thirdIcon"
   
               create field "nodeText"
               set the fixedLineHeight of it to false
               set the margins of it to 4,8,4,0
               set the lockText of it to true
               set the autoHilite of it to false
               set the listBehavior of it to false
               set the dontWrap of it to true
               set the showBorder of it to false
               set the borderWidth of it to 1
               set the threeD of it to false
               set the borderColor of it to "gray"
               set the visible of it to true
               set the sharedText of it to true
               set the textSize of it to empty
               set the textFont of it to empty
               put the long ID of it into ndeTxt
               set the opaque of it to false
               set the height of it to 16
               set the width of it to 64
   
               create graphic "firstBadge"
               put the long ID of it into frtBde
               set the style of it to "roundRect"
               set the roundRadius of it to 6
               set the opaque of it to true
               set the backgroundColor of it to "gray"
               set the showName of it to true
               set the margins of it to 2,2,2,6
               set the height of it to 16
               set the width of it to 32
   
               group ndeBcd and frtIcn and scdIcn and thdIcn and ndeTxt and frtBde
               put the long ID of the last group into tLongNodeTemplateID
               set the behavior of tLongNodeTemplateID to the long id of button "nodeBehavior" of card "Engine" of stack "rTreeEngine"
               set the lockLoc of tLongNodeTemplateID to false
               set the borderWidth of the last group to 0
               set the showBorder of the last group to false
               set the threeD of the last group to false
               set the hiliteColor of the last group to 193,196,227
               set the backgroundColor of the last group to empty
               set the margins of the last group to 0
               set the name of the last group to "nodeTemplate"
               set the left of frtIcn to the left of the last group
               set the top of frtIcn to the top of the last group
               set the left of scdIcn to the right of frtIcn
               set the top of scdIcn to the top of the last group
               set the left of thdIcn to the right of scdIcn
               set the top of thdIcn to the top of the last group 
               set the left of ndeTxt to the right of thdIcn
               set the top of ndeTxt to the top of the last group
               set the top of frtBde to the top of the last group
               set the height of the last group to 16
               set the width of the last group to the width of tClickField
               set the right of frtBde to the right of the last group
               set the rectangle of ndeBcd to the rectangle of the last group
               set the bottomLeft of the last group to the topLeft of tClickField
               stop editing tClickField
               set the rect of tClickField to tRect
               set the useGlobalData of tClickField to false
               send "calibrateScrollbar" to tClickField
               send "updateGeometry" to tClickField
               unlock messages
               unlock screen
            end if
            break
         case "Build Tree from|Open Stacks" ########################################################################################################################################
            -- lock screen
            -- lock messages
            put the millisec into ms ###
            repeat for each line tStackName in revLoadedStacks("application")
               put the long id of stack tStackName into tLongStackID
               switch
                  case the owner of tLongStackID is empty
                     put tLongStackID & cr after tNodeDataA[0]["children"]
                     put the short name of tLongStackID into tNodeDataA[tLongStackID]["name"]
                     put "false" into tNodeDataA[tLongStackID]["expanded"]
                     put "2223" into tNodeDataA[tLongStackID]["secondIconCollapsed"]
                     put "2223" into tNodeDataA[tLongStackID]["secondIconExpanded"]
                     break
                  case the owner of tLongStackID is not empty
                     put the long id of the owner of tLongStackID into tLongMainStackID
                     put tLongStackID & cr after tNodeDataA[tLongMainStackID]["children"]
                     put the short name of tLongStackID into tNodeDataA[tLongStackID]["name"]
                     put "false" into tNodeDataA[tLongStackID]["expanded"]
                     put "2539" into tNodeDataA[tLongStackID]["secondIconCollapsed"]
                     put "2539" into tNodeDataA[tLongStackID]["secondIconExpanded"]
                     break
               end switch
               repeat with i = 1 to the number of cards of tLongStackID
                  put the long id of card i of tLongStackID into tLongRelativeCardName
                  
                  put tLongRelativeCardName & cr after tNodeDataA[tLongStackID]["children"]
                  put "false" into tNodeDataA[tLongRelativeCardName]["expanded"]
                  put the short name of card i of tLongStackID & cr after tNodeDataA[tLongRelativeCardName]["name"]
                  put "2533" into tNodeDataA[tLongRelativeCardName]["secondIconCollapsed"]
                  put "2533" into tNodeDataA[tLongRelativeCardName]["secondIconExpanded"]
                  -- repeat 10 times
                  repeat with j = 1 to the number of controls of tLongRelativeCardName
                     put the long id of control j of tLongRelativeCardName into tLongRelativeControlName
                     put the long id of the owner of tLongRelativeControlName into tLongRelativeParentName
                     put cr & tLongRelativeControlName after tNodeDataA[tLongRelativeParentName]["children"]
                     put the short name of tLongRelativeControlName into tNodeDataA[tLongRelativeControlName]["name"]
                     if tClickField is tLongRelativeControlName
                     then
                        put "false" into tNodeDataA[tLongRelativeControlName]["visible"]
                     end if
                     
                     put "script of" && tLongRelativeControlName into tLongScriptID
                     put tLongScriptID into tNodeDataA[tLongRelativeControlName]["children"]
                     
                     put "properties of" && tLongRelativeControlName into tLongPropertiesID
                     put cr & tLongPropertiesID after tNodeDataA[tLongRelativeControlName]["children"]
                     put "customProperties of" && tLongRelativeControlName into tLongCustomPropertiesID
                     put cr & tLongCustomPropertiesID after tNodeDataA[tLongRelativeControlName]["children"]
                     put "customPropertysets of" && tLongRelativeControlName into tLongCustomPropertySetsID
                     put cr & tLongCustomPropertySetsID after tNodeDataA[tLongRelativeControlName]["children"]
                     
                     put "false" into tNodeDataA[tLongScriptID]["expanded"]
                     put "script" into tNodeDataA[tLongScriptID]["name"]
                     put "2861" into tNodeDataA[tLongScriptID]["secondIconCollapsed"]
                     put "2861" into tNodeDataA[tLongScriptID]["secondIconExpanded"]
                     
                     put "false" into tNodeDataA[tLongPropertiesID]["expanded"]
                     put "properties" into tNodeDataA[tLongPropertiesID]["name"]
                     put "2544" into tNodeDataA[tLongPropertiesID]["secondIconCollapsed"]
                     put "2544" into tNodeDataA[tLongPropertiesID]["secondIconExpanded"]
                     
                     put the keys of (the properties of tLongRelativeControlName) into tNodeDataA[tLongPropertiesID]["children"]
                     sort tNodeDataA[tLongPropertiesID]["children"]
                     
                     put "false" into tNodeDataA[tLongCustomPropertiesID]["expanded"]
                     put "customProperties" into tNodeDataA[tLongCustomPropertiesID]["name"]
                     put "2543" into tNodeDataA[tLongCustomPropertiesID]["secondIconCollapsed"]
                     put "2543" into tNodeDataA[tLongCustomPropertiesID]["secondIconExpanded"]
                     
                     put "false" into tNodeDataA[tLongCustomPropertySetsID]["expanded"]
                     put "customPropertySets" into tNodeDataA[tLongCustomPropertySetsID]["name"]
                     put "2560" into tNodeDataA[tLongCustomPropertySetsID]["secondIconCollapsed"]
                     put "2560" into tNodeDataA[tLongCustomPropertySetsID]["secondIconExpanded"]
                     
                     switch word 1 of tLongRelativeControlName
                        case "audioclip"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2224" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2224" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break
                        case "button"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2540" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2540" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break  
                        case "field"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2542" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2542" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break
                        case "graphic"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2535" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2535" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break
                        case "group"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2536" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2536" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break
                        case "image"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2537" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2537" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break
                        case "scrollbar"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2538" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2538" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break
                        case "videoclip"
                           put "false" into tNodeDataA[tLongRelativeControlName]["expanded"]
                           put "2225" into tNodeDataA[tLongRelativeControlName]["secondIconCollapsed"]
                           put "2225" into tNodeDataA[tLongRelativeControlName]["secondIconExpanded"]
                           break
                     end switch
                  end repeat
                  -- end repeat
               end repeat
            end repeat
            set the nodeData of tClickField to tNodeDataA
            put the millisec - ms ###
            send "renderTree" to tClickField
            break
         case "Build Tree from|Older rTree Format"
            -- setDialogProperties
            ask "Please enter the long name of your old rTree control!"
            -- wait until mouse(1) is "down"
            -- wait until mouse(1) is "up"
            -- wait until the mouseClick
            -- put the mouseControl ###
            -- wait 1 sec
            -- put "the mouseControl" && the long ID of the mouseControl ###
            -- send "delete_allNodeData" to tClickField
            -- send "delete_allTreeData" to tClickField
            set the itemDelimiter to "_"
            -- put the long ID of control ID 9716 of stack the mainStack of this stack into it
            -- put tClickField into it
            
            -- put the long id of the mouseControl into it
            -- put the long id of the mouseControl into it
            -- put the long id of fld it into it
            -- put it ###
            repeat for each line tCustomPropertySet in the customPropertySets of it
               set the customPropertySet of it to tCustomPropertySet
               put the customProperties of it into tCustomPropertiesA
               if item 1 of tCustomPropertySet is "htmlText"
               then
                  set the customPropertySet of tClickField to "htmlTextIMPORTED_of_node_ID_"
                  set the customProperties of tClickField to tCustomPropertiesA
                  set the customPropertySet of tClickField to empty
                  next repeat
               end if
               if item 1 of tCustomPropertySet is "text"
               then
                  set the customPropertySet of tClickField to "textIMPORTED_of_node_ID_"
                  set the customProperties of tClickField to tCustomPropertiesA
                  set the customPropertySet of tClickField to empty
                  next repeat
               end if
               repeat for each key tKey in tCustomPropertiesA
                  put tCustomPropertiesA[tKey] into tNodeDataA[tKey][item 1 of tCustomPropertySet]
               end repeat
            end repeat
            set the customPropertySet of it to empty
            put the nodeIDs of it into tIDs
            
            repeat for each line tID in tIDs
               put tID into line tNodeDataA[tID]["depth"] + 1 of tIDpath
               delete line tNodeDataA[tID]["depth"] + 2 to - 1 of tIDpath
               switch
                  case tNodeDataA[tID]["depth"] > 0
                     put cr & tID after tNodeDataA[line - 2 of tIDpath]["children"]
                     if character 1 of tNodeDataA[line - 2 of tIDpath]["children"] is cr
                     then
                        delete character 1 of tNodeDataA[line - 2 of tIDpath]["children"]
                     end if
                     break
                  case tNodeDataA[tID]["depth"] is 0 or tNodeDataA[tID]["depth"] is empty
                     put tID & cr after tRootNodeIDs
                     break
               end switch
            end repeat
            if character - 1 of tRootNodeIDs is cr then delete character - 1 of tRootNodeIDs
            
            repeat for each line tProperty in the keys of (the customProperties of it)
               set the tProperty of tClickField to the tProperty of it
            end repeat
            -- set the customProperties of tClickField to the customProperties of it
            
            set the rootNodeIDs of tClickField to tRootNodeIDs
            set the nodeData of tClickField to tNodeDataA
            send "renderTree" to tClickField
            answer "The old format rTree data was sucessfully imported to your rTree" && the rTreeVersion of stack "rTreeEngine" && "!"
            break
         case "Delete Node Data"
            answer warning "Are you sure you want to delete the node data? This can not be undone!" with "Yes" and "No"
            if it is "No"
            then
               exit to top
            end if
            send "delete_nodeData" to tClickField
            send "renderTree" to tClickField
            break
         case "Delete All Node Data"
            answer warning "Are you sure you want to delete all the node data? This can not be undone!" with "Yes" and "No"
            if it is "No"
            then
               exit to top
            end if
            send "delete_allNodeData" to tClickField
            send "renderTree" to tClickField
            break
         case "Delete Tree Data"
            answer warning "Are you sure you want to delete the tree data? This can not be undone!" with "Yes" and "No"
            if it is "No"
            then
               exit to top
            end if
            send "delete_treeData" to tClickField
            send "renderTree" to tClickField
            break
         case "Delete All Tree Data"
            answer warning "Are you sure you want to delete all the tree data? This can not be undone!" with "Yes" and "No"
            if it is "No"
            then
               exit to top
            end if
            send "delete_allTreeData" to tClickField
            send "renderTree" to tClickField
            break
         case "Refresh From Node Template"
            send "delete_nodeContainers" to tClickField
            send "renderTree" to tClickField
            break
         case "New Node"
            repeat with x = the number of lines of the nodeContainerIDs of tClickField down to 1
               if the visible of control ID (line x of the nodeContainerIDs of tClickField) of tClickField is true
               then
                  exit repeat
               end if
            end repeat
            switch
               case item 2 of sTreeClickLoc < the top of tClickField + the topMargin of tClickField
                  send "create_node" && "as root 1" to tClickField
                  break
               case item 2 of sTreeClickLoc > the top of tClickField + the topMargin of tClickField -- the bottom of control ID (line x of the nodeContainerIDs of tClickField) of tClickField
                  send "create_node" && "as root - 1" to tClickField
                  break
            end switch
            send "renderTree" to tClickField
            break
         case "Themes|Win"
            # Set Tree properties.
            # Icons located in card "Images" of stack "rTreeEngine"
            set the useFirstIcon of tClickField to true
            set the useSecondIcon of tClickField to true
            set the useThirdIcon of tClickField to false
            set the firstIconCollapsed of tClickField to "10500" # Minus Icon. 
            set the firstIconExpanded of tClickField to "10501" # Plus Icon.
            set the secondIconCollapsed of tClickField to "10504" # XP Closed-Folder Icon.
            set the secondIconExpanded of tClickField to "10503" # XP Open-Folder Icon.
            set the fileIcon of tClickField to "10505" # XP File Icon.
            repeat for each line tNodeID in the nodeIDs of tClickField
               if the effectiveNodeData[tNodeID,"leaf"] of me is true
               then
                  put "file" into tNodeTypeA[tNodeID]
                  put 2 into tIndentA[tNodeID]
               end if
            end repeat
            dispatch "renderTree" to tClickField
            break
            case "Themes|Mac"
            # Set Tree properties.
            # Icons located in card "Images" of stack "rTreeEngine"
            set the firstIconCollapsed of tClickField to "10522" # Minus Icon. 
            set the firstIconExpanded of tClickField to "10523" # Plus Icon.
            set the secondIconCollapsed of tClickField to "10531" # XP Closed-Folder Icon.
            set the secondIconExpanded of tClickField to "10532" # XP Open-Folder Icon.
            set the fileIcon of tClickField to "10533" # XP File Icon.
            repeat for each line tNodeID in the nodeIDs of tClickField
               if tLeafA[tNodeID] is true
               then
                  put "file" into tNodeTypeA[tNodeID]
                  put 5 into tIndentA[tNodeID]
               end if
            end repeat
            dispatch "renderTree" to tClickField
            break
         case "Themes|Mini"
            # Set Tree properties.
            # Icons located in card "Images" of stack "rTreeEngine"
            set the firstIconCollapsed of tClickField to "10500" # Minus Icon. 
            set the firstIconExpanded of tClickField to "10501" # Plus Icon.
            set the useSecondIcon of tClickField to false
            set the useThirdIcon of tClickField to false
            set the fileIcon of tClickField to empty # XP File Icon.
            repeat for each line tNodeID in the nodeIDs of tClickField
               if tLeafA[tNodeID] is true
               then
                  put "file" into tNodeTypeA[tNodeID]
                  put 2 into tIndentA[tNodeID]
               end if
            end repeat
            dispatch "renderTree" to tClickField
            break
         case "Use First Badge"
            lock screen
            put lineOffset("Use First Badge" , the text of me) into tLineNum
            if character 1 to 2 of line tLineNum of the text of me is "!c"
            then
               put "!n" into character 1 to 2 of line tLineNum of me
               set the useFirstBadge of tClickField to false
            else
               put "!c" into character 1 to 2 of line tLineNum of me
               set the useFirstBadge of tClickField to true
            end if
            dispatch "renderTree" to tClickField
            break
         case "Use Left-Badges"
            lock screen
            put lineOffset("Use Left-Badges" , the text of me) into tLineNum
            if character 1 to 2 of line tLineNum of the text of me is "!c"
            then
               put "!n" into character 1 to 2 of line tLineNum of me
               set the useLeftBadges of tClickField to false
            else
               put "!c" into character 1 to 2 of line tLineNum of me
               set the useLeftBadges of tClickField to true
            end if
            dispatch "renderTree" to tClickField
            break
         case "Use Sublines"
            lock screen
            put lineOffset("Use Sublines" , the text of me) into tLineNum
            if character 1 to 2 of line tLineNum of the text of me is "!c"
            then
               put "!n" into character 1 to 2 of line tLineNum of me
               repeat for each line tNodeID in the nodeIDs of tClickField
                  -- set the sublines_of_node_ID_[tNodeID] of tClickField to empty
                  set the nodeData[tNodeID,"text of line 2"] of tClickField to empty
               end repeat
            else
               put "!c" into character 1 to 2 of line tLineNum of me
               ask "Please enter new Sublines for the Nodes"
               repeat for each line tNodeID in the nodeIDs of tClickField
                  -- set the sublines_of_node_ID_[tNodeID] of tClickField to it
                  set the nodeData[tNodeID,"text of line 2"] of tClickField to it
               end repeat
            end if
            dispatch "renderTree" to tClickField
            break
         case "Use Connection Lines"
            lock screen
            put lineOffset("Use Connection Lines" , the text of me) into tLineNum
            if character 1 to 2 of line tLineNum of the text of me is "!c"
            then
               put "!n" into character 1 to 2 of line tLineNum of me
               set the useConnectionLines of tClickField to false
            else
               put "!c" into character 1 to 2 of line tLineNum of me
               set the useConnectionLines of tClickField to true
            end if
            dispatch "renderTree" to tClickField
            break
         case "Show Invisible Nodes"
            lock screen
            put lineOffset("Show Invisible Nodes" , the text of me) into tLineNum
            if character 1 to 2 of line tLineNum of the text of me is "!c"
            then
               put "!n" into character 1 to 2 of line tLineNum of me
               set the showInvisibleNodes of tClickField to false
            else
               put "!c" into character 1 to 2 of line tLineNum of me
               set the showInvisibleNodes of tClickField to true
            end if
            dispatch "renderTree" to tClickField
            break
         case "Use Global Data"
            lock screen
            put lineOffset("Use Global Data" , the text of me) into tLineNum
            if the useGlobalData of tClickField is true
            then
               put "!n" into character 1 to 2 of line tLineNum of me
               set the useGlobalData of tClickField to false
            else
               put "!c" into character 1 to 2 of line tLineNum of me
               set the useGlobalData of tClickField to true
            end if
            dispatch "renderTree" to tClickField
            break
         case "Refresh"
            dispatch "renderTree" to tClickField
            break
         case "Properties"
            put the customProperties of tClickField into tCustomProperties
            repeat for each key tKey in tCustomProperties
               replace cr with comma in tCustomProperties[tKey]
            end repeat
            combine tCustomProperties using cr and tab
            -- put tCustomProperties into field "TreeProperties" of card "TreeProperties" of stack "rTreeEngine"
            -- set the rectangle of stack "rTreeEngine" to the ResizedRectangle of card "TreeProperties" of stack "rTreeEngine"
            -- set the LongrTreeID of card "TreeProperties" of stack "rTreeEngine" to tClickField
            -- go to card "TreeProperties" of stack "rTreeEngine"
            set the visible of stack "rTreeEngine" to true
            -- put tCustomProperties into field "TreeProperties" of card "TreeProperties" of stack "rTreeEngine"
            -- set the width of field "TreeProperties" of stack "rTree Property Inspector" to the formattedWidth of field "TreeProperties" of stack "rTree Property Inspector"
            -- set the label of stack "rTree Property Inspector" to the name of tClickField & ", ID" && tFieldID
            -- palette stack "rTree Property Inspector"
            break
         case "Restore"
            set the globalRootNodeIDs of tClickField to the restoreGlobalRootNodeIDs of tClickField
            set the globalNodeData of tClickField to the restoreGlobalNodeData of tClickField
            set the rootNodeIDs of tClickField to the restoreRootNodeIDs of tClickField
            set the nodeData of tClickField to the restoreNodeData of tClickField
            send "savePersistentData" to tClickField
            send "renderTree" to tClickField
            break
      end switch
   end if
   -- click at 0,0 # Needed to make field receive "mouseMove" as it loses focus when going to this menu. BUG?
   unlock screen
end menuPick
