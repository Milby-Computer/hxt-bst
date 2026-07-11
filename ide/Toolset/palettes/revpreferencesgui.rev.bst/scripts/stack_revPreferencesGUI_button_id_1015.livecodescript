Script "stack_revPreferencesGUI_button_id_1015"

/*
# Name: button "UI edit script" of card "General" of stack "revPreferencesGUI"
# ID: button id 1015 of card id 1002 of stack "revPreferencesGUI"
# Hash: s24D8Ot1FolhzdpsW4fXgQ==
*/


on mouseUp
  global gREVUIScriptShortcut
  set the cREVUIScriptShortcut of stack "revPreferences" to the hilite of me
  put the hilite of me into gREVUIScriptShortcut
end mouseUp
