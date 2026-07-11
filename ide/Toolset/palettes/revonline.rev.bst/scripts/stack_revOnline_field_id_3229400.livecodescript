Script "stack_revOnline_field_id_3229400"

/*
# Name: field "Cancel" of group "tag template 2" of card "templates" of stack "revOnline"
# ID: field id 3229400 of group id 3229396 of card id 157677 of stack "revOnline"
# Hash: OiV6EIy0pieuWfwT/7mtXA==
*/


constant kColor = "251,213,79"

on mousemove
   if the mousetext is not empty then
      set the textColor of me to kColor
   else
      set the textColor of me to "white"
   end if
end mousemove

on mouseleave
   set the textColor of me to "white"
end mouseleave
