Script "stack_LiveCode_Docs_Editor_button_id_1101"

/*
# Name: button "save xml" of card "card id 1002" of stack "LiveCode Docs Editor"
# ID: button id 1101 of card id 1002 of stack "LiveCode Docs Editor"
# Hash: lps6vdkZfHBilcscAkIVXg==
*/


on mouseUp
   ask file "Please choose the file you want to save to" with field "file" with type "XML File|xml|XML"
   if the result is not "cancel" then
      put it into tXMLFile
   end if
   
   put buildXML() into tXMLData
   
   put tXMLData into url ("file:" & tXMLFile)
end mouseUp
