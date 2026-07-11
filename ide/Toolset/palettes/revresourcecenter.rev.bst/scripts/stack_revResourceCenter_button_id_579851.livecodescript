Script "stack_revResourceCenter_button_id_579851"

/*
# Name: button "Update Font Menu" of group "Example" of group id 579852 of group "mainContent" of card "Placingafontlistintoamenu" of stack "revResourceCenter"
# ID: button id 579851 of group id 577033 of group id 579852 of group id 100342 of card id 100330 of stack "revResourceCenter"
# Hash: ufSGD2XE9JQ4CYwPbmt0HA==
*/


on mouseUp
  createFontMenu
end mouseUp

on createFontMenu
  get the fontNames -- list of installed fonts
  sort lines of it
  put it into button "Font"
end createFontMenu
