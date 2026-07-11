Script "stack_revNavigator_group_id_1162"

/*
# Name: group "dragList" of card "display" of stack "revNavigator"
# ID: group id 1162 of card id 1002 of stack "revNavigator"
# Hash: b97RwAZ6v+5P7YpPpopg9Q==
*/


global gScriptBuddyIDarray,gScriptBuddyLineArray,gSBUpdateSelection,gLastLineClicked
global gSBWhichStack,gSBWhichCard,gSBlastHilitedLines,gSBshowTooltip
global gSBCustomCommands -- the menu of custom commands available
global gSBShowList -- if true, show a list of cards/backgrounds
global gSBCardOrBackground -- if card, display cards, if background, display backgrounds, if stack, display stacks
local tOriginalScroll,tClickLine
local tStartDragMessage
local tDragLineList -- a comma-delimited list of the lines being dragged
local tLocalDrag -- true if a drag originates from the list




on popit
  if the optionkey is "down" then
    send "prepareItems" to btn "popprop"
    popup btn "popprop"
    exit popit
  end if
  put the hilitedLines of fld "list" into tLines
  put the basicItems of btn "popup" into tItems
  put gSBCustomCommands after tItems
  --put tItems -- debug put
  if the number of items of tLines is 1 then
    if the commandKey is "down" then
      send ("prepareItems" && tLines) to btn "pophandlers"
      popup btn "pophandlers"
      exit popit
    end if
    
    put getID(tLines) into tID
    put word 1 of tID into tObjectType
    if tObjectType is "stack" then
      put the stackItems of btn "popup" into tHeadText
      put the mainStack of tID into tMainStack
      if tMainStack is the short name of tID then
        put the substacks of tID into tSubstacks
        replace cr with cr & tab in tSubstacks
        if tSubstacks is empty then
          put "(SubStacks" & cr &"	(None" into tSubStacks
        else
          put "SubStacks" & cr & tab before tSubstacks
        end if
        put  tSubstacks & cr before line -1 of tHeadText
      else
        put "MainStack" & cr & tab & tMainStack & cr before  line -1 of tHeadText
      end if
      put tHeadText before tItems
      
    else if tObjectType is "card" then
      put the cardItems of btn "popup" before tItems
    else if tObjectType is "group" then
      put the groupItems of btn "popup" before tItems
    end if
  end if
  put tItems into btn "popup"
  popup btn "popup"
end popit

on mouseMove
  --  if the optionKey is "down" then
  --    if the pHilitedLines of fld "list" is not the hilitedLines of fld "list" then
  --      put "pHilitedLines mismatch:" && the pHilitedLines of fld "list" && the hilitedLines of fld "list"
  --    end if
  --  end if
  if gSBshowTooltip then
    put word 2 of the mouseLine into tKey
    put getID(tKey) into tID
    set the tooltip of fld "list" to tID
  end if
end mouseMove


on mouseDoubleUp
  put word 2 of the clickLine into tLine
  put "Double-Click:" into tProperty
  if the optionKey is "down" then put "Option-Double-Click:" into tProperty
  if the controlKey is "down" then put "Control-Double-Click:" into tProperty
  put the tProperty of this stack into tCommand
  if tCommand is "EditScript" then
    editScripts tLine
  else if tCommand is "EditProperties" then
    editProperties tLine
  else if tCommand is "Bookmark-Remove" then
    bookmarkRemove tLine
  else if tCommand is "CopyID" then
    put getID(tLine) into fld "copy"
    select text of fld "copy"
    copy
  end if
  set the pHilitedLines of fld "list" to the hilitedLines of fld "list"
end mouseDoubleUp


#############################################################################

local tDragging -- are we dragging within this list
local tStartHeight -- the y coordinate for the "0" position for dragging
local tRowHeight -- the height of each row
local tScrolledRows -- the number of rows we are scrolled down
local tHalfRowHeight -- half the height of a row
local tDragIndicatorX -- the x of the loc of the drag indicator
local tScrollUpLimit -- the point above which we should scroll the list field when dragging
local tScrollDownLimit -- the point below which we should scroll the list field when dragging
local tBaseStartHeight -- the start height without accounting for how the field is scrolled.
local tMaxScroll -- the maximum amount the list field can be scrolled
local tRowsDown -- the row the drag will hit
local tWhichLine -- the number of the line clicked

