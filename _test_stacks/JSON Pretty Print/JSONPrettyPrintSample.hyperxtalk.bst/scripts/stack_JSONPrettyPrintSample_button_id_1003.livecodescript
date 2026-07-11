Script "stack_JSONPrettyPrintSample_button_id_1003"

/*
# Name: button "Button" of card id 1002 of stack "JSONPrettyPrintSample"
# ID: button id 1003 of card id 1002 of stack "JSONPrettyPrintSample"
# Hash: HkDRot3Bu8je8pcLt/1S+g==
*/


on MouseUp
   local tData
   
   put "Alice" into tData["name"]
   put 30 into tData["age"]
   put "Toronto" into tData["city"]
   put true into tData["active"]
   
   local tJSON
   put JSONExport(tData, TRUE, 4, TRUE) into tJSON
   answer tJSON
end MouseUp
