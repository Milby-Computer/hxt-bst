Script "stack_SmartProperties_button_id_11422"

/*
# Name: button "About" of group "Preferences" of card id 1002 of stack "SmartProperties"
# ID: button id 11422 of group id 11392 of card id 1002 of stack "SmartProperties"
# Hash: 9baYYUWynIh0TAKVAFI3EA==
*/


on mouseUp
  set the htmlText of fld "AboutHelp" to the cAboutHtml of this stack
  show fld "AboutHelp"
  set showBorder of fld "AboutHelp" to false
end mouseUp
