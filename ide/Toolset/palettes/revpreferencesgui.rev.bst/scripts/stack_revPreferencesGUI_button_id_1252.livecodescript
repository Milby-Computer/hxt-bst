Script "stack_revPreferencesGUI_button_id_1252"

/*
# Name: button "Reset Object Sizes" of card "Object Sizes" of stack "revPreferencesGUI"
# ID: button id 1252 of card id 1009 of stack "revPreferencesGUI"
# Hash: /WeY9rfZJiGDpAikr85egA==
*/


on mouseUp
  local tName
  
  repeat for each line tDefaultSize in the cDefaultSizes of stack "revPreferences"
    put item 1 of tDefaultSize into tName
    set the tName of stack "revPreferences" to item 2 of tDefaultSize
  end repeat
  updateDefaultSizeFields
end mouseUp
