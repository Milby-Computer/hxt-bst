Script "stack_revVariableWatcher_field_id_1004"

/*
# Name: field "Names" of card "home" of stack "revVariableWatcher"
# ID: field id 1004 of card id 1002 of stack "revVariableWatcher"
# Hash: 2K5zB3np9A7OEr3V6Pqe6g==
*/


on mouseDown
  selectVar (word 2 of the clickline)
end mouseDown

on selectionChanged
  set the hilitedLines of fld "values" to the hilitedLines of me
  selectVar (the hilitedLines of me)
end selectionChanged

on scrollBarDrag x
  set the scroll of fld "values" to x
end scrollBarDrag
