Script "stack_revRotate_button_id_1012"

/*
# Name: button "OK" of card id 1002 of stack "revRotate"
# ID: button id 1012 of card id 1002 of stack "revRotate"
# Hash: 74wGnoyP61d5KM0tmttBRA==
*/


on mouseUp
   local tRotate
   put fld "Rotate" into tRotate
   if the hilitedButtonName of grp "Direction" is "Right" then 
      put 360 - tRotate into tRotate
   end if
   set the cRotateImage of this stack to tRotate
   set the cRotateGraphic of this stack to tRotate
   close this stack
end mouseUp
