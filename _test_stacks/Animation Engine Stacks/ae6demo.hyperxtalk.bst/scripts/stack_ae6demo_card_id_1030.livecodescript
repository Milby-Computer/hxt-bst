Script "stack_ae6demo_card_id_1030"

/*
# Name: card id 1030 of stack "ae6demo"
# ID: card id 1030 of stack "ae6demo"
# Hash: sM6CsCJ2U8Ull/ooa3CJEw==
*/


on openCard
   hide fld "tip"
   set the constrainRectangular of grc "center" to the rect of this cd
   repeat with i=1 to the number of controls of grp "rotateMe"
      set the constrainRectangular of grc i of grp "rotateMe" to the rect of this cd
   end repeat
end openCard

on resizeStack
   set the constrainRectangular of grc "center" to the rect of this cd
   repeat with i=1 to the number of controls of grp "rotateMe"
      set the constrainRectangular of grc i of grp "rotateMe" to the rect of this cd
   end repeat
end resizeStack
