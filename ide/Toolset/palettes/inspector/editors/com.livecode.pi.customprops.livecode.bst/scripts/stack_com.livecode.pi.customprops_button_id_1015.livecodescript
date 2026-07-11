Script "stack_com.livecode.pi.customprops_button_id_1015"

/*
# Name: button "New" of group "buttons" of group "Set buttons" of group "template" of card id 1002 of stack "com.livecode.pi.customprops"
# ID: button id 1015 of group id 1018 of group id 1012 of group id 1004 of card id 1002 of stack "com.livecode.pi.customprops"
# Hash: +jJCgOdi517HNg36YyQ/NQ==
*/


on mouseUp
   ask question "Enter a name for the new custom property set" as sheet
   if it is empty then exit mouseUp
   set the caseSensitive to true
   if it is among the lines of the propertyNames then
      answer error "A custom property set name cannot be a property name." as sheet
      exit mouseUp
   end if
   
   local tName
   put revValidSetName(it) into tName
   dispatch "propSetAdded" with tName
end mouseUp