on mouseDown pWhichButton
  put word 2 of the clickLine into tWhichLine
  send ("delayedUpdateRevSelectedObjects" && tWhichLine) to me in 6 ticks
  if pWhichButton is 3 then
    if not (tWhichLine is among the items of the hilitedLines of fld "list") then
      set the hilitedLines of fld "list" to word 2 of the clickLine
    end if
    popit
    set the pHilitedLines of fld "list" to the hilitedLines of fld "list"
    exit mouseDown
  end if
  wait 6 ticks
  if tWhichLine is among the items of the pHilitedLines of fld "list" and the mouse is "down" and the commandKey is "up" then
    set the hilitedLines of fld "list" to the pHilitedLines of fld "list"
    startDragging
    exit mouseDown
  end if
end mouseDown

on delayedUpdateRevSelectedObjects pWhichLine
  if the mouse is "down" then
    send ("delayedUpdateRevSelectedObjects" && pWhichLine) to me in 6 ticks
    exit delayedUpdateRevSelectedObjects
  end if
  put the hilitedLines of fld "list" into tHiliteList
  set the pHilitedLines of fld "list" to tHiliteList
  if gSBShowList then exit delayedUpdateRevSelectedObjects
  if (gSBWhichStack is "the topStack") and \
      (gSBWhichCard is "this card") and \
      item -1 of tHiliteList > 2 + the separatorLine of fld "list" then
    updateRevSelectedObjects
    select line pWhichLine of fld "list"
    set the hilitedlines of fld "list" to tHiliteList
  end if
end delayedUpdateRevSelectedObjects

on startDragging
  if the mouse is "up" then exit startDragging
  put getID(tDragLineList) into tDragData
  setupDragging
  set the acceptDrop to true
  set the dragData to tDragData
end startDragging

on setupDragging
  put the top of fld "list" into tStartHeight
  add the margin of fld "list" to tStartHeight
  put the effective textHeight of fld "list" into tRowHeight
  put the top of fld "list" + tRowHeight into tScrollUpLimit
  put the bottom of fld "list" - tRowHeight - the scrollbarwidth of fld "list" into tScrollDownLimit
  put tRowHeight div 2 into tHalfRowHeight
  add tRowHeight to tStartHeight
  add 1 to tStartHeight
  subtract (the effective textSize of fld "list") from tStartHeight
  put tStartHeight into tBaseStartHeight
  put the scroll of fld "list" into tScroll
  put tScroll mod tRowHeight into tScrollModded
  if tScrollModded > 0 then
    add tRowHeight - tScrollModded to tStartHeight
  end if
  put (tScroll + tHalfRowHeight) div tRowHeight into tScrolledRows
  put the pHilitedLines of fld "list" into tDragLineList
  set the hilitedLines of fld "list" to tDragLineList
  put the mouseV into y
  put theDragYCoordinateOf(y) into tY
  put item 1 of the loc of grc "dragIndicator" into tDragIndicatorX
  set the loc of grc "dragIndicator" to tDragIndicatorX,tY
  show grc "dragIndicator"
end setupDragging

on dragEnter
  set the acceptDrop to true
  --if tRowHeight is empty then setupDragging
end dragEnter

on dragMove x,y
  --put y,tScrollDownLimit
  if not (the vis of grc "dragIndicator") then exit dragMove
  if y < tScrollUpLimit and the scroll of fld "list" > 0 then
    set the scroll of fld "list" to the scroll of fld "list" - tRowHeight
  else if y > tScrollDownLimit then
    set the scroll of fld "list" to the scroll of fld "list" + tRowHeight
  end if
  
  
  put the scroll of fld "list" into tScroll
  put tBaseStartHeight into tStartHeight
  put tScroll mod tRowHeight into tScrollModded
  if tScrollModded > 0 then
    add tRowHeight - tScrollModded to tStartHeight
  end if
  put (tScroll + tHalfRowHeight) div tRowHeight into tScrolledRows
  
  put ((y + tHalfRowHeight - tStartHeight) div tRowHeight) + tScrolledRows + 1 into tRowsDown
  put the acceptDrop into tAD
  --put tRowsDown && tAD && the dragData
  
  put theDragYCoordinateOf(y) into tY
  set the loc of grc "dragIndicator" to tDragIndicatorX,tY
  --put tLocalDrag
end dragMove

function theDragYCoordinateOf pY
  return  ((((pY + tHalfRowHeight  - tStartHeight) div tRowHeight) * tRowHeight) + tStartHeight)
end theDragYCoordinateOf

# on mouseUp
# set the pHilitedLines of fld "list" to the hilitedLines of fld "list"
# set the pSelectedText of fld "list" to the SelectedText of fld "list"
# end mouseUp

on dragEnd
  doCleanup
end dragEnd

on doCleanup
  hide grc "dragIndicator"
  set the loc of grc "dragIndicator" to tDragIndicatorX,-5
  set the pHilitedLines of fld "list" to the hilitedLines of fld "list"
  set the pSelectedText of fld "list" to the SelectedText of fld "list"
