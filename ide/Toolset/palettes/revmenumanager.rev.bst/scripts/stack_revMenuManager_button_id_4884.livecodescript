Script "stack_revMenuManager_button_id_4884"

/*
# Name: button "Menu Mnemonic" of group "Menu Button Controls" of bkgnd "Button Menus:" of stack "revMenuManager"
# ID: button id 4884 of group id 4879 of bkgnd id 3224 of stack "revMenuManager"
# Hash: T2uvYPlfnMeRXrnOXAfaUA==
*/


on mouseUp
  global gREVActiveMenuButton
  revCheckNameChanged
  put the hilitedLine of fld "Menu Buttons" into tHilitedLine
  lock screen
  set the hilitedLine of fld "Menu Buttons" to 0 --workaround bug #2878
  if the hilite of me then
    --enable mnemonic
    enable btn "Menu Mnemonic Letter"
    if the label of btn "Menu Mnemonic Letter" is not space then
      --remember mnemonic if it has been set since a menu has been selected
      put offset(the label of btn "Menu Mnemonic Letter", the label of gREVActiveMenuButton) into tMnemonic
      set the mnemonic of gREVActiveMenuButton to tMnemonic
      set the textStyle of line tHilitedLine of fld "Menu Buttons" to "plain"
      set the textStyle of char tMnemonic of line tHilitedLine of fld "Menu Buttons" to "underline"
    end if
  else
    set the mnemonic of gREVActiveMenuButton to 0
    set the textStyle of line tHilitedLine of fld "Menu Buttons" to "plain"
    disable btn "Menu Mnemonic Letter"
  end if
  set the hilitedLine of fld "Menu Buttons" to tHilitedLine --workaround bug #2878
  unlock screen
end mouseUp
