Script "stack_revIconChooser_scrollbar_id_1004"

/*
# Name: scrollbar "iconchooserscrollbar" of bkgnd "Select an icon" of stack "revIconChooser"
# ID: scrollbar id 1004 of bkgnd id 1063 of stack "revIconChooser"
# Hash: W0u9SRZZhOTq1HxlXnYl9A==
*/


local lTimerID, lRestore

on scrollbarDrag x
  if lRestore is empty then put the repeatRate into lRestore
  set the repeatRate to 500
  put the milliseconds into lWait
  put ((trunc(x / 10))*10) into x
  add 1 to x
  if x is 0 then put 1 into x
  lock screen
  put lineOffset(the icon of btn 1,the cIconsList of this cd) into tCurrent
  if tCurrent is not x then
    put 0 into tButtonNumber
    put the cIconsList of this cd into tList
    repeat with i = x to (x + 49)
      add 1 to tButtonNumber
      set the icon of btn tButtonNumber to line i of tList
    end repeat
  end if
  unlock screen
  if lTimerID is not empty then cancel lTimerID
  send "revRestoreRate" to me in 500 milliseconds
  put the result into lTimerID
end scrollbarDrag

on revRestoreRate
  set the repeatRate to lRestore
end revRestoreRate
