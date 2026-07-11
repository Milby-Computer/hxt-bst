Script "stack_revSearch_button_id_1296"

/*
# Name: button id 1296 of bkgnd "Specific Stack" of stack "revSearch"
# ID: button id 1296 of bkgnd id 1364 of stack "revSearch"
# Hash: CWAU0GHUVdmg+L4PXiuSOw==
*/


on mouseDown
  global gREVShowStacks
  set the wholeMatches to true
  put the openStacks into tOpenStacks
  if not gREVShowStacks then put revFilterStacksList(tOpenStacks) into tOpenStacks
  set the text of me to tOpenStacks
  hilite me
end mouseDown

on menuPick pWhich
  set the text of fld "specific stack" of stack "revSearch" to pWhich
  unhilite me
end menuPick

on mouseUp
  unhilite me
  pass mouseUp
end mouseUp

on mouseRelease
  unhilite me
  pass mouseRelease
end mouseRelease
