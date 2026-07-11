Script "stack_revStandaloneSettings_button_id_1302"

/*
# Name: button "Choose file" of group "OSX" of card "OS X" of stack "revStandaloneSettings"
# ID: button id 1302 of group id 1221 of card id 1015 of stack "revStandaloneSettings"
# Hash: ACeAVZgper/hgBoRQlsZ+w==
*/


on mouseUp
  set the cCurrentIcon of stack "revIconChooser" to fld "smallappicon"
  sheet "revIconChooser"
  if the cReturnValue of stack "revIconChooser" is not empty then
    put the cReturnValue of stack "revIconChooser" into fld "smallappicon"
    send "closeField" to fld "smallappicon"
  end if
end mouseUp
