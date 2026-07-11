Script "stack_revAddLibraryStack_button_id_1005"

/*
# Name: button "Stack" of card id 1002 of stack "revAddLibraryStack"
# ID: button id 1005 of card id 1002 of stack "revAddLibraryStack"
# Hash: W2QArIPEsvJ2UGEg66HA5A==
*/


on mouseDown
  lock screen
  put the label of me into tLabel
  put revLoadedStacks("preference") into tStacks
  put tStacks into me
  
  set the wholeMatches to true
  if tLabel is among the lines of tStacks 
  then set the menuHistory of me to lineOffset(tLabel,tText)
  unlock screen
end mouseDown

on menuPick pWhich
  if there is a stack pWhich then enable btn "OK"
  else disable btn "OK"
  pass menuPick
end menuPick
