Script "stack_revSmartSave_scrollbar_id_1016"

/*
# Name: scrollbar "TimerScroll" of card id 1002 of stack "revSmartSave"
# ID: scrollbar id 1016 of card id 1002 of stack "revSmartSave"
# Hash: ysMbn4P2waVuWLqPCPqBbw==
*/


on mouseDown
  CancelSmartSaveMsg
  set the thumbPosition of scrollBar "Timer" to 0
end mouseDown

on scrollbarDrag val
  set the thumbPosition of me to val
end scrollbarDrag

on mouseUp
  get the thumbPosition of me
  if it > 1
  then
    set the endValue of scrollBar "Timer" to item it of "0,5,10,15,20,25,30,150,300"
    send "SmartSave" to this stack
  end if
end mouseUp
