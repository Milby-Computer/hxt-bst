Script "stack_FieldInputValidation_field_id_1022"

/*
# Name: field "Date" of card id 1002 of stack "FieldInputValidation"
# ID: field id 1022 of card id 1002 of stack "FieldInputValidation"
# Hash: +TL5SofzEFhInkEeVgA4yg==
*/


on RawKeyUp pWhich
   ValidateMe
   pass RawKeyUp
end RawKeyUp



private command ValidateMe
   validateField me
   if (the result is not EMPTY) then
      set the visible of image "dateNotValidated" to TRUE
      set the visible of image "dateValidated" to FALSE
   else
      if (the text of me is EMPTY) then
         set the visible of image "dateNotValidated" to FALSE
         set the visible of image "dateValidated" to FALSE
      else
         set the visible of image "dateNotValidated" to FALSE
         set the visible of image "dateValidated" to TRUE
      end if
   end if
end ValidateMe

