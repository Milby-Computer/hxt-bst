Script "stack_revMenuManager_button_id_4881"

/*
# Name: button "Edit Script" of group "Menu Button Controls" of bkgnd "Button Menus:" of stack "revMenuManager"
# ID: button id 4881 of group id 4879 of bkgnd id 3224 of stack "revMenuManager"
# Hash: EG9PkJoCXMYjfwU6q1RAVw==
*/


on mouseUp
  global gREVActiveMenuButton
  revCheckNameChanged
  --edit script of menu button
  edit script of gREVActiveMenuButton
  pass mouseUp
end mouseUp
