Script "stack_File_Selector_field_id_1006"

/*
# Name: field "Files" of card "File Selector Card" of stack "File Selector"
# ID: field id 1006 of card id 1002 of stack "File Selector"
# Hash: /7R+O6DoAx8E1XESl5NxDA==
*/


on mouseUp
  put the clickText into field "Selection"
end mouseUp

on mouseDoubleUp
  send "mouseUp" to button id 1013
end mouseDoubleUp

on rawKeyUp
  put the selectedText of me into field "Selection"
end rawKeyUp
