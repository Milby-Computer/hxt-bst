Script "stack_LiveCode_Docs_Editor_button_id_1090"

/*
# Name: button "choose file" of card "card id 1002" of stack "LiveCode Docs Editor"
# ID: button id 1090 of card id 1002 of stack "LiveCode Docs Editor"
# Hash: B/CCdtxjDh29fgbG3EReKw==
*/


on mouseUp
   answer file "Please choose an xml file"
   if the result is not cancel then
      put it into tFile
      
      clearFields
      
      put tFile into field "file"
      loadXML
      processXML
   end if
end mouseUp
