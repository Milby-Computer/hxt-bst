Script "stack_FieldInputValidation_field_id_1008"

/*
# Name: field "EmailAddress" of card id 1002 of stack "FieldInputValidation"
# ID: field id 1008 of card id 1002 of stack "FieldInputValidation"
# Hash: QcRP7NsBtVjW7DzYIVVW4A==
*/


on RawKeyUp pWhich
   ValidateMe
   pass RawKeyUp
end RawKeyUp



private command ValidateMe
   validateField me
   if (the result is not EMPTY) then
      set the visible of image "emailNotValidated" to TRUE
      set the visible of image "emailValidated" to FALSE
   else
      if (the text of me is EMPTY) then
         set the visible of image "emailNotValidated" to FALSE
         set the visible of image "emailValidated" to FALSE
      else
         set the visible of image "emailNotValidated" to FALSE
         set the visible of image "emailValidated" to TRUE
      end if
   end if
end ValidateMe

