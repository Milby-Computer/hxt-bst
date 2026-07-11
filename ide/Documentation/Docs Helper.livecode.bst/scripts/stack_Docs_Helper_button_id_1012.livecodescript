Script "stack_Docs_Helper_button_id_1012"

/*
# Name: button "Test" of card id 1002 of stack "Docs Helper"
# ID: button id 1012 of card id 1002 of stack "Docs Helper"
# Hash: lyht4CTlMb11TlLGBatgZQ==
*/


on mouseUp
   dispatch "validateEntry" to stack "LibrarySubstack" with field "Text"
   showErrors the result
end mouseUp
