Script "stack_revNavigator_card_id_1002"

/*
# Name: card "display" of stack "revNavigator"
# ID: card id 1002 of stack "revNavigator"
# Hash: sJytUTT95206FRuwKwyttg==
*/


local tWindowLoc
global gScriptBuddyLineArray,gScriptPaletteArray,gSBThisStack
global gSBCustomCommands -- the list of custom commands available

function getLineList pWhichLine
  if pWhichLine is empty then
    put the hilitedlines of fld "list" into tLineList
    replace "," with cr in tLineList
  else
    put pWhichLine into tLineList
  end if
  return tLineList
end getLineList

on removeAllBookmarks
  put the separatorLine of fld "list" into tSeparatorLine
  --answer tSeparatorLine
  --break
  if tSeparatorLine is 0 then exit removeAllBookmarks
  if tSeparatorLine is the number of lines of fld "list" then exit removeAllBookmarks
  set the htmlText of fld "list" to the htmlText of line (tSeparatorLine + 1) to -1 of fld "list"
  setSeparatorLine
  
end removeAllBookmarks

function getID pWhichLines
  --put pWhichLines
  put the itemDelimiter into tOldDelimiter
  set the itemDelimiter to ","
  set the defaultstack to gSBThisStack
  put the separatorLine of fld "list" into tSeparator
  put empty into tIDList
  repeat for each item tOneLine in pWhichLines
    if tOneLine <= tSeparator then
      put the linkText of line tOneLine of fld "list" into tID
      replace numtochar(1) with quote in tID
    else
      put tOneLine - tSeparator into tLine
      put gScriptBuddyLineArray[tLine] into tID
    end if
    put tID & cr after tIDList
  end repeat
  set the itemDelimiter to tOldDelimiter
  delete char -1 of tIDList
  --answer tIDList
  return tIDList
end getID

function getIDList
  put the itemDelimiter into tOldDelimiter
  set the itemDelimiter to ","
  put the hilitedLines of fld "list" into tList
  if tList is empty then
    put empty into tIDList
  else
    put getID(tList) into tIDList
  end if
  set the itemDelimiter to tOldDelimiter
  return tIDList
end getIDList

on editProperties pWhichLine
  put getLineList(pWhichLine) into tLineList
  put empty into tDoneList
  put the pColorObjectMissing of stack gSBThisStack into tColorObjectMissing
  put the propertyPaletteLoc of fld "list" of stack gSBThisStack into tWindowLoc
  repeat for each line tLine in tLineList
    put getID(tLine) into tLineID
    if tLineID is among the lines of tDoneList then next repeat
    put tLineID & cr after tDoneList
    if (there is a tLineID) then
      revBuildLinkedPalette tLineID
      positionWindow
    else
      set the textColor of line tLine of fld "list" of stack gSBThisStack to tColorObjectMissing
    end if
  end repeat
  --put the itemDelimiter
end editProperties


on editScripts pWhichLine
  put getLineList(pWhichLine) into tLineList
  put empty into tWindowLoc
  put the pColorObjectMissing of stack gSBThisStack into tColorObjectMissing
  repeat for each line tLine in tLineList
    put getID(tLine) into tLineID
    --put tLineID
    if tLineID is among the lines of tDoneList then next repeat
    put tLineID & cr after tDoneList
    if (there is a tLineID) then
      edit the script of tLineID
    else
      set the textColor of line tLine of fld "list" of stack gSBThisStack to tColorObjectMissing
      next repeat
    end if
    positionWindow
    if the imageSource of char 1 of line tLine of fld "list" of stack gSBThisStack is not empty then
      set the imageSource of char 1 of line tLine of fld "list" of stack gSBThisStack to empty
      set the defaultStack to (line 1 of the windows)
      set the htmlText of fld "script" to gScriptPaletteArray[tLineID]
      enable btn "apply"
      enable btn "Revert"
      delete variable gScriptPaletteArray[tLineID]
    end if
  end repeat
end editScripts

on doCommand pForce
  put the hilitedLines of fld "list" into tList
  if not pForce then
    if tList is empty then exit doCommand
    
    --    put empty into tIDList
    --    repeat for each item tLine in tList
    --      put getID(tLine) into tID
    --      put tID & cr after tIDList
    --    end repeat
    put getIDList() into tIDList
  end if
  disable fld "list"
  set the pHilitedLines of group "commandGroup" to tList
  if pForce then
    send "checkMyScroll" to fld "command"
  else
    set the pWorkingLines of group "commandGroup" to tIDList
  end if
  show group "commandGroup" with visual effect scroll down very fast
  select text of fld "command"
end doCommand

on positionWindow
  if tWindowLoc is empty then
    put the loc of window (line 1 of the windows) into tWindowLoc
  else
    add 20 to item 1 of tWindowLoc
    add 20 to item 2 of tWindowLoc
    set the loc of window (line 1 of the windows) to tWindowLoc
  end if
end positionWindow

on enterAddPropValues
  set the customPropertySet of stack gSBThisStack to "gSBAddPropsProp"
  put the customProperties of stack gSBThisStack into tAddProps
  set the customPropertySet of stack gSBThisStack to empty
  put the keys of tAddProps into tPropList
  put empty into tPropCommand
  repeat for each line tProp in tPropList
    put tProp & "=" & (tAddProps[tProp]) & cr after tPropCommand
  end repeat
  put tPropCommand into fld "command"
  set the pWorkingLines of group "commandGroup" to the long id of stack gSBThisStack
  doCommand true
end enterAddPropValues

on hideNavigator
  put the loc of this stack into tLoc
  set the cPreviousLoc of this stack to tLoc
  put item 1 of tLoc into x
  put item 2 of tLoc into y
  put item 4 of the rect of this stack - 38 into tDist
  subtract tDist from item 2 of tLoc
  put tDist div 10 into tStep
  show btn "showNavigator"
  repeat 10
    subtract tStep from y
    set the loc of this stack to x,y
  end repeat
  set the loc of this stack to tLoc
end hideNavigator

on showNavigator
  put the loc of this stack into tLoc
  put item 1 of tLoc into x
  put item 2 of tLoc into y
  if the optionKey is "Down" then
    put the height of this stack - 1 into tDist
  else
    put item 2 of the cPreviousLoc of this stack - item 2 of tLoc into tDist
  end if
  put tDist div 10 into tStep
  add tDist to item 2 of tLoc
  repeat 10
    add tStep to y
    set the loc of this stack to x,y
  end repeat
  set the loc of this stack to tLoc
  hide btn "showNavigator"
end showNavigator

