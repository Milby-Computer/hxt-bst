Script "stack_revPreferencesGUI_card_id_1008"

/*
# Name: card "Editor" of stack "revPreferencesGUI"
# ID: card id 1008 of stack "revPreferencesGUI"
# Hash: zlPNpZPw6nFcNCgvAVyV2Q==
*/


on preOpenCard
   set the hilite of button "hide errors" to the cSEHideErrors of stack "revPreferences"
   set the hilite of button "hide palettes" to the cSEHidePalettes of stack "revPreferences"
   set the hilite of button "hide message box" to the cSEHideMessageBox of stack "revPreferences"
   send "update" to group "Script Editor"
end preOpenCard


on OpenCard
   hxtSetTheHeightOfThisStackTo 446
end OpenCard


