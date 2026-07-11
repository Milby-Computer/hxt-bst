Script "stack_ae6demo_button_id_1027"

/*
# Name: button "morph" of card id 1024 of stack "ae6demo"
# ID: button id 1027 of card id 1024 of stack "ae6demo"
# Hash: Eyz6eTTkJgzwA5+nf7Y+AA==
*/


on mouseUp
   set the flag of me to not the flag of me
   local tGradient1,tGradient2
   
   put "0.00000,255,55,255" into tGradient1
   put cr &"1.00000,30,70,100" after tGradient1
   
   put "0.00000,25,55,155" into tGradient2
   put cr &"1.00000,242,146,43" after tGradient2
   if the flag of me then
      aeMorphGradientRamp the long ID of grc "morpher",tGradient1,tGradient2,3000,"overshoot"
   else
      aeMorphGradientRamp the long ID of grc "morpher",tGradient2,tGradient1,3000,"bounce"
   end if
end mouseUp
