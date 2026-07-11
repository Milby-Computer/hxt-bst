Script "stack_revPreferencesGUI_button_id_1217"

/*
# Name: button "double-click" of group "double-click" of card "Application Browser" of stack "revPreferencesGUI"
# ID: button id 1217 of group id 1216 of card id 1013 of stack "revPreferencesGUI"
# Hash: 6sDYcSuXQ+pe+tnqbm6dng==
*/


on menuPick pWhich
  set the cABDoubleClick[revSelObjectType()] of stack "revPreferences" to pWhich
end menuPick
