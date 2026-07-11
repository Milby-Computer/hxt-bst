Script "stack_revPreferencesGUI_field_id_1071"

/*
# Name: field "tooltip delay" of card "Appearance" of stack "revPreferencesGUI"
# ID: field id 1071 of card id 1006 of stack "revPreferencesGUI"
# Hash: zSC/oIpTvnCveGqKuD6UHQ==
*/


local toolTipDelayLastValue -- stores previous contents in case of error

on closeField
  if the text of me is not an integer then
    beep
    put toolTipDelayLastValue into me
  else if the text of me < zero then
    beep
    put toolTipDelayLastValue into me
  end if
  set the toolTipDelay to me
  set the cREVToolTipDelay of stack "revPreferences" to me
end closeField

on openField
  put the text of me into toolTipDelayLastValue
end openField

on keyDown theKey
  if theKey is in "0123456789" then pass keyDown else beep
end keyDown
