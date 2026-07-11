Script "stack_revMenuManager_button_id_4883"

/*
# Name: button "Disable Menu" of group "Menu Button Controls" of bkgnd "Button Menus:" of stack "revMenuManager"
# ID: button id 4883 of group id 4879 of bkgnd id 3224 of stack "revMenuManager"
# Hash: lC2/W+POyev0WMzDdqVCeg==
*/


on mouseUp
  global gREVActiveMenuButton
  lock screen
  revCheckNameChanged
  set the backPattern of me to empty
  if the hilite of me then
    disable gREVActiveMenuButton
  else
    enable gREVActiveMenuButton
  end if
  unlock screen
end mouseUp
