Script "stack_SmartProperties_button_id_11423"

/*
# Name: button "Help" of group "Preferences" of card id 1002 of stack "SmartProperties"
# ID: button id 11423 of group id 11392 of card id 1002 of stack "SmartProperties"
# Hash: lV60tpSbnaBt8CJ+evGc2g==
*/


on mouseUp
  set the htmlText of fld "AboutHelp" to the cHelpHtml of this stack
  show fld "AboutHelp"
  set showBorder of fld "AboutHelp" to false
end mouseUp
