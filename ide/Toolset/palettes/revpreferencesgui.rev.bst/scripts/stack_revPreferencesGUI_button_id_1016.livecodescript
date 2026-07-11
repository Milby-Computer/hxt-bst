Script "stack_revPreferencesGUI_button_id_1016"

/*
# Name: button "opt edit script shortcut" of card "General" of stack "revPreferencesGUI"
# ID: button id 1016 of card id 1002 of stack "revPreferencesGUI"
# Hash: mroV/wHCDSM+mw31hu2cRA==
*/


on mouseUp
  global gREVScriptShortcut
  set the cREVScriptShortcut of stack "revPreferences" to the hilite of me
  put the hilite of me into gREVScriptShortcut
  set the enabled of button "UI edit script" of cd "general" to the hilite of me
end mouseUp
