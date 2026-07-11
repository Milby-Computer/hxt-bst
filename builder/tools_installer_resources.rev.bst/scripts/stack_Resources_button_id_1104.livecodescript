Script "stack_Resources_button_id_1104"

/*
# Name: button "Radio Box Behavior" of card "Resources" of stack "Resources"
# ID: button id 1104 of card id 1023 of stack "Resources"
# Hash: T8YfYCNCHUKWVvoLpNvY6Q==
*/


on preOpenControl
end preOpenControl

on mouseDown
   --set the hilite of button "Radio" of me to true
   --dispatch "onCheckChanged" to me
end mouseDown

on mouseUp
   send "onCheckChanged" to me in 0 seconds
end mouseUp

on resizeControl
   --set the rect of field "Label" of me to the left of field "Label" of me, the top of field "Label" of me, the right of me, the bottom of field "Label" of me
   set the rect of button "Radio" of me to the rect of me
end resizeControl

setProp uLabel pNewLabel
   --set the text of field "Label" of me to pNewLabel
   set the label of button "Radio" of me to pNewLabel
end uLabel

getProp uCheck
   return the hilite of button "Radio" of me
end uCheck

setProp uCheck pNewCheck
   set the hilite of button "Radio" of me to pNewCheck
end uCheck
