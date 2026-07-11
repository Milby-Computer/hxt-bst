Script "stack_revPreferencesGUI_button_id_1372"

/*
# Name: button "textSize" of card "Project Browser" of stack "revPreferencesGUI"
# ID: button id 1372 of card id 1320 of stack "revPreferencesGUI"
# Hash: HK0BBGB/7gzqpdneEZTnkw==
*/


on menuPick pItemName   
   updatePreference "pb_textSize",the label of me
end menuPick

on returnInField
   updatePreference "pb_textSize",the label of me
end returnInField

on enterInField
   updatePreference "pb_textSize",the label of me
end enterInField
