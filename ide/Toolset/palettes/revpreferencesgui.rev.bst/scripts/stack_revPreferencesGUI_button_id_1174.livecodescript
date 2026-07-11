Script "stack_revPreferencesGUI_button_id_1174"

/*
# Name: button "controlSortOrder" of card "Browser" of stack "revPreferencesGUI"
# ID: button id 1174 of card id 1010 of stack "revPreferencesGUI"
# Hash: MiM+iEF4nqlzcCpDeTtqfw==
*/


on menuPick pItemName
   revIDESetPBSortPreferences "pb_controlSort", the label of button "controlSortType", the label of me
end menuPick
