Script "stack_revPreferencesGUI_button_id_1017"

/*
# Name: button "Show Revolution Stacks" of group "General" of card "General" of stack "revPreferencesGUI"
# ID: button id 1017 of group id 1016 of card id 1002 of stack "revPreferencesGUI"
# Hash: EOpbcRSYtxXGMbzDM487Ig==
*/


on mouseUp
  revToggleShowStacks
  if the mode of stack "revPreferences" is not 0
  then modeless "revPreferences"
end mouseUp

on revToggleShowStacks
  global gREVShowStacks
  put the hilite of me into gREVShowStacks
  set the cShowRevolutionStacks of stack "revPreferences" to the hilite of me
  revIDEMessageSend "idePreferenceChanged:cShowRevolutionStacks"
  lock screen
  if the mode of stack "revSearch" is not 0 
  then send "revFeedback" to stack "revSearch"
  revUpdateAB
  put revPalettesList() into tPalettes
  repeat for each line l in tPalettes
    send "revUpdatePalette" to this cd of stack l
  end repeat
  unlock screen
end revToggleShowStacks
