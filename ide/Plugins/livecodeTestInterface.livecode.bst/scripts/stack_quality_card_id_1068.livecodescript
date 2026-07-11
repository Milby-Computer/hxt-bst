Script "stack_quality_card_id_1068"

/*
# Name: card "qualityBuildScriptTemplate" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1068 of stack "quality" of stack "livecodeTestInterface"
# Hash: SJk91Yxa/wWcehxUDjMCnQ==
*/


// Parameters received when called:
// item 1 of $1 - the test case to run.
// item 2 of $1 - the name of the card the test case is on.
// item 3 of $1 - a boolean flag indicating whether or not the stack on which the test is should be made visible before the test is run.

local iPhoneResultDataDevice
local iPhoneResultDataSimulator

on startup
   create stack "Test"
   insert the script of me into back
   send "postStartup" to me in 0 millisecs
end startup

on postStartup
   local tTest, tCard, tReadResult
   try
      if the platform is "android" then
         if there is a file "/sdcard/testDataAndroid.txt" then
            set the itemDelimiter to comma
            open file "/sdcard/testDataAndroid.txt" for text read
            read from file "/sdcard/testDataAndroid.txt" until EOF
            put line 1 of it into tReadResult
            close file "/sdcard/testDataAndroid.txt"
            put item 2 of tReadResult into tTest
            put item 3 of tReadResult into tCard
            go stack "Test"
            show stack "Test"
            dispatch tTest to card tCard of stack "__TESTS__"
         else
            log "failure - no test instance information"
         end if
      else if the platform is "iphone" then
         put "PLACE-HOLDER-FOR-TEST-SPECIFIC-PATH" into iPhoneResultDataSimulator
         if there is no file iPhoneResultDataSimulator then put empty into iPhoneResultDataSimulator
         if iPhoneResultDataSimulator is empty then
            // We are running on a device.
            put empty into iPhoneResultDataDevice
            new card "testCard"
            new field "testExecutionInput"
            set the width of field "testExecutionInput" to the width of card "testCard"
            set the height of field "testExecutionInput" to the height of card "testCard"
            set the location of field "testExecutionInput" to the location of card "testCard"
            set the script of field "testExecutionInput" to "on keyDown" & return & \
                  "local tTest, tCard" & return & \
                  "set the itemDelimiter to comma" & return & \                  
                  "if the number of words of field" && quote & "testExecutionInput" & quote && "> 1 then" & return & \
                  "focus on nothing" & return & \
                  "put item 1 of word 1 of the text of field" && quote & "testExecutionInput" & quote && "into tTest" & return & \
                  "put item 2 of word 1 of the text of field" && quote & "testExecutionInput" & quote && "into tCard" & return & \
                  "go stack" && quote & "Test" & quote & return & \
                  "show stack" && quote & "Test" & quote & return & \                  
                  "dispatch tTest to card tCard of stack" && quote & "__TESTS__" & quote & return & \
                  "end if" & return & \
                  "pass keyDown" & return & \
                  "end keyDown"
         else
            // We are running on the simulator.
            set the itemDelimiter to comma
            open file iPhoneResultDataSimulator for text read
            read from file iPhoneResultDataSimulator until EOF
            put line 1 of it into tReadResult
            close file iPhoneResultDataSimulator
            put item 2 of line 1 of it into tTest
            put item 3 of line 1 of it into tCard
            go stack "Test"
            show stack "Test"            
            dispatch tTest to card tCard of stack "__TESTS__"
         end if
      else
         if item 3 of $1 is "true" then
            go stack "Test"
            show stack "Test"
         end if
         dispatch item 1 of $1 to card item 2 of $1 of stack "__TESTS__"
      end if
   catch tError
      repeat for each line tLine in tError
         log "  failure - " & tLine
      end repeat
   end try
   if not (the platform is "iphone" and iPhoneResultDataSimulator is empty) then
      delete stack "Test"
      quit 0
   end if
end postStartup

----------

command log pMessage
   local tLogThis
   put "log" && quote & pMessage & quote && quote & the milliseconds & quote into tLogThis
   
   // Write the information to be logged.
   writeToTarget tLogThis
end log

----------

function qualityResourcePath
   return "PLACE-HOLDER-FOR-RESORCE-SPECIFIC-PATH"
end qualityResourcePath

----------

on writeToTarget pMessage
      if the platform is "android" then
      if there is a file "/sdcard/testDataAndroid.txt" then
         open file "/sdcard/testDataAndroid.txt" for text append
         write pMessage & return to file "/sdcard/testDataAndroid.txt" at EOF
         close file "/sdcard/testDataAndroid.txt"
      end if
   else if the platform is "iphone" then
      if iPhoneResultDataSimulator is empty then
         // We are logging on an iOS device.
         put pMessage & return after iPhoneResultDataDevice
         if pMessage contains "test-end" then
            answer iPhoneResultDataDevice with "OK" titled "Answer Test"
            delete stack "Test"
            quit 0
         end if
      else
         // We are logging on the iOS simulator.
         if there is a file iPhoneResultDataSimulator then
            open file iPhoneResultDataSimulator for text append
            write pMessage & return to file iPhoneResultDataSimulator at EOF
            close file iPhoneResultDataSimulator
         end if
      end if
   else
      write pMessage & return to stdout
   end if
end writeToTarget

----------

// Test Case Specific Code.
