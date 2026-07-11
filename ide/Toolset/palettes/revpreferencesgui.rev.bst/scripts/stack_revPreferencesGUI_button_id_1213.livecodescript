Script "stack_revPreferencesGUI_button_id_1213"

/*
# Name: button "Show video clips" of card "Application Browser" of stack "revPreferencesGUI"
# ID: button id 1213 of card id 1013 of stack "revPreferencesGUI"
# Hash: s6JGUXS3+CryeGnnmoNydg==
*/


on mouseUp
  set the cShowVideoclips of stack "revPreferences" to the hilite of me
  revUpdateAB
end mouseUp
