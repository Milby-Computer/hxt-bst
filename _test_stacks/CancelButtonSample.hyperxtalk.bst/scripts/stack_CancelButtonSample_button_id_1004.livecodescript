Script "stack_CancelButtonSample_button_id_1004"

/*
# Name: button "cancelbutton" of card id 1002 of stack "CancelButtonSample"
# ID: button id 1004 of card id 1002 of stack "CancelButtonSample"
# Hash: 1p8uoMcWYbfWbC2NxWO0Bw==
*/


on MouseUp
   set the cancelbutton of field "Field" to (not the cancelButton of field "Field")
end MouseUp
