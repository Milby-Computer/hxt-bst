Script "stack_revPreferencesGUI_field_id_1209"

/*
# Name: field "default profile name" of group "Property Profiles" of card "Property Profiles" of stack "revPreferencesGUI"
# ID: field id 1209 of group id 1207 of card id 1012 of stack "revPreferencesGUI"
# Hash: VD7iD8Lv+YBXkPIgHGf0lA==
*/


on closeField
  global gREVTemplateMasterName
  if me is empty then put "Master" into me
  put me into gREVTemplateMasterName
  set the cREVTemplateMasterName of stack "revPreferences" to gREVTemplateMasterName
end closeField

on keyDown theKey
  if (charToNum(toUpper(theKey)) >= 65 and charToNum(toUpper(theKey)) <= 90) \
  or theKey is in "0123456789_" then pass keyDown else beep
end keyDown

on returnInField
  lock screen
  closeField
  select the text of me
  unlock screen
end returnInField

on enterInField
  returnInField
end enterInField
