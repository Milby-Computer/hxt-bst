Script "stack_File_Selector_field_id_1010"

/*
# Name: field "Directories" of card "File Selector Card" of stack "File Selector"
# ID: field id 1010 of card id 1002 of stack "File Selector"
# Hash: dvYENTJtqYPMPPFvbNLc/w==
*/


on mouseUp
  if not the visible of field "Files" then put the selectedText of me into field "Selection"
end mouseUp

on mouseDoubleUp
  local olddir
  put the directory into olddir
  set the directory to olddir & "/" & the clickText
  if the result is not empty then
    answer "Can't set to that directory."
    set the directory to olddir
  else refresh
  if not the visible of field "Files" then put empty into field "Selection"
end mouseDoubleUp
