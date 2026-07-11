Script "stack_livecodeTestInterface_group_id_305990"

/*
# Name: group "testResults" of card "main" of stack "livecodeTestInterface"
# ID: group id 305990 of card id 1002 of stack "livecodeTestInterface"
# Hash: chJ50Au+g2d18Yyryb7oag==
*/


on mouseUp pMouseButton
   if pMouseButton is 1 then
      local tLine, tTestID, tData, tSubTestID
      put the dgHilitedLines of group "testResults" into tLine
      put the dgDataOfLine[tLine] of group "testResults" into tData
      put tData["name"] into tTestID
      put tData["subtest name"] into tSubTestID
      displaySubTestResults tTestID,tSubTestID
   else
      popup button "testOptions" at the mouseLoc
   end if
end mouseUp



