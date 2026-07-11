Script "stack_revStandaloneSettings_button_id_32082"

/*
# Name: button "App Tracking Transparency Check" of group "App Tracking Transparency" of group "Requirement" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 32082 of group id 32083 of group id 30344 of card id 1641 of stack "revStandaloneSettings"
# Hash: SFfUUdnc5g+thT+d59I2lg==
*/


on mouseUp
   storeSetting "AppTrackingTransparency", the hilite of me
   set the enabled of field "App Tracking Transparency Message" to the hilite of me
end mouseUp
