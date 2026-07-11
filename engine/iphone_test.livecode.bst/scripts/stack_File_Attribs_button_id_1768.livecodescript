Script "stack_File_Attribs_button_id_1768"

/*
# Name: button "Music" of card "Media Picker" of stack "File Attribs"
# ID: button id 1768 of card id 1573 of stack "File Attribs"
# Hash: 5C7BEU4v8gFHPS4M0c0hxA==
*/


global gCurrentItem 
global gWhat

on mouseUp
   iphonePickMedia true
   put the result into gWhat
   answer gWhat with "Okay"
   put 1 into gCurrentItem
   answer "Now Playing Sound" && gCurrentItem && line gCurrentItem of gWhat with "Okay"
   play line gCurrentItem of gWhat
end mouseUp

on playStopped
   answer "Finished Playing Sound Button" && gCurrentItem && item gCurrentItem of gWhat with "Okay"
   add 1 to gCurrentLine
   if gCurrent > the number of lines in gWhat then put 1 into gCurrentItem
   answer "Now Playing Sound" && gCurrentItem && line gCurrentItem of gWhat with "Okay"
   play line gCurrentItem of gWhat
end playStopped
