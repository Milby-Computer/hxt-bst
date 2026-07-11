Script "stack_ae6demo_button_id_1005"

/*
# Name: button "clockwise" of card id 1007 of stack "ae6demo"
# ID: button id 1005 of card id 1007 of stack "ae6demo"
# Hash: comICWd9ivhcMv8NNe4PKQ==
*/


on mouseUp
   set the loc of grc "ball" to pointOnCircle(the loc of grc "path",0,80)
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
   aeChangeAngleCircular the long ID of grc "ball",the loc of grc "path",80,270,2000,"clockwise","inout"
end mouseUp
