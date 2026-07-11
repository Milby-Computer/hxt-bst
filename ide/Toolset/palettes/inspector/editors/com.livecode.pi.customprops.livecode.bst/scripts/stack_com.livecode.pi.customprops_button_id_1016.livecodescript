Script "stack_com.livecode.pi.customprops_button_id_1016"

/*
# Name: button "Remove" of group "buttons" of group "Set buttons" of group "template" of card id 1002 of stack "com.livecode.pi.customprops"
# ID: button id 1016 of group id 1018 of group id 1012 of group id 1004 of card id 1002 of stack "com.livecode.pi.customprops"
# Hash: h5RJogb76q9NLdtPvF2odw==
*/


on mouseUp
   local tSet
   put the label of button "customPropertySet" into tSet
   if tSet is "customKeys" then
      answer warning "Really delete all properties inside the customKey set?" with "Cancel" or "Delete"
      if it is "Cancel" then
         exit mouseUp
      end if
   end if
   
   dispatch "propSetDeleted" with tSet
end mouseUp
