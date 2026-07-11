Script "stack_ToolbarSample_button_id_1005"

/*
# Name: button "Button" of card id 1002 of stack "ToolbarSample"
# ID: button id 1005 of card id 1002 of stack "ToolbarSample"
# Hash: /zb50uaxXjVplnRbz+NUtQ==
*/


on MouseUp
   create toolbar "myToolbar" in this stack
   set the itemLabel["fileNew"] of toolbar "myToolbar" to "New"
   set the itemLabel["fileOpen"] of toolbar "myToolbar" to "Open"
   set the itemLabel["fileSave"] of toolbar "myToolbar" to "Save"
   set the itemIcon["fileNew"] of toolbar "myToolbar" to "doc.badge.plus"
   set the itemIcon["fileOpen"] of toolbar "myToolbar" to "folder"
   set the itemIcon["fileSave"] of toolbar "myToolbar" to "square.and.arrow.down"
   set the toolbarVisible of toolbar "myToolbar" to true
end MouseUp
