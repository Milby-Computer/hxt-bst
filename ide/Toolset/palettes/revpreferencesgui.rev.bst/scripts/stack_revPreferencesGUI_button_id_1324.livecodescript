Script "stack_revPreferencesGUI_button_id_1324"

/*
# Name: button "stackSortOrder" of card "Project Browser" of stack "revPreferencesGUI"
# ID: button id 1324 of card id 1320 of stack "revPreferencesGUI"
# Hash: 29bfLl057k8lmvc0jpz2pw==
*/


on menuPick pItemName
   revIDESetPBSortPreferences "pb_stackSort", the label of button "stackSortType", the label of me
end menuPick
