Script "stack_Resources_button_id_1100"

/*
# Name: button "Progress Behavior" of card "Resources" of stack "Resources" of stack "Installer"
# ID: button id 1100 of card id 1023 of stack "Resources" of stack "Installer"
# Hash: Uq7QrVC3fqsm/KHcyyF3wQ==
*/


local sProgress

on preOpenControl
   set the lockLoc of group "Bar" to true
   set the rect of button "Fill" to the left of me, the top of me, the right of me, the top of me + 15
   put 0 into sProgress
   updateFill
end preOpenControl

setProp uProgress pNewProgress
   put trunc(10 * pNewProgress) into sProgress
   updateFill
end uProgress

private command updateFill
   set the rect of group "Bar" of me to the left of me, the top of me, the left of me + sProgress * the width of me div 1000, the bottom of me
end updateFill
