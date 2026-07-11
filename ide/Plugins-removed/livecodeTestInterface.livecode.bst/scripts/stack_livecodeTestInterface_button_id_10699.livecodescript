Script "stack_livecodeTestInterface_button_id_10699"

/*
# Name: button "testRun" of card "main" of stack "livecodeTestInterface"
# ID: button id 10699 of card id 1002 of stack "livecodeTestInterface"
# Hash: 5uRQ76us2H5hETzH4cI+SA==
*/


on mouseUp
   if the label of me is "Start" then
      workListStart
   else if the label of me is "Stop" then
      qualityWorklistStop the text of field "WorkListID" 
      set the label of me to "Start"
   end if
end mouseUp
