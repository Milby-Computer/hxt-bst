Script "stack_revDataViewControl_button_id_1019"

/*
# Name: button "Drop Indicator Behavior" of card id 1002 of stack "revDataViewControl" of stack "revCore"
# ID: button id 1019 of card id 1002 of stack "revDataViewControl" of stack "revCore"
# Hash: w3ZPtkmfaSlZc4ilUnoF6A==
*/


on resizeControl
   if the target is not me then pass resizeControl
   
   put the rect of me into theViewRect
   
   put the rect of graphic 2 of me into theRect
   put item 3 of theViewRect + 1 into item 3 of theRect
   set the rect of graphic 2 of me to theRect
end resizeControl
