Script "stack_revStandaloneSettings_button_id_1301"

/*
# Name: button "Choose file" of group "OSX" of card "OS X" of stack "revStandaloneSettings"
# ID: button id 1301 of group id 1221 of card id 1015 of stack "revStandaloneSettings"
# Hash: hevMMISyRewxlmUc9brcoA==
*/


on mouseUp
  set the cCurrentIcon of stack "revIconChooser" to fld "appicon"
  sheet "revIconChooser"
  if the cReturnValue of stack "revIconChooser" is not empty then
    put the cReturnValue of stack "revIconChooser" into fld "appicon"
    send "closeField" to fld "appicon"
  end if
end mouseUp
