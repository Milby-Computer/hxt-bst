Script "stack_revNavigator"

/*
# Name: stack "revNavigator"
# ID: stack "revNavigator"
# Hash: p3XqEaKtwEpZBde8QC8A8Q==
*/


global gScriptBuddyIDarray,gScriptBuddyLineArray,gSBUpdateSelection,gSBLeadSpaces,gSBThisStack
global gSBUpdateMessage,gSBLastFieldUpdate,gSBLastObjectCount,gSBWhichStack,gSBWhichCard
global gSBCardOrBackground,gSBWhichBackground,gSBControlSets,gSBMenuLines,gSBMenuHistoryOffset
global gSBLastLinesSelected
global gSBShowList -- if true, show a list of cards/backgrounds
global gSBUpdateDisplayMessage -- contains the id of the message to update the display
global gSBUpdateListMessage -- contains the id of the message to update the list
global gSBshowTooltip -- show tooltip
global gSBCustomCommands -- the menu of custom commands available
global gSBInRev -- True if we are in the Rev environment, false if in MetaCard
global gSBShowAllStacks -- True if we should show all stacks; user stacks only otherwise

local tSetupComplete

on openStack
  doSetup
end openStack

on doReport p
  put ticks() && p
end doReport

on doSetup
  put "revNavigator" into gSBThisStack
  show this stack
  set the wholeMatches to true
  if there is a stack "revMenuBar" then
    put true into gSBInRev
    enableDisableGetScripts
    put lineOffset("(Edit Properties",btn "Actions") into tItem
    if tItem > 0 then
      delete char 1 of line tItem of btn "Actions"
    end if
    put the basicItems of btn "popup" into tPopupBasicItems
    put lineOffset("(Edit Properties",tPopupBasicItems) into tItem
    if tItem > 0 then
      delete char 1 of line tItem of tPopupBasicItems
      set the basicItems of btn "popup" to tPopupBasicItems
    end if
    finishSetup
  else
    put false into gSBInRev
    if the mode of stack gSBThisStack is 4 then
      finishSetup
      insert the script of button "revNavigatorFront" into front
    else
      disableGetScripts
      put lineOffset("Edit Properties",btn "Actions") into tItem
      if tItem > 0 then
        put "(" before line tItem of btn "Actions"
      end if
      put the basicItems of btn "popup" into tPopupBasicItems
      put lineOffset("Edit Properties",tPopupBasicItems) into tItem
      if tItem > 0 then
        put "(" before line tItem of tPopupBasicItems
        set the basicItems of btn "popup" to tPopupBasicItems
      end if
      send "mcOpenStack" to me in 10 ticks
    end if
  end if
end doSetup

on enableDisableGetScripts
  if the version < 2.5 then
    disableGetScripts
  else
    enableGetScripts
  end if
end enableDisableGetScripts


on disableGetScripts
  set the wholeMatches to true
  put lineOffset("Get Scripts",btn "Actions") into tItem
  if tItem > 0 then
    put "(" before line tItem of btn "Actions"
  end if
end disableGetScripts

on enableGetScripts
  set the wholeMatches to true
  put lineOffset("(Get Scripts",btn "Actions") into tItem
  if tItem > 0 then
    delete char 1 of line tItem of btn "Actions"
  end if
end enableGetScripts

on mcOpenStack
  palette stack gSBThisStack
end mcOpenStack

on finishSetup
  --put "test" && gSBThisStack && "this"
  set the minHeight of stack gSBThisStack to 120
  set the minWidth of stack gSBThisStack to 170
  put the showToolTip of stack gSBThisStack into gSBshowTooltip
  put "     " into gSBLeadSpaces
  put false into gSBShowList
  put "the topStack" into gSBWhichStack
  put "this card" into gSBWhichCard
  put "card" into gSBCardOrBackground
  put the UpdateListAutomatically of this stack into gSBUpdateListAutomatically
  set the customPropertySet of me to "gSBControlSetsProp"
  put the customProperties of me into gSBControlSets
  set the customPropertySet of me to empty
  buildCustomCommandList
  --answer tMenuText
  setSeparatorLine
  --send "updateMyControlSets" to btn "Actions"
  put true into tSetupComplete
  updateDisplay
  show group "about" with visual effect dissolve fast
  if (the hilite of btn "I paid") then hide group "about" with visual effect dissolve fast
