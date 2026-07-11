Script "stack_revMessageWatcher_field_id_1003"

/*
# Name: field "Messages" of card id 1002 of stack "revMessageWatcher"
# ID: field id 1003 of card id 1002 of stack "revMessageWatcher"
# Hash: EsJcG6uySt9spCvmAkg8Hg==
*/


on mouseUp
  selectMessage word 2 of the clickLine
end mouseUp

on mouseDoubleUp
 put the text of fld "object name" into tObject
 if tObject <> "" then edit the script of tObject
end mouseDoubleUp
