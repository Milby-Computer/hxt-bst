Script "stack_File_Attribs_button_id_1178"

/*
# Name: button "go" of group "keyboardbuttons" of card "Keyboard" of stack "File Attribs"
# ID: button id 1178 of group id 1205 of card id 1149 of stack "File Attribs"
# Hash: Gr1m2n5v4C0uRrqSroafNQ==
*/


on mouseUp
   local tButtonName
   set itemdelimiter to quote 
   put item 2 of the target into tButtonName
   set the text of field "Label_2" to tButtonName
   iphoneSetKeyboardReturnKey (tButtonName)   
end mouseUp
