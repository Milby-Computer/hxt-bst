Script "stack_revPreferencesGUI_field_id_1045"

/*
# Name: field "Num Recent Files" of card "Files" of stack "revPreferencesGUI"
# ID: field id 1045 of card id 1005 of stack "revPreferencesGUI"
# Hash: zi+NYmdKoIm1kGW2ici5OQ==
*/


on keyDown pKey
  if pKey is not a number then beep
  else pass keyDown
end keyDown

on closeField
  set the cNumRecent of stack "revPreferences" to the text of me
 end closeField
