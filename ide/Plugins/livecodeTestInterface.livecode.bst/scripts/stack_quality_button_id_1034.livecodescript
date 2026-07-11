Script "stack_quality_button_id_1034"

/*
# Name: button "Create" of card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: button id 1034 of card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: Op8TdsAUVPN4YA7b4Eiyiw==
*/


on mouseUp
   set the itemDelimiter to quote
   qualityInitialise
   //preopenStack // PUT THIS SOMEHWERE ELSE LATER
   put empty into field "CallbackResults" // PUT THIS SOMEWHERE ELSE LATER
   //qualityWorklistCreate item 2 of field "ExecutionSyntax", item 4 of field "ExecutionSyntax", item 6 of field "ExecutionSyntax", "XXXXXXXXXX" 
   qualityWorklistCreate field "Tests", field "LiveCodeVersions", field "TargetPlatforms", the long id of card "qualityTestUI"
   set the text of field "WorkListID" to the result
end mouseUp


