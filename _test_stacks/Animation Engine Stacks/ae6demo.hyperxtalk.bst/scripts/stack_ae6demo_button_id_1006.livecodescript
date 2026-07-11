Script "stack_ae6demo_button_id_1006"

/*
# Name: button "counterclockwise" of card id 1007 of stack "ae6demo"
# ID: button id 1006 of card id 1007 of stack "ae6demo"
# Hash: 1KFjuRJzprHqoMXA01YP0A==
*/


on mouseUp
   /* parameters:
   long ID of the object to move
   centerX of path
   centerY of path (can be combined expression)
   radius from center
   desired new angle
   duration in millisecs
   direction (clockwise OR counterClockwise
   easing method
   */
   local tAngle,tNewAngle
   put findAngle(the loc of grc "path",the loc of grc "ball") into tAngle
   put tAngle - 180 - random(50) into tNewAngle
   if tNewAngle < 0 then put tNewAngle + 360 into tNewAngle
   aeChangeAngleCircular the long ID of grc "ball",the loc of grc "path",80,tNEwAngle,2000,"counterclockwise","bounce"
end mouseUp
