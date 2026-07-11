Script "stack_ae6demo_button_id_1041"

/*
# Name: button "rotateGroup" of card id 1030 of stack "ae6demo"
# ID: button id 1041 of card id 1030 of stack "ae6demo"
# Hash: QrB+X+QArhr/AlGf4UzL5A==
*/


on mouseUp
   AErotateGroup the long ID of grp "rotateMe", the loc of grc "Center",90,1000,"overshoot"
   if not the visible of fld "tip" then show fld "tip"
end mouseUp
