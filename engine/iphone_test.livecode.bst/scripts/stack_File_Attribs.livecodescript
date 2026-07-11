Script "stack_File_Attribs"

/*
# Name: stack "File Attribs"
# ID: stack "File Attribs"
# Hash: AIdzuFh6ZF4sTOtOxPxCWQ==
*/


global gCurrentItem 
global gWhat

on preOpenCard
   send "updateNav" to group "navControl"
end preOpenCard

on localNotificationReceived tMessage
   set the text of field "PayloadReceivedLabel" to "Last Payload Type Received: Local Notification"
   put tMessage into field "LastAlertPayload" of card "Notifications"   
   answer "Local:" && quote & tMessage & quote with "Okay"
end localNotificationReceived

on pushNotificationRegistered tMessage
   answer "Registered:" && quote & tMessage & quote with "Okay"
end pushNotificationRegistered

on pushNotificationRegistrationError tMessage
   answer "RegistrationError:" && quote & tMessage & quote with "Okay"
end pushNotificationRegistrationError

on pushNotificationReceived tMessage
   set the text of field "PayloadReceivedLabel" to "Last Payload Type Received: Push Notification"
   put tMessage into field "LastAlertPayload" of card "Notifications"
   answer "Push:" && quote & tMessage & quote with "Okay"
end pushNotificationReceived

on urlWakeUp tMessage
   answer "Woken up by URL:" && quote & tMessage & quote with "Okay"
end urlWakeUp tMessage
