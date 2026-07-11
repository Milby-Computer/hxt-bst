Script "stack_revTitleBarSelector_button_id_1010"

/*
# Name: button "OK" of card id 1002 of stack "revTitleBarSelector" of stack "com.livecode.pi.decorations"
# ID: button id 1010 of card id 1002 of stack "revTitleBarSelector" of stack "com.livecode.pi.decorations"
# Hash: cAwCyngQIUrVqrEjM/QhNQ==
*/


on mouseUp
  local tTarget
  put the hilitedButtonName of group "decorations" into tTarget
  setDecorations tTarget, true
end mouseUp
