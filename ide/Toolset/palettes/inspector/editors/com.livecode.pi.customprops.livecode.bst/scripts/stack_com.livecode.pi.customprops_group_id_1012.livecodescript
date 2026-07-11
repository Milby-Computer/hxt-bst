Script "stack_com.livecode.pi.customprops_group_id_1012"

/*
# Name: group "Set buttons" of group "template" of card id 1002 of stack "com.livecode.pi.customprops"
# ID: group id 1012 of group id 1004 of card id 1002 of stack "com.livecode.pi.customprops"
# Hash: xFyb/6R7dGQUkdE8zHLQNQ==
*/


on groupResize pLabelSize, pControlGap
   set the width of field "set" of me to pLabelSize
   set the height of field "set" of me to 21
   set the loc of field "set" of me to the loc of me
   set the left of field "set" of me to the left of me
   
   set the loc of group "buttons" of me to the loc of me
   set the right of group "buttons" of me to the right of me
   
   local tSpace
   put the left of group "buttons" of me  - the right of field "set" of me into tSpace
   subtract 2 * pControlGap from tSpace
   set the width of button "customPropertySet" of me to tSpace
   set the height of button "customPropertySet" of me to 24
   set the loc of button "customPropertySet" of me to the loc of me
   set the left of button "customPropertySet" of me to the right of field "set" of me + pControlGap
end groupResize
