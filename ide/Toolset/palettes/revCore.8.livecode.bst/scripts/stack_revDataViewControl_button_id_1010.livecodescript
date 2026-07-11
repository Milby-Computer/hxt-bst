Script "stack_revDataViewControl_button_id_1010"

/*
# Name: button "dvTrackDragDrop Behavior" of card id 1002 of stack "revDataViewControl" of stack "revCore"
# ID: button id 1010 of card id 1002 of stack "revDataViewControl" of stack "revCore"
# Hash: 4S40Zs7Zv9tcjI5rmxvgdg==
*/


--> all handlers

local sTargetControl

setprop dvTargetControl pValue
   put the long id of pValue into sTargetControl
end dvTargetControl


on dragDrop
   if sTargetControl is in the long id of the target then
      send "dvDragDrop" to sTargetControl
   end if
   pass dragDrop
end dragDrop


on dragEnd
   ## Always send cleanup to control, even if control isn't the target.
   ## This allows cleanup when dragging between data views.
   send "dvDragEnd" to sTargetControl
   pass dragEnd
end dragEnd


on dragMove pMouseH,pMouseV
   send "dvDragMove pMouseH, pMouseV" to sTargetControl
   pass dragMove
end dragMove


on dragLeave
   send "dvDragLeave" to sTargetControl
   pass dragLeave
end dragLeave
