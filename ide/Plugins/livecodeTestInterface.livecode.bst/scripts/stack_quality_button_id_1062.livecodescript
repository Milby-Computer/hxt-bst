Script "stack_quality_button_id_1062"

/*
# Name: button "Get Count" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1062 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: 1c/HN1hzoIDJkOjfij/WSw==
*/


on mouseUp
   local tItemDetails
   qualityWorkListGetCount the text of field "worklistindex"
   put the result into field "Results"
end mouseUp
