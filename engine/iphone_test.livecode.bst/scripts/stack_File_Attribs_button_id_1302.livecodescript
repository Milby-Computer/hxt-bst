Script "stack_File_Attribs_button_id_1302"

/*
# Name: button "Enter Password 2" of card "Question Answer Password" of stack "File Attribs"
# ID: button id 1302 of card id 1138 of stack "File Attribs"
# Hash: qwh+PaXAYUoLQ8Y0zngJGA==
*/


on mouseUp
   ask password "Please log in and provide your password:" with "qwert" titled "Password Test"
   put it into field "Password" 
end mouseUp
