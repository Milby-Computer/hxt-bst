Script "stack_revPreferencesGUI_button_id_1057"

/*
# Name: button "Rulers" of card "Appearance" of stack "revPreferencesGUI"
# ID: button id 1057 of card id 1006 of stack "revPreferencesGUI"
# Hash: FL/f2WbnxOIO0+c3Z4+2Mg==
*/


on mouseUp
  set the cREVRulerMeasurement of stack "revPreferences" to the label of me
  if "revRulersH" is among the lines of the openStacks then revCalculateRulers
end mouseUp