end doCleanup

on dragDrop
  put the dragSource is the long id of field "list" into tLocalDrag
  --put "dragDrop"
  --breakpoint
  --put the dragData
  --exit dragDrop
  --put false into tDragging
  --put "dragDrop"
  --wait 3 seconds
  --put the mouseV into y
  --put ((y + tHalfRowHeight - tStartHeight) div tRowHeight) + tScrolledRows + 1 into tRowsDown
  hide grc "dragIndicator"
  --put tLocalDrag
  set the loc of grc "dragIndicator" to tDragIndicatorX,-5
  --put tLocalDrag
  if not tLocalDrag then
    put the dragData into tData
    setBookmarks "",tData
    set the pHilitedLines of fld "list" to the hilitedLines of fld "list"
    exit dragDrop
  else
    put false into tLocalDrag
  end if
  --put the dragData into tDragLineList
  --put "got here"
  --put "got here" && tRowsDown && tDragLineList -- debug
  
  put the separatorLine of fld "list" into tSeparatorLine
  put 0 into tBookmarkCount
  repeat for each item t in tDragLineList
    if t > tSeparatorLine then exit repeat
    add 1 to tBookmarkCount
  end repeat
  put item 1 to tBookmarkCount of tDragLineList into tBookmarkList
  put item (tBookmarkCount + 1) to -1 of tDragLineList into tObjectList
  
  if tRowsDown <= tSeparatorLine + 1 then
    if tBookmarkList is not empty then
      relayerBookmarkList tRowsDown,tBookmarkList
    end if
    if tObjectList is not empty then
      setBookmarks tObjectList
      put the separatorLine of fld "list" - tSeparatorLine into tNewBookmarkCount
      --answer tNewBookmarkCount
      if tNewBookmarkCount > 0 then
        repeat for each item t in tBookmarkList
          if t > tRowsDown then add 1 to tRowsDown
        end repeat
        put empty into tNewBookmarkList
        repeat with i = 1 to tNewBookmarkCount
          put i & "," after tNewBookmarkList
        end repeat
        add tNewBookmarkCount to tRowsDown
        delete char -1 of tNewBookmarkList
        --put "got here" && tNewBookmarkCount && tRowsDown && tNewBookmarkList && ticks()
        relayerBookmarkList tRowsDown,tNewBookmarkList
      end if
    end if
  else
    if gSBShowList then
      if gSBCardOrBackground is "card" then
        --doReport tWhichLine
        if tWhichLine <= tSeparatorLine and (word 1 of getID(tWhichLine)) is "group" then
          --doReport 2
          placeGroupOntoCards tWhichLine,tObjectList
          put empty into tObjectList
          put empty into tBookmarkList
        end if
      else
        put empty into tObjectList -- we don't rearrange stacks or groups
      end if
    end if
    if tObjectList is not empty then relayerControlList tRowsDown,tObjectList
    if tBookmarkList is not empty then
      --subtract 2 from tRowsDown
      repeat for each item t in tObjectList
        if t < tRowsDown then subtract 1 from tRowsDown
      end repeat
      --subtract (the number of items in tObjectList) from tRowsDown
      
      
      
      addBookmarkedControls tBookmarkList,tRowsDown
      doUpdateDisplay true
      
      
    end if
  end if
  --put "but not here"
  --put tRowsDown & cr & tTargetLayer & cr & tDragLineList
  set the pHilitedLines of fld "list" to the hilitedLines of fld "list"
end dragDrop

on relayerControlList pTargetLine,pLinesToRelayerList
  put pTargetLine,pLinesToRelayerList & cr into tReport
  if pTargetLine is among the items of pLinesToRelayerList then exit relayerControlList
  put pTargetLine - ((the separatorLine of fld "list") + 3) into tTargetLayer
  if gSBShowList then
    add 1 to tTargetLayer
    if gSBCardOrBackground is not "card" then exit relayerControlList
  end if
  if tTargetLayer < 0 then put 0 into tTargetLayer
  -- if (item 1 of pLinesToRelayerList) < pTargetLine then subtract 1 from tTargetLayer
  set relayerGroupedControls to true
  
  put getID(pLinesToRelayerList) into tIDList
  put 0 into tStartIncrementingAt
  repeat for each item tLayerNumber in pLinesToRelayerList
    if tLayerNumber > pTargetLine then exit repeat
    add 1 to tStartIncrementingAt
  end repeat
  
  put 0 into tLoopCounter
  repeat for each line tID in tIDList
    add 1 to tLoopCounter
    if word 1 of tID is "stack" then next repeat
    if word 1 of tID is "card" and (not gSBShowList) then next repeat
    if tLoopCounter > tStartIncrementingAt then add 1 to tTargetLayer
    set the layer of tID to tTargetLayer
    --put "set the layer of" && (the name of tID) && "to" && tTargetLayer & cr after tReport
  end repeat
  doUpdateDisplay true
  --put tReport
