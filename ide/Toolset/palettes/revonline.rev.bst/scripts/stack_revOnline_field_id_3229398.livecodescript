Script "stack_revOnline_field_id_3229398"

/*
# Name: field "input" of group "tag template 2" of card "templates" of stack "revOnline"
# ID: field id 3229398 of group id 3229396 of card id 157677 of stack "revOnline"
# Hash: h8zPurSbI4WFtM38Qy+OGg==
*/


on returninfield
   if there is a field "auto copy" of the owner of me then
      if the visible of field "auto copy" of the owner of me then
         hide field "auto copy" of the owner of me
         select after me
      else
         addTag
         refreshList
      end if
   end if
end returninfield

on enterinfield
   if there is a field "auto copy" of the owner of me then
      if the visible of field "auto copy" of the owner of me then
         hide field "auto copy" of the owner of me
         select after me
      else
         addTag
         refreshList
      end if
   end if
end enterinfield
