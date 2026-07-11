Script "stack_revPreferencesGUI_button_id_1168"

/*
# Name: button "stackSortType" of card "Browser" of stack "revPreferencesGUI"
# ID: button id 1168 of card id 1010 of stack "revPreferencesGUI"
# Hash: aqts2ULCpJBafo3ksBzqlQ==
*/


on menuPick pItemName
   revIDESetPBSortPreferences "pb_stackSort", the label of me, the label of button "stackSortOrder"
   //updatePreference "pb_stackSortType",the label of me
end menuPick
