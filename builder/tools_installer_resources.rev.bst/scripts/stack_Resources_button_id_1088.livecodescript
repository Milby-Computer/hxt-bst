Script "stack_Resources_button_id_1088"

/*
# Name: button "Check Box Behavior" of card "Resources" of stack "Resources"
# ID: button id 1088 of card id 1023 of stack "Resources"
# Hash: B3cA88AZ88NWnILgcpqX4g==
*/


on preOpenControl
end preOpenControl

on mouseDown
   --set the hilite of button "Check" of me to not the hilite of button "Check" of me
   --dispatch "onCheckChanged" to me
end mouseDown

on mouseUp
   dispatch "onCheckChanged" to me
end mouseUp

on resizeControl
   --set the rect of field "Label" of me to the left of field "Label" of me, the top of field "Label" of me, the right of me, the bottom of field "Label" of me
   set the rect of button "Check" of me to the rect of me
end resizeControl

setProp uLabel pNewLabel
   --set the text of field "Label" of me to pNewLabel
   set the label of button "Check" of me to pNewLabel
end uLabel

getProp uCheck
   return the hilite of button "Check" of me
end uCheck

setProp uCheck pNewCheck
   set the hilite of button "Check" of me to pNewCheck
end uCheck
