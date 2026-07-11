Script "stack_ae6demo_button_id_1055"

/*
# Name: button "reset" of card id 1030 of stack "ae6demo"
# ID: button id 1055 of card id 1030 of stack "ae6demo"
# Hash: r2DaPniyKP5iTixVFgndUQ==
*/


on mouseUp
   aeMoveTo the long ID grc "center", 200,200,1000,"overShoot"
   aeMoveTo the long ID grc 1 of grp "rotateMe",160,145,1000,"overShoot"
   aeMoveTo the long ID grc 2 of grp "rotateMe",150,250,1000,"overShoot"
   aeMoveTo the long ID grc 3 of grp "rotateMe",250,250,1000,"overShoot"
end mouseUp
