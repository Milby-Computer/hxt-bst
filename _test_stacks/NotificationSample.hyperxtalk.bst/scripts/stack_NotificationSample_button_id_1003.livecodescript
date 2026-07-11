Script "stack_NotificationSample_button_id_1003"

/*
# Name: button "Button" of card id 1002 of stack "NotificationSample"
# ID: button id 1003 of card id 1002 of stack "NotificationSample"
# Hash: umIUNfH9CnzPX6YOqmmtVw==
*/


on MouseUp
   put notificationPermission()
   if notificationPermission() is not "granted" then
      requestNotificationPermission
   else
      wait 2 seconds with messages
      showNotification "Search complete", "Found 42 results", "search-done"
   end if
end MouseUp

