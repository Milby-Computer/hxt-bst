Script "stack_revGettingStartedScripts_button_id_1074"

/*
# Name: button "Reset" of group "Replacing a text style in a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1074 of group id 1070 of card id 1002 of stack "revGettingStartedScripts"
# Hash: hUDIVSZDDPGkbNlQNJVVIA==
*/


on mouseUp
  set the htmlText of field "Example Text" to the savedHTMLText of field "Example Text"
  put the savedHTMLText of field "Example Text" into field "Example HTML"
end mouseUp
