Script "stack_revNewMenu_button_id_1003"

/*
# Name: button "Open Stacks" of card id 1002 of stack "revNewMenu" of stack "revMenuManager"
# ID: button id 1003 of card id 1002 of stack "revNewMenu" of stack "revMenuManager"
# Hash: Q7TKgT0Y7xrtx6YHjpk7CQ==
*/


on mouseDown
  global gREVShowStacks
  lock screen
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
  unlock screen
  pass mouseDown
end mouseDown

on mouseUp
  if the label of me is space then
    disable btn "OK"
  else
    enable fld "Menus"
    if fld "Name" is not empty and fld "Menus" is not empty
    then enable btn "OK"
    else disable btn "OK"
  end if
  pass mouseUp
end mouseUp