end finishSetup

on closeStack
  --send "cleanMyControlSets" to btn "Actions"
  set the customPropertySet of me to "gSBControlSetsProp"
  set the customProperties of me to gSBControlSets
  put empty into fld "list"
  put empty into fld "filter"
  put empty into fld "command"
  if not gSBInRev then
    remove the script of button "revNavigatorFront" from front
  end if
  send "showNavigator" to this cd
  save me
end closeStack

on revPreOpenCard
  if tSetupComplete then updateDisplay
end revPreOpenCard

on revPreOpenStack
  if tSetupComplete then updateDisplay
end revPreOpenStack

on revResumeStack
  if tSetupComplete then updateDisplay
end revResumeStack

on revSelectedObjectChanged
  if tSetupComplete then updateListSelection
end revSelectedObjectChanged


on updateListSelection
  cancel gSBUpdateListMessage
  send ("doUpdateListSelection") to me in 10 ticks
  put the result into gSBUpdateListMessage
end updateListSelection

on doUpdateListSelection
  --put ticks() && "doUpdateListSelection" & cr after message box  -- debug
  
  if gSBUpdateSelection then
    put false into gSBUpdateSelection
    exit doUpdateListSelection
  end if
  if gSBShowList then exit doUpdateListSelection
  if (gSBWhichStack is not "the topStack") then exit doUpdateListSelection
  if (gSBWhichCard is not "this card") then exit doUpdateListSelection
  --if the mouse is "down" then exit doUpdateListSelection
  put the number of controls of the topStack into tNumControls
  
  if tNumControls is not gSBLastObjectCount then
    cancel gSBUpdateDisplayMessage
    doUpdateDisplay true
    put tNumControls into gSBLastObjectCount
  end if
  put the selectedObjects into tObjects
  put empty into tLineList
  put the separatorLine of fld "list" into tStart
  --put tStart
  repeat for each line tObject in tObjects
    if gScriptBuddyIDarray[tObject] is not empty then put (tStart + gScriptBuddyIDarray[tObject]) & "," after tLineList
  end repeat
  delete char -1 of tLineList
  set the hilitedLines of fld "list" of stack gSBThisStack to tLineList
  set the pHilitedLines of fld "list" of stack gSBThisStack to tLineList
  
end doUpdateListSelection



on updateRevSelectedObjects
  if gSBShowList then exit updateRevSelectedObjects
  if (gSBWhichStack is not "the topStack") then exit updateRevSelectedObjects
  if (gSBWhichCard is not "this card") then  exit updateRevSelectedObjects
  
  put the hilitedLines of fld "list" into tLineNumbers
  put the separatorLine of fld "list" into tSeparatorLine
  put "select " into tLinesToSelect
  repeat for each item tItem in tLineNumbers
    if tItem < (tSeparatorLine + 3) then next repeat
    put tItem - tSeparatorLine into tKey
    put gScriptBuddyLineArray[tKey] && "and " after tLinesToSelect
  end repeat
  if tLinesToSelect is not "select " then
    delete word -1 of tLinesToSelect
  else
    put "empty" after tLinesToSelect
  end if
  if tLinesToSelect is gSBLastLinesSelected then exit updateRevSelectedObjects
  put tLinesToSelect into gSBLastLinesSelected
  put true into gSBUpdateSelection
  if the number of items of tLineNumbers > 5 then lock screen
  do tLinesToSelect
  if the number of items of tLineNumbers > 5 then unlock screen
  --put false into gSBUpdateSelection
  --add 1 to fld 1 of stack "bob"
