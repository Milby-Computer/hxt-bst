Script "stack_livecodeTestInterface_field_id_31143"

/*
# Name: field "versionFilter" of card "main" of stack "livecodeTestInterface"
# ID: field id 31143 of card id 1002 of stack "livecodeTestInterface"
# Hash: hXoyQHIpQtPbBLBOpDZNXA==
*/


--on enterInField
--   versionList the text of me
--end enterInField

--on returnInField
--   versionList the text of me
--end returnInField

on textChanged
   versionList the text of me
end textChanged
