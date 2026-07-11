Script "stack_livecodeTestInterface_button_id_331078"

/*
# Name: button "testOptions" of card "main" of stack "livecodeTestInterface"
# ID: button id 331078 of card id 1002 of stack "livecodeTestInterface"
# Hash: 3xlGelrqDcG9tiJ7zUYIpw==
*/


on menuPick pItemName
   switch pItemName
      case "Open Test"
         local tLine, tTestID, tData, tSubTestID
         put the dgHilitedLines of group "testResults" into tLine
         put the dgDataOfLine[tLine] of group "testResults" into tData
         put tData["test_id"] into tTestID
         testOpen tTestID
         break
   end switch
end menuPick
