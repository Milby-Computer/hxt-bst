Script "stack_NotificationSample_card_id_1002"

/*
# Name: card id 1002 of stack "NotificationSample"
# ID: card id 1002 of stack "NotificationSample"
# Hash: 6ZGk+1iGbSsvxT4FTUDnjg==
*/


on notificationPermissionGranted
   put "granted2"
   wait 2 seconds with messages
   showNotification "Search complete", "Found 42 results", "search-done"
end notificationPermissionGranted

on notificationPermissionDenied
   put "denied"
end notificationPermissionDenied
   
on notificationClicked pTag
   if pTag is "search-done" then
      go card "Results"
   end if
end notificationClicked
