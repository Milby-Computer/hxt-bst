Script "stack_File_Attribs_button_id_1026"

/*
# Name: button "Test Files" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1026 of card id 1009 of stack "File Attribs"
# Hash: nCpYF9ubQV6rFlJpft4EeA==
*/


on mouseUp
   set the folder to specialFolderPath("engine")
   put the files & return & the folders & return into field "Touches"
end mouseUp
