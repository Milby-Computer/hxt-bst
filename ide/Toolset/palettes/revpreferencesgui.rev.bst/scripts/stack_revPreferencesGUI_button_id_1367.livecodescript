Script "stack_revPreferencesGUI_button_id_1367"

/*
# Name: button "controlSortType" of card "Project Browser" of stack "revPreferencesGUI"
# ID: button id 1367 of card id 1320 of stack "revPreferencesGUI"
# Hash: PElIO9UpvuN+D9GqWcz1zQ==
*/


on menuPick pItemName   
   revIDESetPBSortPreferences "pb_controlSort", the label of me, the label of button "controlSortOrder"
end menuPick
