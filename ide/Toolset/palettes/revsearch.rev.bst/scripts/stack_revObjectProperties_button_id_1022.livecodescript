Script "stack_revObjectProperties_button_id_1022"

/*
# Name: button "OK" of card id 1002 of stack "revObjectProperties" of stack "revSearch"
# ID: button id 1022 of card id 1002 of stack "revObjectProperties" of stack "revSearch"
# Hash: NQZB6K/fnIArTLb6SH0u+g==
*/


on mouseUp
  set the cName of stack "revSearch" to the hilite of btn "name"
  set the cFieldText of stack "revSearch" to the hilite of btn "field text"
  set the cButtonContents of stack "revSearch" to the hilite of btn "button contents"
  set the cScript of stack "revSearch" to the hilite of btn "script"
  set the cOtherProperties of stack "revSearch" to the hilite of btn "other properties"
  set the cOtherPropertiesSearchType of stack "revSearch" to the hilitedButtonName of grp "other properties"
  set the cSpecificProperty of stack "revSearch" to the label of btn "specific property selector"
  set the cCustomProperties of stack "revSearch" to the hilite of btn "custom properties"
  close this stack
end mouseUp
