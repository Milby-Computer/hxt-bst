Script "stack_livecodeTestInterface_button_id_10698"

/*
# Name: button "Create" of card "main" of stack "livecodeTestInterface"
# ID: button id 10698 of card id 1002 of stack "livecodeTestInterface"
# Hash: k/XSt3XGLudgS4twPrvd8g==
*/


on mouseUp
   local tTests, tVersions, tPlatforms
   set the itemDelimiter to quote
   
   --preopenStack // PUT THIS SOMEHWERE ELSE LATER
   --put empty into field "Callback Results" // PUT THIS SOMEWHERE ELSE LATER
   
   put testSelected() into tTests
   put versionSelected() into tVersions
   put platformSelected() into tPlatforms
   
   qualityWorklistCreate tTests, tVersions, tPlatforms, the long id of this card
   set the text of field "WorkListID" to the result
end mouseUp


