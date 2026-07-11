Script "stack_File_Attribs_button_id_1211"

/*
# Name: button "Set Headers" of card "URL functions" of stack "File Attribs"
# ID: button id 1211 of card id 1053 of stack "File Attribs"
# Hash: LZbEurpCvHQABIsFEAodlg==
*/


on mouseUp
   local tHeaders
   put "User-Agent: iPhone Test (LiveCode 4.5.2)" &return into tHeaders
   put "Referer: http://www.runrev.com/" & return after tHeaders
   put empty into the last field
   set the httpheaders to theaders
   put "set headers to:" & return & tHeaders & return after the last field
end mouseUp
