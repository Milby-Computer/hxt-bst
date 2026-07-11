Script "stack_File_Attribs_button_id_1672"

/*
# Name: button "Get Current" of card "Rotation Rate" of stack "File Attribs"
# ID: button id 1672 of card id 1668 of stack "File Attribs"
# Hash: adMb2NkwaQ3pg0DGHUSYdw==
*/


on mouseUp
   get mobileSensorReading(the label of button "sensor", true) 
   if it is an array then
      combine it using return and "="
   end if
   put "Current Reading" && it & return before field "log"
end mouseUp
