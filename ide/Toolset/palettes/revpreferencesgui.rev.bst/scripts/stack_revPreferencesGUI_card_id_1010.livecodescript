Script "stack_revPreferencesGUI_card_id_1010"

/*
# Name: card "Script Editor" of stack "revPreferencesGUI"
# ID: card id 1010 of stack "revPreferencesGUI"
# Hash: SK9Qs2aav2kLYZTA6la2Rg==
*/


on preOpenCard
   set the hilite of button "hide errors" to the cSEHideErrors of stack "revPreferences"
   set the hilite of button "hide palettes" to the cSEHidePalettes of stack "revPreferences"
   set the hilite of button "hide message box" to the cSEHideMessageBox of stack "revPreferences"
   send "update" to group "Script Editor"
end preOpenCard
