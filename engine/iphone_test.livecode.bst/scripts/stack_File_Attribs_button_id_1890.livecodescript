Script "stack_File_Attribs_button_id_1890"

/*
# Name: button "Get Event Data" of card "Calendar" of stack "File Attribs"
# ID: button id 1890 of card id 1887 of stack "File Attribs"
# Hash: Uk233dVhhmG5+BcarZqDlw==
*/


on mouseUp
   local tItemFound
   put mobileGetEventData (line (the word 2 of the selectedline of field "InputData ID") of field "inputData ID") into tItemFound
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
