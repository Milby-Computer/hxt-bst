Script "stack_File_Attribs_card_id_1573"

/*
# Name: card "Media Picker" of stack "File Attribs"
# ID: card id 1573 of stack "File Attribs"
# Hash: scxjSSv1EHF/rq7MOhhOLA==
*/


global gCurrentItem 
global gWhat

on playStopped tMessage
   answer "Finished this message:" && tMessage with "Okay"
   answer "Finished Playing Sound Card" && gCurrentItem && line gCurrentItem of gWhat with "Okay"
   answer the number of lines in gWhat with "Okay"
   add 1 to gCurrentItem
   if gCurrentItem > the number of lines in gWhat then 
      put 1 into gCurrentItem
   end if
   answer "Now Playing Sound" && gCurrentItem && line gCurrentItem of gWhat with "Okay"
   play line gCurrentItem of gWhat
end playStopped
