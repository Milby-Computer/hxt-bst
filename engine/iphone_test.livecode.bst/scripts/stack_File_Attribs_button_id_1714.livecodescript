Script "stack_File_Attribs_button_id_1714"

/*
# Name: button "Send Local Notification" of card "Notifications" of stack "File Attribs"
# ID: button id 1714 of card id 1712 of stack "File Attribs"
# Hash: HLZahwJxS8a3I0WjpPkbyA==
*/


on mouseUp
   local tNotificationTime
   put the seconds into tNotificationTime
   put tNotificationTime + word -1 of the label of button "NotifyAfter" into tNotificationTime
   if the hilite of button "SetBadge" is true then
      mobileCreateLocalNotification field "AlertBody", field "AlertButton", field "AlertPayload", tNotificationTime, the hilite of button "PlaySound", word -1 of the label of button "BadgeValue"
   else
      mobileCreateLocalNotification field "AlertBody", field "AlertButton", field "AlertPayload", tNotificationTime, the hilite of button "PlaySound"
   end if  
end mouseUp
