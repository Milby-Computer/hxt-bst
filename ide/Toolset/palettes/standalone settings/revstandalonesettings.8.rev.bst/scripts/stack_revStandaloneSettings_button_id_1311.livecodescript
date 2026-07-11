Script "stack_revStandaloneSettings_button_id_1311"

/*
# Name: button "Choose file" of group "errorDialog" of card "Bug Reports" of stack "revStandaloneSettings"
# ID: button id 1311 of group id 1190 of card id 1017 of stack "revStandaloneSettings"
# Hash: ByBREMjEPD4xOFRgB4rukQ==
*/


on mouseUp
  set the cCurrentIcon of stack "revIconChooser" to fld "icon"
  sheet "revIconChooser"
  if the cReturnValue of stack "revIconChooser" is not empty then
    put the cReturnValue of stack "revIconChooser" into fld "icon"
    send "closeField" to fld "icon"
  end if
end mouseUp
