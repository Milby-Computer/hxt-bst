Script "stack_revPreferencesGUI_button_id_1172"

/*
# Name: button "cardSortOrder" of card "Browser" of stack "revPreferencesGUI"
# ID: button id 1172 of card id 1010 of stack "revPreferencesGUI"
# Hash: QL1u2DSdM7NvcxI72kpzUQ==
*/


on menuPick pItemName
   revIDESetPBSortPreferences "pb_cardSort", the label of button "cardSortType", the label of me
end menuPick


