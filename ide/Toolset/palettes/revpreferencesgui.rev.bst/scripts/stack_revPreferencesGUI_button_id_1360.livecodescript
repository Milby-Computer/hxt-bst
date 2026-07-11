Script "stack_revPreferencesGUI_button_id_1360"

/*
# Name: button "stackSortType" of card "Project Browser" of stack "revPreferencesGUI"
# ID: button id 1360 of card id 1320 of stack "revPreferencesGUI"
# Hash: aqts2ULCpJBafo3ksBzqlQ==
*/


on menuPick pItemName
   revIDESetPBSortPreferences "pb_stackSort", the label of me, the label of button "stackSortOrder"
   //updatePreference "pb_stackSortType",the label of me
end menuPick
