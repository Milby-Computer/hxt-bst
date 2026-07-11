Script "stack_revPreferencesGUI_button_id_1219"

/*
# Name: button "option double-click" of group "double-click" of card "Application Browser" of stack "revPreferencesGUI"
# ID: button id 1219 of group id 1216 of card id 1013 of stack "revPreferencesGUI"
# Hash: jlH5HSeLVA0yoqCwS4Sprw==
*/


on menuPick pWhich
  set the cABOptionDoubleClick[revSelObjectType()] of stack "revPreferences" to pWhich
end menuPick
