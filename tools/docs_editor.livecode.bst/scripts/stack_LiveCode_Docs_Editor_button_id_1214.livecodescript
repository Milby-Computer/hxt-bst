Script "stack_LiveCode_Docs_Editor_button_id_1214"

/*
# Name: button "refresh" of card "card id 1002" of stack "LiveCode Docs Editor"
# ID: button id 1214 of card id 1002 of stack "LiveCode Docs Editor"
# Hash: 1dVLkYDvtbVGq4knoXVMsg==
*/


on mouseUp
   put field "file" into tFile
   if there is a file tFile then
      clearFields
      put tFile into field "file"
      loadXML
      processXML
   end if
end mouseUp
