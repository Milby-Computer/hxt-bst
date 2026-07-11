Script "stack_File_Attribs_button_id_1029"

/*
# Name: button "Landscape" of card "iPhone Tests" of stack "File Attribs"
# ID: button id 1029 of card id 1009 of stack "File Attribs"
# Hash: Mt9e3oIwbw3H1febZYuTPw==
*/


on mouseUp
   if the hilite of me then
      iphoneRotateInterface "landscape left"
   else
      iphoneRotateInterface "portrait"
   end if
end mouseUp