end updateRevSelectedObjects

on updateDisplay pForceUpdate
  cancel gSBUpdateDisplayMessage
  send ("doUpdateDisplay" && pForceUpdate) to me in 30 ticks
  put the result into gSBUpdateDisplayMessage
end updateDisplay

on doUpdateDisplay pForceUpdate
  --answer "test"
  --put ticks() && "doUpdateDisplay" & cr after message box  -- debug
  --exit doUpdateDisplay
  --put "go"
  --put ticks(),gSBWhichStack,gSBCardOrBackground,gSBWhichCard,gSBWhichBackground
  
  put the separatorLine of fld "list" of stack gSBThisStack into tStart
  delete variable gScriptBuddyIDarray
  delete variable gScriptBuddyLineArray
  
  put "<p><font color=" & quote & the pColorDefault of stack gSBThisStack & quote & ">" into tColor[false]
  
  put "<p><font color=" & quote & the pColorScriptedObject of stack gSBThisStack & quote & ">" into tColor[true]
  put the ColorScriptedObjects of stack gSBThisStack into tCheckScripts
  put the pIndentString of stack gSBThisStack into tIndentString
  
  
  
  if (gSBShowList and gSBCardOrBackground is "stack") then
    disable btn "whichCard" of stack gSBThisStack
    put "</font></p>" & cr before tColor[true]
    put "</font></p>" & cr before tColor[false]
    
    --gSBShowAllStacks
    put the mainStacks into tStackList
    
    put the pObjectLimit of stack gSBThisStack into tObjectLimit
    put empty into tControlList
    put 0 into tCurrentLine
    
    --answer "test"
    repeat for each line tStack in tStackList
      
      if (not gSBShowAllStacks) and (filterStacksList(tStack) is empty) then next repeat
      add 1 to tCurrentLine
      if tCurrentLine > tObjectLimit then exit repeat
      put "stack" && quote & tStack & quote into tStackName
      --answer "test" && tCheckScripts
      
      put tColor[tCheckScripts and (the password of stack tStack is empty) and (the script of stack tStack is not empty)] & tStackName after tControlList
      --answer "test"
      put tCurrentLine into gScriptBuddyIDarray[tStackName]
      put tStackName into gScriptBuddyLineArray[tCurrentLine]
      put the substacks of stack tStack into tSubstackList
      
      repeat for each line tSubstack in tSubstackList
        add 1 to tCurrentLine
        if tCurrentLine > tObjectLimit then exit repeat
        put "stack" && quote & tSubstack & quote into tSubstackName
        put tColor[tCheckScripts and (the password of stack tSubstack is empty) and (the script of stack tSubstack is not empty)] & tIndentString & tSubstackName after tControlList
        put tCurrentLine into gScriptBuddyIDarray[tSubstackName]
        put tSubstackName into gScriptBuddyLineArray[tCurrentLine]
      end repeat
    end repeat
    delete line 1 of tControlList -- deletes the initial stack reference that is in all other displays
    --put ticks() && "doUpdateDisplay" && tControlList & cr after message box  -- debug
    
    
  else
    enable btn "whichCard" of stack gSBThisStack
    
    if gSBWhichStack is empty then exit doUpdateDisplay
    --  put "this"
    if not ((the UpdateListAutomatically of this stack) or pForceUpdate) then exit doUpdateDisplay
    --  put "test"
    
    if gSBWhichStack is "the topStack" then
      put the short name of the topStack into tStackName
    else
      put gSBWhichStack into tStackName
      if not (there is a stack tStackName) then
        beep
        put tStackName && "stack not found"
        exit doUpdateDisplay
      end if
    end if
    put the name of stack tStackName into tStackID
    
    
    if not gSBShowList then
      
      put getCardOrBGid(tStackID) into tCardOrBGid
      if tCardOrBGid is empty then exit doUpdateDisplay
      --put "id is" && tCardOrBGid
    end if -- not gSBShowList
    
    --  get the number of controls of the topstack
    --  exit doUpdateDisplay
    --answer the separatorLine of fld "list" of stack gSBThisStack
    put fld "filter" into tFilter
    put "new button,new field,new scrollbar,new graphic,new image,card id,group id" into tRejectList
    replace comma with cr in tRejectList
    set the itemDelimiter to quote
    
    put the NamedObjectsOnly of this stack into tNamedObjectsOnly
    put the ScriptedObjectsOnly of this stack into tScriptedObjectsOnly
    put not (the UseNames of this stack) into tUseIDs
    put the UseLongNameorID of this stack into tUseLongNameOrID
    
    
    put tColor[tCheckScripts and (the password of stack tStackName is empty) and (the script of stack tStackName is not empty)] & "<b>stack" && quote & tStackName & quote & "</b>" into tControlList
    put tStackID into gScriptBuddyLineArray[1]
    
    put "</font></p>" & cr before tColor[true]
    put "</font></p>" & cr before tColor[false]
    
    if the password of tStackID is not empty then put false into tCheckScripts
    if gSBShowList then
      put 1 into tCurrentLine
      put 1 into tCurrentIndentLine
      if gSBCardOrBackground is "card" then
        put the number of cds of tStackID into tControlCount
      else
        put the number of bgs of tStackID into tControlCount
      end if
    else
      put tColor[tCheckScripts and (the script of tCardOrBGid is not empty)] & "<b>" & the name of tCardOrBGid & "</b>"after tControlList
      put tCardOrBGid into gScriptBuddyLineArray[2]
      put the number of controls of tCardOrBGid into tControlCount
      put 2 into tCurrentLine
      put 2 into tCurrentIndentLine
    end if
    
    
    
    put min(the pObjectLimit of stack gSBThisStack,tControlCount) into tControlCount
    if gSBWhichStack is "the topStack" \
        and not (the ShowRevStacks of stack gSBThisStack) then
      put the short name of the topStack into tStackName
      if filterStacksList(tStackName) is empty then
        put 0 into tControlCount
      end if
    end if
    
    --put ticks() && "doUpdateDisplay" && tStackName & cr after message box  -- debug
    --exit doUpdateDisplay
    
    put the defaultStack into tPrevDefaultStack
    set the defaultStack to tStackName
    --put ticks() into tStartTime
    
    repeat with i = 1 to tControlCount
      add 1 to tCurrentIndentLine
      
      if gSBShowList then
        if gSBCardOrBackground is "card" then
          put the long id of cd i into tID --of tStackID into tID  --defaultStack test
        else
          put the long id of bg i into tID --of tStackID into tID  --defaultStack test
        end if
      else
        put the long id of control i of tCardOrBGid into tID
      end if
      put the name of tID into tName
      if (tNamedObjectsOnly and \
          (quote is not in tName or \
          word 1 to 2 of item 2 of tName is among the lines of tRejectList)) then \
          next repeat
      if (tScriptedObjectsOnly and \
          (the script of tID is empty)) then \
          next repeat
      if tUseIDs then
        if tUseLongNameOrID then
          put tID into tName
        else
          put the abbreviated id of tID into tName
        end if
      else if tUseLongNameOrID then
        put the long name of tID into tName
      end if
      if tFilter is not empty and tFilter is not in tName then next repeat
      
      add 1 to tCurrentLine
      if word 1 of tName is "group" and (not gSBShowList) then
        repeat with tWhichIndentCount = (tCurrentIndentLine +1) to (tCurrentIndentLine + (the number of controls of tID))
          put tIndentString before tIndent[tWhichIndentCount]
        end repeat
      end if
      put tIndent[tCurrentIndentLine] before tName
      put tColor[tCheckScripts and (the script of tID is not empty)] & tName after tControlList
      put tCurrentLine into gScriptBuddyIDarray[tID]
      put tID into gScriptBuddyLineArray[tCurrentLine]
    end repeat
    set the defaultStack to tPrevDefaultStack
  end if
  put "</font></p>" after tControlList
  --put ticks() && "doUpdateDisplay" && tControlList & cr after message box  -- debug
  
  if gSBWhichStack is "the topStack" \
      and not (the ShowRevStacks of stack gSBThisStack)\
      and char 1 to 3 of the short name of the topStack is "rev" then
    delete line tStart + 1 to -1 of fld "list" of stack gSBThisStack
    put empty into gSBLastFieldUpdate
  else
    if (not pForceUpdate) and tControlList is gSBLastFieldUpdate then exit doUpdateDisplay
    put the scroll of fld "list" into tScroll
    put cr & " " after fld "List" of stack gSBThisStack
    set the htmlText of line tStart + 1 to -1 of fld "list" of stack gSBThisStack to tControlList
    set the scroll of fld "list" to tScroll
    put tControlList into gSBLastFieldUpdate
  end if
  set the hilitedLines of fld "list" of stack gSBThisStack to empty
  set the pHilitedLines of fld "list" of stack gSBThisStack to empty
