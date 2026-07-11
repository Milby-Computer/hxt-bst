Script "stack_revResourceCenter_button_id_579721"

/*
# Name: button "Reset" of group "Example" of group id 584245 of group "mainContent" of card "RemovingBoldTextStylesFromAField" of stack "revResourceCenter"
# ID: button id 579721 of group id 577013 of group id 584245 of group id 113740 of card id 113724 of stack "revResourceCenter"
# Hash: hUDIVSZDDPGkbNlQNJVVIA==
*/


on mouseUp
  set the htmlText of field "Example Text" to the savedHTMLText of field "Example Text"
  put the savedHTMLText of field "Example Text" into field "Example HTML"
end mouseUp
