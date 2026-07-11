Script "stack_File_Attribs_button_id_1128"

/*
# Name: button "put URL into ..." of card "URL functions" of stack "File Attribs"
# ID: button id 1128 of card id 1053 of stack "File Attribs"
# Hash: i+1KVUpIXqbyY6sC1rLVxQ==
*/


on mouseUp
   local tURLContents
   put empty into the last field
   put url binURL() into tURLContents
   if the result is not empty then
      put "download failed:" && the result & return after the last field
   else
      put "download succeeded:" && the number of chars in tURLContents & return after the last field
   end if
end mouseUp
