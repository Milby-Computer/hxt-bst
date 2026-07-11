Script "stack_FieldInputValidation_button_id_1007"

/*
# Name: button "Button" of card id 1002 of stack "FieldInputValidation"
# ID: button id 1007 of card id 1002 of stack "FieldInputValidation"
# Hash: N4VC1zdRTaMTNcaMf3wSlg==
*/


on MouseUp
   set the hintText of field "EmailAddress" to "user@example.com"
   set the inputType of field "EmailAddress" to "email"
end MouseUp
