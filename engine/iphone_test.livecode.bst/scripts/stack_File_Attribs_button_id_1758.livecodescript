Script "stack_File_Attribs_button_id_1758"

/*
# Name: button "Select and Cancel Local Notification" of card "Notifications" of stack "File Attribs"
# ID: button id 1758 of card id 1712 of stack "File Attribs"
# Hash: FOGcW/W+nSUG6lu5xphe3Q==
*/


/*
on mouseUp   
   local tScheduledNotifications
   iphoneGetRegisteredNotifications
   put the result into tScheduledNotifications
   if tScheduledNotifications is empty then
      answer "There are no pending notifications" with "Okay"
   else
      replace comma with return in tScheduledNotifications
      iphonePick tScheduledNotifications, 1, "cancelDone"
      if the result is not 0 then
         iphoneCancelLocalNotification line the result of tScheduledNotifications
         if the result is false then
            answer "No such notification." with "Okay"
         end if  
      end if
   end if
end mouseUp
*/
on mouseUp
   local tScheduledNotifications, tNotificationList, tDetails
   mobileGetRegisteredNotifications
   put the result into tScheduledNotifications
   put "scheduled notifications:" && tScheduledNotifications
   if tScheduledNotifications is empty then
      answer "There are no pending notifications" with "Okay"
   else
      put empty into tNotificationList
      //replace comma with return in tScheduledNotifications
      put tScheduledNotifications
      repeat for each item tNotification in tScheduledNotifications
         put tNotification
         put mobileGetNotificationDetails(tNotification) into tDetails
         if tDetails is an array then
            put tNotification & comma & tDetails["time"] && tDetails["payload"] & return after tNotificationList
         end if
      end repeat
      mobilePick tNotificationList, 1, "cancelDone"
      if the result is not 0 then
         mobileCancelLocalNotification item 1 of (line (the result) of tNotificationList)
         if the result is false then
            answer "No such notification." with "Okay"
         end if  
      end if
   end if
end mouseUp
