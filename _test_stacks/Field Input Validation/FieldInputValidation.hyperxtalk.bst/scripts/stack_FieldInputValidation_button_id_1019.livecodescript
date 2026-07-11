Script "stack_FieldInputValidation_button_id_1019"

/*
# Name: button "Button" of card id 1002 of stack "FieldInputValidation"
# ID: button id 1019 of card id 1002 of stack "FieldInputValidation"
# Hash: H32xew1NveilsKIk26qESA==
*/


on MouseUp
   set the hintText of field "Date" to "05/08/2026"
   set the inputType of field "Date" to "date"
   set the inputPattern of field "Date" to "[0-9]{2}/[0-9]{2}/[0-9]{4}"
end MouseUp
