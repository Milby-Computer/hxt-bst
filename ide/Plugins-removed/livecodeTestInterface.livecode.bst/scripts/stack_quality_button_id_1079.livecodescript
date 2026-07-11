Script "stack_quality_button_id_1079"

/*
# Name: button "Button" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1079 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: /8hteYBvtE7o07I2/ClTJQ==
*/


on mouseUp
   local tResult
put empty into tResult
listFilesRecursive tResult, "/Users/johnsmith/OldHdd/Hanson/MY-STUFF-PC/test-framework-UI_1"
answer tResult
end mouseUp
