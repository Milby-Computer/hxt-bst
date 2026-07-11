Script "stack_revPreferencesGUI_button_id_1066"

/*
# Name: button "Rulers" of group "Appearance" of card "Appearance" of stack "revPreferencesGUI"
# ID: button id 1066 of group id 1062 of card id 1008 of stack "revPreferencesGUI"
# Hash: FL/f2WbnxOIO0+c3Z4+2Mg==
*/


on mouseUp
  set the cREVRulerMeasurement of stack "revPreferences" to the label of me
  if "revRulersH" is among the lines of the openStacks then revCalculateRulers
end mouseUp
