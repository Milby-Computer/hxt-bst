Script "stack_revPreferencesGUI_button_id_1243"

/*
# Name: button "Use Legacy Drivers" of group "Legacy Drivers" of group "Compatibility" of card "Compatibility" of stack "revPreferencesGUI"
# ID: button id 1243 of group id 1242 of group id 1241 of card id 1015 of stack "revPreferencesGUI"
# Hash: kmUGs/OHymg0X9s3u2cBuw==
*/


on mouseUp
  set the cREVUseLegacyDrivers of stack "revPreferences" to the hilite of me
  if the hilite of me <> legacyDriversInUse() then
    statusSet "Restart LiveCode to complete change"
  else
    statusSet ""
  end if
end mouseUp
