Script "stack_File_Attribs_button_id_1062"

/*
# Name: button "Post to URL" of card "URL functions" of stack "File Attribs"
# ID: button id 1062 of card id 1053 of stack "File Attribs"
# Hash: z7qea/hWhtmi8TRAAzDqkA==
*/


on mouseUp
   local tPostData
   put "name=iPhoneTest&value=12345" into tPostData
   put empty into the last field
   post tPostData to url "http://ian.on-rev.com/posttest.irev"
   if the result is not empty then
      put "download failed:" && the result & return after the last field
   else
      put "download succeeded:" && the number of chars in it & return after the last field
      put it after the last field
   end if
end mouseUp
