Script "stack_comparisonSubtestResults_group_id_1003"

/*
# Name: group "subtestResults" of card id 1002 of stack "comparisonSubtestResults" of stack "livecodeTestInterface"
# ID: group id 1003 of card id 1002 of stack "comparisonSubtestResults" of stack "livecodeTestInterface"
# Hash: 2E0COGRT6R7eac4X18u0pQ==
*/


on mouseDoubleUp
   local tLine, tTestID
   put the dgHilitedLines of group "subtestResults" into tLine
   put the dgDataOfLine[tLine] of group "subtestResults" into tData
   put tData["test_id"] into tTestID
   testOpen tTestID
end mouseDoubleUp

command testOpen pNodeID
   local tTestPath, tTestExtension
   if pNodeID is a number then
      if the depth_of_node_ID_[pNodeID] of control "test list" stack "livecodeTestInterface" is 2 then
         put the filepath_of_node_ID_[pNodeID] of control "test list" stack "livecodeTestInterface"into tTestPath
      end if
   else
      put pNodeID into tTestPath
   end if
   
   set the itemDel to "."
   qualityGetTestExtension
   put the result into tTestExtension
   if the last item of tTestPath is "livecode" then
      open stack tTestPath
      edit the script of stack tTestPath
   else if the last item of tTestPath is (char 2 to -1 of tTestExtension) then
      launch document tTestPath
   end if
end testOpen
