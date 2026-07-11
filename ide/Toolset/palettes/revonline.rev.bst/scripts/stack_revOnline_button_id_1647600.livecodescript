Script "stack_revOnline_button_id_1647600"

/*
# Name: button "remove user filter" of group "search filter" of card "main" of stack "revOnline"
# ID: button id 1647600 of group id 1007 of card id 1002 of stack "revOnline"
# Hash: 2tYh1RFJYdD/UzyE1aA7gg==
*/


on mouseUp
   set the cSelectedUser of the owner of me to empty  
end mouseUp

on mouseEnter
   set the textstyle of field "user filter" of the owner of me to "underline,bold"
end mouseEnter

on mouseLeave
   set the textstyle of field "user filter" of the owner of me to "bold"
end mouseLeave

on mouseMove
   set the textstyle of field "user filter" of the owner of me to "underline,bold"
end mouseMove
