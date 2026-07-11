Script "stack_revGettingStartedScripts_button_id_1212"

/*
# Name: button "Reset" of group "Removing bold text styles from a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1212 of group id 1208 of card id 1002 of stack "revGettingStartedScripts"
# Hash: hUDIVSZDDPGkbNlQNJVVIA==
*/


on mouseUp
  set the htmlText of field "Example Text" to the savedHTMLText of field "Example Text"
  put the savedHTMLText of field "Example Text" into field "Example HTML"
end mouseUp
