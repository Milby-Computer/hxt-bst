Script "stack_revPreferencesGUI_button_id_1218"

/*
# Name: button "command double-click" of group "double-click" of card "Application Browser" of stack "revPreferencesGUI"
# ID: button id 1218 of group id 1216 of card id 1013 of stack "revPreferencesGUI"
# Hash: htC3EdwBiuh18JjzY5waeA==
*/


on menuPick pWhich
  set the cABCommandDoubleClick[revSelObjectType()] of stack "revPreferences" to pWhich
end menuPick
