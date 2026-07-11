Script "stack_revPreferencesGUI_button_id_1244"

/*
# Name: button "Download Now" of group "Legacy Drivers" of group "Compatibility" of card "Compatibility" of stack "revPreferencesGUI"
# ID: button id 1244 of group id 1242 of group id 1241 of card id 1015 of stack "revPreferencesGUI"
# Hash: V+nbq0xsTfaom2nhcB07dA==
*/


on mouseUp
  legacyDriversDownload "driverDownloadCallback", the long id of of the owner of me
end mouseUp

