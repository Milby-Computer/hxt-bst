Script "stack_File_Attribs_button_id_1858"

/*
# Name: button "Get Contact Data" of card "Contact" of stack "File Attribs"
# ID: button id 1858 of card id 1848 of stack "File Attribs"
# Hash: 6oq+pxP4GmzLU77gtfKFFg==
*/


on mouseUp
   local tItemFound
   put mobileGetContactData (field "InputData ID") into tItemFound
   if tItemFound is empty then
      answer "result is empty"
   end if
   if tItemFound is not an array then
      answer "No Records Found" with "Okay"
   else
      put displayArrayData(tItemFound,".") into field "Output Field"
   end if   
end mouseUp

function displayArrayData pArray, pIndent
   # create the variable that loops through the keys in the array
   local tKey
   if pArray is an array then
      # print information to indicate that we are entering a new nested level of the array
      get "Array" & return
      # print full stops that allow the reader to track the depth of an element
      put "." after pIndent
      # create the indentation
      put tab after pIndent
      repeat for each key tKey in pArray
         # call displayArrayData with a nested array
         put format("%s[%s] => %s\n", pIndent, tKey, displayArrayData (pArray[tKey], pIndent)) after it
      end repeat
      delete the last char of it
      return it
   else
      return pArray
   end if 
end displayArrayData
