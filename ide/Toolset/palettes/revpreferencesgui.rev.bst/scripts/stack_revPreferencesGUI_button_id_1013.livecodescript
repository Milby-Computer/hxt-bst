Script "stack_revPreferencesGUI_button_id_1013"

/*
# Name: button "Context menus work on Rev dev stacks" of card "General" of stack "revPreferencesGUI"
# ID: button id 1013 of card id 1002 of stack "revPreferencesGUI"
# Hash: tyTMRNaFY7FZwumCSDrM9g==
*/


on mouseUp
  global gREVPopups
  set the cRevPopups of stack "revPreferences" to the hilite of me
  put the hilite of me into gREVPopups
end mouseUp
