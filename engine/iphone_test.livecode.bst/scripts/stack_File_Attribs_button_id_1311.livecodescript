Script "stack_File_Attribs_button_id_1311"

/*
# Name: button "NBSP Test" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1311 of card id 1009 of stack "File Attribs"
# Hash: kfhtLCfkgeC20PzPPwCZ9A==
*/


on mouseUp
   set the script of button "Temp Button" to "on mouseUp;" & numToChar(202) & "answer Hello; end mouseUp;"
   send "mouseUp" to button "Temp Button"
end mouseUp
