Script "stack_revVariableWatcher_field_id_1003"

/*
# Name: field "Values" of card "home" of stack "revVariableWatcher"
# ID: field id 1003 of card id 1002 of stack "revVariableWatcher"
# Hash: V83eHN8CPR6BFhIlkylrrw==
*/


on scrollbardrag
  set the scroll of fld "Names" to the scroll of me
  set the scroll of fld "Watched" to the scroll of me
end scrollbardrag

on mouseDown
  selectVar (word 2 of the clickline)
end mouseDown

on selectionChanged
  set the hilitedLines of fld "names" to the hilitedLines of me
  selectVar (the hilitedLines of me)
end selectionChanged
