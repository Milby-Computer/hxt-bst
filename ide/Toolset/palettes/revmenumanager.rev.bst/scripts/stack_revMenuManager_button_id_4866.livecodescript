Script "stack_revMenuManager_button_id_4866"

/*
# Name: button "Item Mnemonic" of bkgnd "Menu Item Controls" of stack "revMenuManager"
# ID: button id 4866 of bkgnd id 3265 of stack "revMenuManager"
# Hash: Nu9YB8g/Qvqxd61v4mzsWQ==
*/


on mouseUp
  lock screen
  global gREVActiveMenuButton, gREVMMMenuItems
  put the hilitedLine of fld "Menu Buttons" into tHilitedLine
  put the hilitedLine of fld "Menu Items" into tHilitedLine
  put item 3 of line tHilitedLine of gREVMMMenuItems into tMenuLine
  put the scroll of fld "Menu Items" into tScroll
  put the text of gREVActiveMenuButton into tText
  
  put item 2 of line tHilitedLine of gREVMMMenuItems into tMenuItem
  put offset("&", tMenuItem) into tOffset
  if tOffset is not 0 and char (tOffset+1) of tMenuItem is not "&" then delete char tOffset of tMenuItem
  if the hilite of me then
    --set mnemonic to first letter    
    enable btn "Item Mnemonic Letter"
    if the label of btn "Item Mnemonic Letter" is not space then
      --remember mnemonic if it has been set since menu item was selected
      put offset(the label of btn "Item Mnemonic Letter", tMenuItem) into tMnemonicOffset
      put "&" before char tMnemonicOffset of tMenuItem
    end if
  else
    --set mnemonic to empty
    disable btn "Item Mnemonic Letter"
  end if
  --update button contents
  put tMenuItem into line tMenuLine of tText
  put tMenuItem into item 2 of line tHilitedLine of gREVMMMenuItems
  set the text of gREVActiveMenuButton to tText
  put tText into btn "Preview"     
  revUpdateField
  set the hilitedLines of fld "Menu Items" to tHilitedLine
  set the scroll of fld "Menu Items" to tScroll
  unlock screen
end mouseUp
