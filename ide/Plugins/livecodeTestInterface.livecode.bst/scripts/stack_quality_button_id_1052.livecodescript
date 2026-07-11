Script "stack_quality_button_id_1052"

/*
# Name: button "Get Details" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1052 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: vq1rdZD03aOJScjIdGoNFw==
*/


on mouseUp
   local tItemDetails
   qualityWorkListGetItemDetails the text of field "worklistindex", the text of field "indexes"
   put the result into tItemDetails
   get displayArrayData (tItemDetails, "")
   put the result into field "Results"
end mouseUp
