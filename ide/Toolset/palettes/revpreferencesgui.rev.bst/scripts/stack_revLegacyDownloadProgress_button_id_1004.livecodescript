Script "stack_revLegacyDownloadProgress_button_id_1004"

/*
# Name: button "Cancel" of card id 1002 of stack "revLegacyDownloadProgress" of stack "revPreferencesGUI"
# ID: button id 1004 of card id 1002 of stack "revLegacyDownloadProgress" of stack "revPreferencesGUI"
# Hash: TqJmy3CI2xdh7jDPWLOYRA==
*/


on mouseUp
  send "legacyDriversDownloadCancel" to group "Compatibility" of stack "revPreferencesGUI" in 0 milliseconds
end mouseUp
