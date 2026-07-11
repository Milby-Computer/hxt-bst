Script "stack_revPreferencesGUI_button_id_1150"

/*
# Name: button "Indentation" of group "Script Editor" of card "Editor" of stack "revPreferencesGUI"
# ID: button id 1150 of group id 1114 of card id 1008 of stack "revPreferencesGUI"
# Hash: KNkXJK6BmGWSc3cXgWR0Cg==
*/


on menuPick pItemName
   set the cValue of me to labelToValue(the label of me)
   pass menuPick
end menuPick

private function labelToValue pLabel
      return pLabel
end labelToValue

private function valueToLabel pValue
   return pValue
end valueToLabel

setProp cValue pValue
   lock messages
   set the cValue of me to pValue
   unlock messages
   
   set the label of me to "tempLabel"
   set the label of me to valueToLabel(pValue)
end cValue