end relayerControlList

on relayerBookmarkList pTargetLine,pLinesToRelayerList
  if pTargetLine is among the items of pLinesToRelayerList then exit relayerBookmarkList
  put the separatorLine of fld "list" into tSeparatorLine
  put the htmlText of line 1 to tSeparatorLine of fld "list" into tLineList
  put empty into tBeforeLines
  put empty into tDraggedLines
  put empty into tAfterLines
  put 0 into tCurrentLine
  repeat for each line tLine in tLineList
    add 1 to tCurrentLine
    if tCurrentLine is among the items of pLinesToRelayerList then
      put tLine & cr after tDraggedLines
    else if tCurrentLine < pTargetLine then
      put tLine & cr after tBeforeLines
    else
      put tLine & cr after tAfterLines
    end if
  end repeat
  put tBeforeLines & tDraggedLines & tAfterLines into tNewLines
  set the htmlText of line 1 to tSeparatorLine of fld "list" to tNewLines
end relayerBookmarkList

on addBookmarkedControls pLineList,pTargetLine
  put getID(pLineList) into tLineIDList
  put the separatorLine of fld "list" into tSeparatorLine
  
  put pTargetLine - (tSeparatorLine + 2) into tTargetLayer
  
  -- if (item 1 of pLinesToRelayerList) < pTargetLine then subtract 1 from tTargetLayer
  set relayerGroupedControls to true
  
  put getID(tSeparatorLine+1) into tStackRef
  put the value of word -1 of tStackRef into tStackName
  put the long id of tStackRef into tStackID
  
  
  # if gSBShowList then
  # if gSBCardOrBackground is "card" then
  # if pTargetLine is (tSeparatorLine + 1) then
  # put the long id of this cd of tStackRef into tTargetID
  # else
  # put getID(pTargetLine) into tTargetID
  # end if
  # repeat for each line tID in tLineIDList
  # if word 1 of tID is "card" then
  # if word -1 of tID is not word -1 of tStackID then
  # copy tID to tStackRef
  # end if
  # else
  # end repeat
  # end if
  # else
  if gSBShowList then
    put getID(pTargetLine) into tCardBGRef
  else
    put getID(tSeparatorLine+2) into tCardBGRef
  end if
  repeat for each line tID in tLineIDList
    put word 1 of tID into tType
    switch tType
    case "stack"
      set the mainStack of tID to tStackName
      break
    case "card"
      if word -1 of tID is not word -1 of tStackID then
        copy tID to tStackRef
        put it into tNewID
      else
        put tID into tNewID
      end if
      if gSBShowList and gSBCardOrBackground is "card" then
        set the layer of tNewID to tTargetLayer
        add 1 to tTargetLayer
      end if
      break
    case "group"
      --do group here
      put "background id" && word 3 of tID && word -3 to -1 of tID into tBGID
      --put tID && tStackName
      if word -1 of tID is word -1 of tStackID then
        try
          place tBGID onto tCardBGRef
          put tBGID into tNewID
          put "group" into word 1 of tNewID
        catch tSomeErr
        end try
        --put tID into tNewID
      else
        copy tID to tCardBGRef
        put it into tNewID
      end if
      if not gSBShowList then
        --put tTargetLayer && tNewID
        set the layer of tNewID to tTargetLayer
        add ((the number of controls of tNewID)+1) to tTargetLayer
      end if
      break
    default
      copy tID to tCardBGRef
      if not gSBShowList then
        set the layer of it to tTargetLayer
        add 1 to tTargetLayer
      end if
    end switch
  end repeat
end addBookmarkedControls

on placeGroupOntoCards tWhichLine,tObjectList
  put getID(tWhichLine) into tID
  if word 1 of tID is not "group" then exit placeGroupOntoCards
  put "background id" && word 3 of tID && word -2 to -1 of tID into tBackgroundID
  put getID(tObjectList) into tCardList
  if word -1 of tBackgroundID is not word -1 of line 1 of tCardList then
    put word -2 to -1 of line 1 of tCardList into tStackRef
    copy tBackgroundID to tStackRef
    put it into tBackgroundID
  end if
  repeat for each line tCard in tCardList
    if word 1 of tCard is not "card" then next repeat
    try
      place tBackgroundID onto tCard
    catch tSomeErr
    end try
  end repeat
end placeGroupOntoCards
