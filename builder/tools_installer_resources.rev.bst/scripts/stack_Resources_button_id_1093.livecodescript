Script "stack_Resources_button_id_1093"

/*
# Name: button "Toggle Behavior" of card "Resources" of stack "Resources"
# ID: button id 1093 of card id 1023 of stack "Resources"
# Hash: lio1HjQzrGAG+J0xBNbbrQ==
*/


local sType

on preOpenControl
   if sType is empty then
      put "allusers" into sType
      updateToggle
   end if
end preOpenControl

setProp uType pNewType
   put pNewType into sType
   updateToggle
end uType

setProp uCheck pNewCheck
   set the hilite of button "Toggle" of me to pNewCheck
end uCheck

on mouseDown
   set the hilite of button "Toggle" of me to true
   dispatch "onCheckChanged" to me
end mouseDown

private command updateToggle
   set the icon of button "Toggle" of me to resolveImageId("button-" & sType)
   set the hiliteIcon of button "Toggle" of me to resolveImageId("button-" & sType & "-selected")
   set the hoverIcon of button "Toggle" of me to resolveImageId("button-" & sType & "-hover")
end updateToggle
