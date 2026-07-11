Script "stack_quality_button_id_1069"

/*
# Name: button "Tags" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1069 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: thG+fxTe2L+q0gk5gkBauA==
*/


on mouseUp
   qualityGetTestTags field "ExecutionSyntax"
   answer "You have the following tags:" & return & the result
end mouseUp
