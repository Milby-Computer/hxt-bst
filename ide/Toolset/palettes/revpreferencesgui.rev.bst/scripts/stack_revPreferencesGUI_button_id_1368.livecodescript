Script "stack_revPreferencesGUI_button_id_1368"

/*
# Name: button "controlSortOrder" of card "Project Browser" of stack "revPreferencesGUI"
# ID: button id 1368 of card id 1320 of stack "revPreferencesGUI"
# Hash: MiM+iEF4nqlzcCpDeTtqfw==
*/


on menuPick pItemName
   revIDESetPBSortPreferences "pb_controlSort", the label of button "controlSortType", the label of me
end menuPick
