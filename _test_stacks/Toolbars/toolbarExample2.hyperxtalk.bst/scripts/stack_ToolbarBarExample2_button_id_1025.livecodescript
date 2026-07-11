Script "stack_ToolbarBarExample2_button_id_1025"

/*
# Name: button "Button" of card id 1002 of stack "ToolbarBarExample2"
# ID: button id 1025 of card id 1002 of stack "ToolbarBarExample2"
# Hash: Y2tT+IMyKQTbr3vkxZkShA==
*/


on MouseUp
   set the itemIcon["fileNew"] of toolbar "myToolbar" to "settings"
   set the itemIcon["fileOpen"] of toolbar "myToolbar" to "square.and.arrow.down"
end MouseUp
