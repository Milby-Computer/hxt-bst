Script "stack_File_Attribs_card_id_1149"

/*
# Name: card "Keyboard" of stack "File Attribs"
# ID: card id 1149 of stack "File Attribs"
# Hash: yuud2cwioUqhKRZTrj5J/w==
*/


on openCard
   set the traversalOn of group "keyboardbuttons" to false
end openCard

on keyboardActivated
   //answer "Keyboard Activate" with "OK" titled "Keyboard Status"
   set the text of field "VisField" to "Visible"
end keyboardActivated

on keyboardDeactivated
   //answer "Keyboard Deactivated" with "OK" titled "Keyboard Status"
   set the text of field "VisField" to "Not Visible"
end keyboardDeactivated
