Script "stack_revOnline_button_id_3264029"

/*
# Name: button "Button" of group "tag item template" of card "templates" of stack "revOnline"
# ID: button id 3264029 of group id 3264030 of card id 157677 of stack "revOnline"
# Hash: gNvYCWMQ4lHvDGJF919fHg==
*/


on mouseUp
   local tTag
   put the text of field "name" of the owner of me into tTag
   --send "removeTag tTag" to the owner of me in 0 milliseconds
   send "removeTag tTag" to group "tag template 2" of this card of stack "revonline" in 0 milliseconds
end mouseUp
