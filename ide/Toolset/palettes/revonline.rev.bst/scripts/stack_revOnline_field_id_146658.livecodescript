Script "stack_revOnline_field_id_146658"

/*
# Name: field "user filter" of group "search filter" of card "main" of stack "revOnline"
# ID: field id 146658 of group id 1007 of card id 1002 of stack "revOnline"
# Hash: KbgVC45SlXLL/ju/Iey9Tg==
*/


on mouseUp
   set the cSelectedUser of the owner of me to empty  
end mouseUp

on mouseEnter
   set the textstyle of me to "underline,bold"
   set the icon of button "remove user filter" of the owner of me to 205421
end mouseEnter

on mouseLeave
   set the textstyle of me to "bold"
   set the icon of button "remove user filter" of the owner of me to 205422
end mouseLeave

on mouseMove
   set the textstyle of me to "underline,bold"
   set the icon of button "remove user filter" of the owner of me to 205421
end mouseMove
