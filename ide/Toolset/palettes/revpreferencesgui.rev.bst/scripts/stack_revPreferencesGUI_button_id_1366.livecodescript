Script "stack_revPreferencesGUI_button_id_1366"

/*
# Name: button "cardSortOrder" of card "Project Browser" of stack "revPreferencesGUI"
# ID: button id 1366 of card id 1320 of stack "revPreferencesGUI"
# Hash: QL1u2DSdM7NvcxI72kpzUQ==
*/


on menuPick pItemName
   revIDESetPBSortPreferences "pb_cardSort", the label of button "cardSortType", the label of me
end menuPick