end doUpdateDisplay

function getCardOrBGid tStackID
  put empty into tReturnID
  if gSBCardOrBackground is "card" then
    if gSBWhichCard is "this card" then
      put the long id of this cd of tStackID into tReturnID
    else if word 1 to 2 of gSBWhichCard is "card id" then
      put word 3 of gSBWhichCard into tCardID
      if (there is a card id tCardID of tStackID) then
        put the long id of cd id tCardID of tStackID into tReturnID
      else
        beep
        put gSBWhichCard && "of" && tStackID && "not found"
      end if
    else
      if there is a card gSBWhichCard of tStackID then
        put the long id of card gSBWhichCard of tStackID into tReturnID
      else
        beep
        put gSBWhichCard && "card of" && tStackID && "not found"
      end if
    end if
  else if gSBCardOrBackground is "background" then
    if word 1 to 2 of gSBWhichBackground is "group id" then
      put word 3 of gSBWhichBackground into tBGID
      if there is a bg id tBGID of tStackID then
        put the long id of bg id tBGID of tStackID into tReturnID
      else
        beep
        put gSBWhichBackground && "of" && tStackID && "not found"
      end if
    else
      if there is a bg gSBWhichBackground of tStackID then
        put the long id of bg gSBWhichBackground of tStackID into tReturnID
      else
        beep
        put gSBWhichBackground && "background of" && tStackID && "not found"
      end if
    end if
  end if
  return tReturnID
