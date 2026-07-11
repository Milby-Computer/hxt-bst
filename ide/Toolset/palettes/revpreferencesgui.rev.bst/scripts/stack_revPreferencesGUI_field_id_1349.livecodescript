Script "stack_revPreferencesGUI_field_id_1349"

/*
# Name: field "Menu" of bkgnd "Navigation" of stack "revPreferencesGUI"
# ID: field id 1349 of bkgnd id 1003 of stack "revPreferencesGUI"
# Hash: oc+vpYkguH5TVtFQNjOXAg==
*/


on mouseDown   
  sectionChange
end mouseDown  

on selectionChanged
  sectionChange
end selectionChanged

on sectionChange
   go card word 1 to -1 of line (the hilitedLine of me) of me
   focus on me
end sectionChange
