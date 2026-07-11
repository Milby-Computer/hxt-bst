Script "stack_revPreferencesGUI_field_id_1068"

/*
# Name: field "gridSize" of group "Appearance" of card "Appearance" of stack "revPreferencesGUI"
# ID: field id 1068 of group id 1062 of card id 1008 of stack "revPreferencesGUI"
# Hash: 2Q0YEaftTTLmTDa9j/EaiA==
*/


on closeField
  if me is not a number then put 2 into me
  set the gridSize to me
  set the cGridSize of stack "revPreferences" to me
  lock messages
  set the thumbposition of sb "grid" to the endValue of sb "grid" - me
  unlock messages
end closeField

on enterInField
  closeField
  select the text of the target
end enterInField

on returnInField
  enterInField
end returnInField
