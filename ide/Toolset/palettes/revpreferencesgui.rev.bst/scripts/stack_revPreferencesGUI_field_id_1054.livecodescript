Script "stack_revPreferencesGUI_field_id_1054"

/*
# Name: field "Num Recent Files" of group "Files & Memory" of card "Files & Memory" of stack "revPreferencesGUI"
# ID: field id 1054 of group id 1041 of card id 1007 of stack "revPreferencesGUI"
# Hash: zi+NYmdKoIm1kGW2ici5OQ==
*/


on keyDown pKey
  if pKey is not a number then beep
  else pass keyDown
end keyDown

on closeField
  set the cNumRecent of stack "revPreferences" to the text of me
 end closeField
