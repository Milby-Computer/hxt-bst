Script "stack_revOnline_field_id_261437"

/*
# Name: field "input" of group "tag template" of card "templates" of stack "revOnline"
# ID: field id 261437 of group id 261435 of card id 157677 of stack "revOnline"
# Hash: pOd15xj1kn1oS5M0iz4K3Q==
*/



on returninfield
   if there is a field "auto copy" of the owner of me then
      if the visible of field "auto copy" of the owner of me then
         hide field "auto copy" of the owner of me
         select after me
      else
         addTag
         put empty into me
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
         put empty into me
         refreshList
      end if
   end if
end enterinfield
