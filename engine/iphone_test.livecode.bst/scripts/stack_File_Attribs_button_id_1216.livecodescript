Script "stack_File_Attribs_button_id_1216"

/*
# Name: button "Increase Timer Count" of card "idle timer" of stack "File Attribs"
# ID: button id 1216 of card id 1214 of stack "File Attribs"
# Hash: nKCziop+j7d4BF3Lwux7sQ==
*/


on mouseUp
   iphoneLockIdleTimer
   if iphoneIdleTimerLocked() is true then
      put "Timer Locked: Yes" into field timer_status
   else
      put "Timer Locked: No" into field timer_status
   end if
end mouseUp
