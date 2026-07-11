Script "stack_revStandaloneSettings_button_id_1188"

/*
# Name: button "email1" of group "errorDialog" of card "Bug Reports" of stack "revStandaloneSettings"
# ID: button id 1188 of group id 1190 of card id 1017 of stack "revStandaloneSettings"
# Hash: WJap2caAWwG2XcNj3CFzZg==
*/


on mouseup
  set the enabled of group "email" to the hilite of me
  if not the hilite of me then 
    put "" into fld "email" 
    send "closeField" to fld "email"
  end if
end mouseup
