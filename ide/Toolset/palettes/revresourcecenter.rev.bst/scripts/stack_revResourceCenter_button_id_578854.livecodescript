Script "stack_revResourceCenter_button_id_578854"

/*
# Name: button "Reset" of group "Example" of group id 584231 of group "mainContent" of card "Replacingatextstyleinafield" of stack "revResourceCenter"
# ID: button id 578854 of group id 577011 of group id 584231 of group id 109265 of card id 109249 of stack "revResourceCenter"
# Hash: hUDIVSZDDPGkbNlQNJVVIA==
*/


on mouseUp
  set the htmlText of field "Example Text" to the savedHTMLText of field "Example Text"
  put the savedHTMLText of field "Example Text" into field "Example HTML"
end mouseUp
