Script "stack_revPreferencesGUI_button_id_1248"

/*
# Name: button "Check for Updates on Startup" of group "Updates" of group "Compatibility" of card "Compatibility" of stack "revPreferencesGUI"
# ID: button id 1248 of group id 1247 of group id 1241 of card id 1015 of stack "revPreferencesGUI"
# Hash: BBusUO/+U4pjdqvP/HUUFw==
*/


on mouseUp
   revIDEPrefSet "Updater,AutoCheckOnStartup", the hilite of me
end mouseUp