end getCardOrBGid

on setBookmarks pWhichLine,pIDList
  if pIDList is empty then
    if pWhichLine is empty then
      put the hilitedLines of fld "list" into tListOfLines
    else
      put pWhichLine into tListOfLines
    end if
  end if
  put the separatorLine of fld "list" into tLowerLimit
  set the wholeMatches to true
  put empty into tAddList
  
  
  put the ColorScriptedObjects of stack gSBThisStack into tCheckScripts
  
  put "<p><font color=" & quote & the pColorDefault of stack gSBThisStack & quote & "><a name=" & quote into tColor[false]
  put "<p><font color=" & quote & the pColorScriptedObject of stack gSBThisStack & quote & "><a name=" & quote into tColor[true]
  put "</a></font></p>" & cr into tEndString
  
  put line 1 to tLowerLimit of fld "list" into tList
  if pIDList is empty then
    repeat for each item i in tListOfLines
      if i <= tLowerLimit then next repeat
      put i - tLowerLimit into tKey
      put gScriptBuddyLineArray[tKey] into tID
      if not (there is a tID) then next repeat
      put gSBLeadSpaces & (the long name of tID) into tObjectName
      if lineOffset(tObjectName,tList) > 0 then next repeat
      -- add the object
      put tColor[tCheckScripts and (the script of tID is not empty)] after tAddList
      replace quote with numtochar(1) in tID
      put tID & quote & ">" & tObjectName & tEndString after tAddList
    end repeat
  else
    repeat for each line tID in pIDList
      if not (there is a tID)then next repeat
      put gSBLeadSpaces & (the long name of tID) into tObjectName
      if lineOffset(tObjectName,tList) > 0 then next repeat
      -- add the object
      put tColor[tCheckScripts and (the script of tID is not empty)] after tAddList
      replace quote with numtochar(1) in tID
      put tID & quote & ">" & tObjectName & tEndString after tAddList
    end repeat
  end if
  if tAddList is empty then exit setBookmarks
  put cr before fld "list"
  set the htmlText of line 1 of fld "list" to tAddList
  setSeparatorLine
