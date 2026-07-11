Script "stack_ae6demo_button_id_1011"

/*
# Name: button "morph" of card id 1008 of stack "ae6demo"
# ID: button id 1011 of card id 1008 of stack "ae6demo"
# Hash: rfYhQN+XYfnZuaZTfDUtlg==
*/


local sPoints1,sPoints2

on mouseUp
   local tEffect
   set the flag of me to not the flag of me
   if the hilitedButton of grp "Effect" <1 then set the hilitedButton of grp "Effect" to 1
   if sPoints2 is empty then
      repeat with i= 1 to 360
         put pointOnCircle(100,170,i,50) & cr  after sPoints2
      end repeat
      delete char -1 of sPoints2
   end if
   if sPoints1 is empty then
      repeat with i= 1 to 360
         put pointOnLine(50,170,250,250,i) & cr  after sPoints1
      end repeat
      delete char -1 of sPoints1
   end if
   --set the points of grc "morph" to sPoints1
   put the short name of btn ( the hilitedButton of grp "Effect") of grp "Effect" into tEffect
   if tEffect ="none" then put empty into tEffect
   if the flag of me then
      aeMorphGraphic the long ID of grc "morpher",sPoints1,sPoints2,1500, tEffect
   else
      aeMorphGraphic the long ID of grc "morpher",sPoints2,sPoints1,1500, tEffect
   end if
end mouseUp
