Script "stack_revNavigator_button_id_1041"

/*
# Name: button "whichStack" of card "display" of stack "revNavigator"
# ID: button id 1041 of card id 1002 of stack "revNavigator"
# Hash: vcy7pbRMPURJaTeZCsBWjA==
*/


global gSBWhichStack,gSBWhichCard,gSBCardOrBackground,gSBThisStack
global gSBInRev -- True if we are in the Rev environment, false if in MetaCard
global gSBShowAllStacks -- True if we should show all stacks; user stacks only otherwise
global gSBShowList
global gScriptBuddyIDarray

on mouseDown
  put the pMenuLimit of stack gSBThisStack into tMenuLimit
  # if gSBInRev then
  # if the optionKey is "down" then
  # put revLoadedStacks("all") into tList
  # else
  # put revLoadedStacks("application") into tList
  # end if
  # else
  put the mainStacks into tMainList
  if not (the optionKey is "down") then put filterStacksList(tMainList) into tMainList
  put empty into tList
  repeat for each line L in tMainList
    put L & cr after tList
    put the substacks of stack L into tSubstacks
    if tSubstacks is not empty then put tSubstacks & cr after tList
  end repeat
  # end if
  if not (the shiftKey is "down") then
    sort lines of tList
  end if
  put ("the topStack" & cr & "Stack List" & cr & "-" & cr) before tList
  if the number of lines of tList > tMenuLimit then put line 1 to tMenuLimit of tList into tList
  put tList into me
end mouseDown

on menuPick pWhich
  --enable btn "whichCard" of stack gSBThisStack
  if the commandKey is "down" then
    if pWhich is "the topstack" or pWhich is "Stack List" then exit menuPick
    go stack pWhich
    --updateDisplay
  else if pWhich is "Stack List" then
    --disable btn "whichCard" of stack gSBThisStack
    if the optionKey is "down" then
      put true into gSBShowAllStacks
    else
      put false into gSBShowAllStacks
    end if
    put "Stack" into gSBCardOrBackground
    put true into gSBShowList
    put empty into gSBWhichStack
    put empty into gSBWhichCard
    updateDisplay true
  else if pWhich is "the topStack" and the optionKey is "down" then
    wait until the optionKey is not "down"
    put the mouseStack into tStack
    --put the mouseControl
    --put the mouseControl into tHiliteID
    --put tHiliteID
    if tStack is not gSBWhichStack then
      if gSBShowList then
        put "Card List" into gSBWhichCard
      else
        put "this card" into gSBWhichCard
      end if
      put "card" into gSBCardOrBackground
      put tStack into gSBWhichStack
      updateDisplay true
    end if
     
--    if false and tHiliteID is not empty and gSBShowList is false and gScriptBuddyIDarray[tHiliteID] is not empty then
--      put gScriptBuddyIDarray[tHiliteID]
--      set the hilitedLines of fld "list" of stack gSBThisStack to gScriptBuddyIDarray[tHiliteID]
--      set the pHilitedLines of fld "list" of stack gSBThisStack to gScriptBuddyIDarray[tHiliteID]
--    end if
--     
  else if pWhich is not gSBWhichStack then
    if gSBShowList then
      put "Card List" into gSBWhichCard
    else
      put "this card" into gSBWhichCard
    end if
    put "card" into gSBCardOrBackground
    put pWhich into gSBWhichStack
    updateDisplay true
  end if
end menuPick
