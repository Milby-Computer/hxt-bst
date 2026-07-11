Script "stack_Untitled_1_button_id_1005"

/*
# Name: button "Button" of card id 1002 of stack "Untitled 1"
# ID: button id 1005 of card id 1002 of stack "Untitled 1"
# Hash: qgaqJRP2i411JSJXt4PrfA==
*/


on MouseUp
   set the itemLabel["fileNew"]  of toolbar "myToolbar" to "こんにちは"
   set the itemLabel["fileOpen"] of toolbar "myToolbar" to "Open"
   set the itemLabel["fileSave"] of toolbar "myToolbar" to "Save"
   set the itemNames of toolbar "myToolbar" to "fileNew" & return & "fileOpen" & return & "fileSave"
end MouseUp
