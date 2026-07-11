Script "stack_revPreferencesGUI_button_id_1176"

/*
# Name: button "textSize" of card "Browser" of stack "revPreferencesGUI"
# ID: button id 1176 of card id 1010 of stack "revPreferencesGUI"
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
