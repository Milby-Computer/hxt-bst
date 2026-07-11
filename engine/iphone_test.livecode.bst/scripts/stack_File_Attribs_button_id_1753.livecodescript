Script "stack_File_Attribs_button_id_1753"

/*
# Name: button "Device Token" of card "Notifications" of stack "File Attribs"
# ID: button id 1753 of card id 1712 of stack "File Attribs"
# Hash: sDFjhvk2OZjBNAaF55RVrQ==
*/


on mouseUp
   local tDeviceToken
   iphoneGetDeviceToken
   answer the result with "Okay"
end mouseUp
