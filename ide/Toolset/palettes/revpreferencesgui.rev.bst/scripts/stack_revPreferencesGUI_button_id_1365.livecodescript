Script "stack_revPreferencesGUI_button_id_1365"

/*
# Name: button "cardSortType" of card "Project Browser" of stack "revPreferencesGUI"
# ID: button id 1365 of card id 1320 of stack "revPreferencesGUI"
# Hash: MZmXVDbsKuQ7acHTLgo3SQ==
*/


on menuPick pItemName 
   revIDESetPBSortPreferences "pb_cardSort", the label of me, the label of button "cardSortOrder"
end menuPick
