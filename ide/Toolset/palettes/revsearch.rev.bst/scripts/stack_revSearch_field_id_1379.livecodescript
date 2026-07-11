Script "stack_revSearch_field_id_1379"

/*
# Name: field "Type" of group "group id 1384" of card id 1002 of stack "revSearch"
# ID: field id 1379 of group id 1384 of card id 1002 of stack "revSearch"
# Hash: ly64Te0C6/7w5Ud7Sju2Xg==
*/


local lMessageID, lMoving

on mouseDown
  put true into lMoving
  lock screen
  set the hilitedLines of fld "name" to the hilitedLines of me
  set the hilitedLines of fld "card" to the hilitedLines of me
  set the hilitedLines of fld "stack" to the hilitedLines of me
  set the scroll of fld "name" to the scroll of me
  set the scroll of fld "card" to the scroll of me
  set the scroll of fld "stack" to the scroll of me
  unlock screen
end mouseDown

on selectionChanged
  lock screen
  set the hilitedLines of fld "name" to the hilitedLines of me
  set the hilitedLines of fld "card" to the hilitedLines of me
  set the hilitedLines of fld "stack" to the hilitedLines of me
  set the scroll of fld "name" to the scroll of me
  set the scroll of fld "card" to the scroll of me
  set the scroll of fld "stack" to the scroll of me
  set the thumbPosition of sb "results" to the scroll of me
  unlock screen
end selectionChanged

on mouseMove
  if lMoving then
    lock messages
    lock screen
    set the hilitedLines of fld "stack" to the hilitedLines of me
    set the hilitedLines of fld "name" to the hilitedLines of me
    set the hilitedLines of fld "card" to the hilitedLines of me
    set the scroll of fld "stack" to the scroll of me
    set the scroll of fld "name" to the scroll of me
    set the scroll of fld "card" to the scroll of me
    set the thumbPosition of sb "results" to the scroll of me
    unlock screen
    unlock messages
  end if
end mouseMove

on mouseUp 
  put false into lMoving
  pass mouseUp
end mouseUp

on mouseRelease
  put false into lMoving
  pass mouseRelease
end mouseRelease

on scrollBarDrag
  lock messages
  lock screen
  set the scroll of fld "stack" to the scroll of me
  set the scroll of fld "name" to the scroll of me
  set the scroll of fld "card" to the scroll of me
  set the thumbPosition of sb "results" to the scroll of me
  unlock screen
  unlock messages
end scrollBarDrag
