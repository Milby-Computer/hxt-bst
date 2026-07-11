Script "stack_FieldInputValidation_field_id_1016"

/*
# Name: field "Age" of card id 1002 of stack "FieldInputValidation"
# ID: field id 1016 of card id 1002 of stack "FieldInputValidation"
# Hash: 3nOn262r9SHfBMFLfChbTg==
*/


on RawKeyUp pWhich
   ValidateMe
   pass RawKeyUp
end RawKeyUp



private command ValidateMe
   validateField me
   if (the result is not EMPTY) then
      set the visible of image "ageNotValidated" to TRUE
      set the visible of image "ageValidated" to FALSE
   else
      if (the text of me is EMPTY) then
         set the visible of image "ageNotValidated" to FALSE
         set the visible of image "ageValidated" to FALSE
      else
         set the visible of image "ageNotValidated" to FALSE
         set the visible of image "ageValidated" to TRUE
      end if
   end if
end ValidateMe

