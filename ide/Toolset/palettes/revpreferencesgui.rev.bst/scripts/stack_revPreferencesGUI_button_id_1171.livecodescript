Script "stack_revPreferencesGUI_button_id_1171"

/*
# Name: button "cardSortType" of card "Browser" of stack "revPreferencesGUI"
# ID: button id 1171 of card id 1010 of stack "revPreferencesGUI"
# Hash: MZmXVDbsKuQ7acHTLgo3SQ==
*/


on menuPick pItemName 
   revIDESetPBSortPreferences "pb_cardSort", the label of me, the label of button "cardSortOrder"
end menuPick
