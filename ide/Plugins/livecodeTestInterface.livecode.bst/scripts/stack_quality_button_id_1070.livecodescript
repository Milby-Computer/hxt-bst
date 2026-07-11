Script "stack_quality_button_id_1070"

/*
# Name: button "Build Stack" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1070 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: b+gjcgfHv5HXYYgeWV2Zbw==
*/


on mouseUp
   local tItemDetails
   qualityWorkListGetProgress the text of field "worklistindex"
   put the result into field "Results"
end mouseUp
