Script "stack_revPreferencesGUI_button_id_1173"

/*
# Name: button "controlSortType" of card "Browser" of stack "revPreferencesGUI"
# ID: button id 1173 of card id 1010 of stack "revPreferencesGUI"
# Hash: PElIO9UpvuN+D9GqWcz1zQ==
*/


on menuPick pItemName   
   revIDESetPBSortPreferences "pb_controlSort", the label of me, the label of button "controlSortOrder"
end menuPick
