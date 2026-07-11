Script "stack_File_Attribs_button_id_1063"

/*
# Name: button "Load URL" of card "URL functions" of stack "File Attribs"
# ID: button id 1063 of card id 1053 of stack "File Attribs"
# Hash: EEa8Z3fEY9oqyx0TURWJfg==
*/


on mouseUp
   put empty into the last field
   load url binURL() with message "loadCallback"
   if the result is not empty then
      put "url load failed:" && the result & return after the last field
   else
      put "loading url..." & return after the last field
   end if
end mouseUp


on loadCallback pUrl, pStatus, pData
   put "loading ended with status:" && pStatus && "of url" && pURL & return after the last field
   if pStatus is "downloaded" then
      put "loaded" && the number of chars in pData && "bytes" & return after the last field
   end if
end loadCallback
