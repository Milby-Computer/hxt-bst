Script "stack_File_Attribs_button_id_1721"

/*
# Name: button "Set Badge Value Now" of card "Notifications" of stack "File Attribs"
# ID: button id 1721 of card id 1712 of stack "File Attribs"
# Hash: 492YrodhX8px0PByWD4F9Q==
*/


on mouseUp
   iphoneSetNotificationBadgeValue word -1 of the label of button "BadgeValue"
end mouseUp