end setBookmarks

on removeBookmarks pWhichLine
  if pWhichLine is empty then
    put the hilitedLines of fld "list" into tListOfLines
  else
    put pWhichLine into tListOfLines
  end if
  put the separatorLine of fld "list" into tSeparatorLine
  put the htmlText of line 1 to tSeparatorLine of fld "list" into tBookmarkHTML
  put 0 into tWhichLine
  put empty into tNewHTML
  repeat for each line L in tBookMarkHTML
    add 1 to tWhichLine
    if tWhichLine is among the items of tListOfLines then next repeat
    put L & cr after tNewHTML
  end repeat
  set the htmlText of line 1 to tSeparatorLine of fld "list" to tNewHTML
  --  put empty into tRemoveList
  --  repeat for each item i in tListOfLines
  --    if i > tUpperLimit then exit repeat
  --    put i & cr after tRemoveList
  --  end repeat
  --  sort lines of tRemoveList descending
  --  repeat for each line L in tRemoveList
  --    delete line L of fld "list"
  --  end repeat
  set the wholeMatches to true
  setSeparatorLine
end removeBookmarks

on bookmarkRemove pWhichLine
  if pWhichLine > the separatorLine of fld "list" then
    setBookmarks pWhichLine
  else
    removeBookmarks pWhichLine
  end if
end bookmarkRemove

on setSeparatorLine
  put lineoffset(cr & "stack",fld "list" of stack gSBThisStack) into tOffset
  if tOffset is 0 and (char 1 to 5 of fld "list" of stack gSBThisStack is not "stack") then
    put the number of lines of fld "list" of stack gSBThisStack into tOffset
  end if
  set the separatorLine of fld "list" of stack gSBThisStack to tOffset
  --put tOffset
end setSeparatorLine

on buildCustomCommandList
  put the value of word -1 the long id of stack gSBThisStack into tPath
  set the itemDelimiter to "/"
  put "Navigator Commands" into item -1 of tPath
  --answer tPath
  --exit to top
  if not (there is a folder tPath) then
    --answer "creating"
    create folder tPath
  end if
  put the directory into tHoldDirectory
  set the directory to tPath
  put the files into tFiles
  set the directory to tHoldDirectory
  --answer tFiles
  if line 1 of tFiles is ".DS_Store" then delete line 1 of tFiles
  replace cr with cr & tab in tFiles
  put cr & "Command" & cr & tab & tFiles into gSBCustomCommands
  --answer gSBCustomCommands
end buildCustomCommandList

function filterStacksList pStacks
  if gSBInRev then
    put revFilterStacksList(pStacks) into tReturnValue
  else
    put empty into tReturnValue
    repeat for each line l in pStacks
      if l is not among the items of "revNavigator,MetaCard Menu Bar,Help Directory,Message Box,Home,answer dialog,ask dialog,script debugger,file selector" then put l & cr after tReturnValue
    end repeat
    delete last char of tReturnValue
  end if
  return tReturnValue
end filterStacksList
