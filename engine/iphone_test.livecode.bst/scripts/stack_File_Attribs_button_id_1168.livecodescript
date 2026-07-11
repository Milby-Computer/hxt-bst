Script "stack_File_Attribs_button_id_1168"

/*
# Name: button "phone" of group "keyboardbuttons" of card "Keyboard" of stack "File Attribs"
# ID: button id 1168 of group id 1205 of card id 1149 of stack "File Attribs"
# Hash: ie+oj9nNtxnKJba7q4Osfg==
*/


on mouseUp
   local tButtonName
   set itemdelimiter to quote 
   put item 2 of the target into tButtonName
   set the text of field "Label_1" to tButtonName
   iphoneSetKeyboardType (tButtonName)   
end mouseUp
