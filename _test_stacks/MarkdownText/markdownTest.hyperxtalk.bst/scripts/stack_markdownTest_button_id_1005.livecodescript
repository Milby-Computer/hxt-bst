Script "stack_markdownTest_button_id_1005"

/*
# Name: button "Button" of card id 1002 of stack "markdownTest"
# ID: button id 1005 of card id 1002 of stack "markdownTest"
# Hash: 0gfJhIW7JNYyKtErkh6D2g==
*/


on MouseUp
   local tMDT
   put the text of field 2 into tMDT
   set the markdowntext of field "markdownTest" to tMDT
end MouseUp
