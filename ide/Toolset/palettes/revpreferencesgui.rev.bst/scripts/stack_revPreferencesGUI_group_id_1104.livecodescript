Script "stack_revPreferencesGUI_group_id_1104"

/*
# Name: group "Object Sizes" of card "Object Sizes" of stack "revPreferencesGUI"
# ID: group id 1104 of card id 1009 of stack "revPreferencesGUI"
# Hash: yCk/BhC4t9S05YMNHPXdbQ==
*/


on closeField
  if the text of the target is empty then
    beep
    put the short name of the target into tProp
    put the tProp of stack "revPreferences" into the target
  else
    pass closeField
  end if
end closeField

