Script "stack_revPreferencesGUI_button_id_1022"

/*
# Name: button "Image Editor..." of card "General" of stack "revPreferencesGUI"
# ID: button id 1022 of card id 1002 of stack "revPreferencesGUI"
# Hash: haptPIZOeGfJHra41xiKRA==
*/


on mouseUp
  put the cEditorpath of stack "revPreferences" into tEditorPath
  set the itemDel to "/"
  put item 1 to -1 of tEditorPath into tSelector
  set the itemDel to comma
  answer file "Select an image editor:" with tSelector
  lock screen
  if it is not empty then
    put it into fld "external editor"
    set the cEditorpath of stack "revPreferences" to the text of fld "external editor"
    set the itemDel to "/"
    put item -1 of fld "external editor" into fld "external editor"
    set the itemDel to comma
  end if
  unlock screen
end mouseUp
