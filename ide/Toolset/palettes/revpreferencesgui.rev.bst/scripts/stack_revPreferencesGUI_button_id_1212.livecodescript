Script "stack_revPreferencesGUI_button_id_1212"

/*
# Name: button "Show audio clips" of card "Application Browser" of stack "revPreferencesGUI"
# ID: button id 1212 of card id 1013 of stack "revPreferencesGUI"
# Hash: V2NCtJpWppUYjkL7Pv03cg==
*/


on mouseUp
  set the cShowAudioclips of stack "revPreferences" to the hilite of me
  revUpdateAB
end mouseUp
