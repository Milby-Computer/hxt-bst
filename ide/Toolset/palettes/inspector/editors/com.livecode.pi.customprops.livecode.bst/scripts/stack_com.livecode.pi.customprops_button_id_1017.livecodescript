Script "stack_com.livecode.pi.customprops_button_id_1017"

/*
# Name: button "rename" of group "buttons" of group "Set buttons" of group "template" of card id 1002 of stack "com.livecode.pi.customprops"
# ID: button id 1017 of group id 1018 of group id 1012 of group id 1004 of card id 1002 of stack "com.livecode.pi.customprops"
# Hash: bYWa6XNL45SpstfTkbejBw==
*/


on mouseUp
   local tLine
   put the label of btn "customPropertySet" into tLine
   if tLine is "customKeys" then
      beep
      exit mouseUp
   end if
   ask question "Please enter a new name:" with tLine as sheet
   if it is empty then exit mouseUp
   if it is among the lines of the propertyNames then
      answer error "A custom property set name cannot be a property name." as sheet
      exit mouseUp
   end if
   
   local tName
   put revValidSetName(it) into tName
   dispatch "propSetRenamed" with tLine, tName
end mouseUp
