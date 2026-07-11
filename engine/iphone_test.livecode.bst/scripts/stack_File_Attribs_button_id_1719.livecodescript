Script "stack_File_Attribs_button_id_1719"

/*
# Name: button "Get Badge Value" of card "Notifications" of stack "File Attribs"
# ID: button id 1719 of card id 1712 of stack "File Attribs"
# Hash: /lol3n3vxb/SkwF6dJ7c7Q==
*/


on mouseUp
   local tResult
   iphoneGetNotificationBadgeValue 
   put the result into tResult
   answer tResult with "Okay"
end mouseUp
