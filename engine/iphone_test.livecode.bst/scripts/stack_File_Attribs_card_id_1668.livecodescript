Script "stack_File_Attribs_card_id_1668"

/*
# Name: card "Rotation Rate" of stack "File Attribs"
# ID: card id 1668 of stack "File Attribs"
# Hash: RY1AYHU9chy3M/Vv9Nh13Q==
*/


on rotationRateChanged
   put the params & return before field "log"
end rotationRateChanged

on locationChanged
   put the params & return before field "log"
end locationChanged

on headingChanged
  put the params & return before field "log"
end headingChanged

on accelerationChanged
   put the params & return before field "log"
end accelerationChanged

on trackingError
   put the params & return before field "log"
end trackingError
