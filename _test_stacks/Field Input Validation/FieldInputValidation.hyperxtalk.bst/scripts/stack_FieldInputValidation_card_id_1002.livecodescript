Script "stack_FieldInputValidation_card_id_1002"

/*
# Name: card id 1002 of stack "FieldInputValidation"
# ID: card id 1002 of stack "FieldInputValidation"
# Hash: qD8oOHo9Wshf53OrN1WAEg==
*/


on fieldValidationFailed pFieldName, pError
   select after word -1 of field pFieldName
   --   put pError && the seconds //into field "ErrorLabel"
end fieldValidationFailed
