Script "stack_FieldInputValidation_field_id_1003"

/*
# Name: field "Website" of card id 1002 of stack "FieldInputValidation"
# ID: field id 1003 of card id 1002 of stack "FieldInputValidation"
# Hash: lWTYUmSCkuEUCDR/lognIA==
*/


on RawKeyUp pWhich
   ValidateMe
   pass RawKeyUp
end RawKeyUp



private command ValidateMe
   validateField me
   if (the result is not EMPTY) then
      set the visible of image "urlNotValidated" to TRUE
      set the visible of image "urlValidated" to FALSE
   else
      if (the text of me is EMPTY) then
         set the visible of image "urlNotValidated" to FALSE
         set the visible of image "urlValidated" to FALSE
      else
         set the visible of image "urlNotValidated" to FALSE
         set the visible of image "urlValidated" to TRUE
      end if
   end if
end ValidateMe
