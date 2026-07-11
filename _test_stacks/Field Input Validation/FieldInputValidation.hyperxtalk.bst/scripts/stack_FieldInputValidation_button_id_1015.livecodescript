Script "stack_FieldInputValidation_button_id_1015"

/*
# Name: button "Button" of card id 1002 of stack "FieldInputValidation"
# ID: button id 1015 of card id 1002 of stack "FieldInputValidation"
# Hash: rmSwuxLR19yoCrS2RhbbMA==
*/


on MouseUp
   set the hintText of field "Age" to "20 to 80"
   set the inputType of field "Age" to "number"
   set the inputMin of field "Age" to 20
   set the inputMax of field "Age" to 80
end MouseUp
