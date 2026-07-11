Script "stack_File_Attribs_button_id_1218"

/*
# Name: button "Decrease Timer Count" of card "idle timer" of stack "File Attribs"
# ID: button id 1218 of card id 1214 of stack "File Attribs"
# Hash: lsGvV1VYsLNQRXNH1xBpAQ==
*/


on mouseUp
   iphoneUnlockIdleTimer
   if iphoneIdleTimerLocked() is true then
      put "Timer Locked: Yes" into field timer_status
   else
      put "Timer Locked: No" into field timer_status
   end if
end mouseUp
