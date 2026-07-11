Script "stack_revMenuDialog_button_id_1010"

/*
# Name: button "Open Stacks" of card id 1002 of stack "revMenuDialog" of stack "revMenuManager"
# ID: button id 1010 of card id 1002 of stack "revMenuDialog" of stack "revMenuManager"
# Hash: y5fLKtwxJXXrjN/a2ZuYYQ==
*/


on mouseDown
  global gREVShowStacks
  lock messages
  set the wholeMatches to true
  put the label of me into tLabel
  put the openStacks into tOpenStacks
  if not gREVShowStacks then put revFilterStacksList(tOpenStacks) into tOpenStacks
  put tOpenStacks into me
  if tOpenStacks is empty then
    set the label of me to space
    revAnswerNoStacks
  else if tLabel is among the lines of the text of me
  then set the menuHistory of me to lineOffset(tLabel,tOpenStacks)
  unlock messages
end mouseDown

on menuPick pWhich
  lock screen
  set the cREVSelectedStack of this stack to pWhich
  set the cREVMenuIDs of this stack to empty
  revRefreshMenuField
  unlock screen
end menuPick
