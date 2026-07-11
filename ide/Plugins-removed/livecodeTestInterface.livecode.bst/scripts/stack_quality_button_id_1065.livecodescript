Script "stack_quality_button_id_1065"

/*
# Name: button "Get Count PC" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1065 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: pD//qrzzkh514+Ff7rzIdQ==
*/


on mouseUp
   
   qualityGetCount field "Tests", field "LiveCodeVersions", field "TargetPlatforms"
   answer "You have selected" && the result && "tests."
end mouseUp
