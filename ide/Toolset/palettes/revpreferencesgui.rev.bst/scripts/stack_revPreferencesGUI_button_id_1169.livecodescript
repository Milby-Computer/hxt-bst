Script "stack_revPreferencesGUI_button_id_1169"

/*
# Name: button "Use Tabs" of group "Script Editor" of card "Script Editor" of stack "revPreferencesGUI"
# ID: button id 1169 of group id 1142 of card id 1010 of stack "revPreferencesGUI"
# Hash: sZ3V03jBRf0T6Rz0OwcGJg==
*/


getProp cLabel
   if the label of me is "New tab" then
      return true
   else
      return false
   end if
end cLabel

setProp cLabel pValue
   set the label of me to "tempLabel"
   if pValue then
      set the label of me to "New tab"
   else
      set the label of me to "New window"
   end if
end cLabel
