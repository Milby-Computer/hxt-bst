Script "stack_quality_card_id_1067"

/*
# Name: card "qualityBuildStackTemplate" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1067 of stack "quality" of stack "livecodeTestInterface"
# Hash: vTCYCztdjyBGeSbxPa9kmw==
*/


// Parameters received when called:
// item 1 of $1 - the test case to run.
// item 2 of $1 - the name of the stack the test case is on. This is not applicable to tests built from scripts.
// item 3 of $1 - a boolean flag indicating whether or not the stack on which the test is should be made visible before the test is run.

local iPhoneResultDataDevice
local iPhoneResultDataSimulator

on startup
   create stack "Test"
   insert the script of me into back
   send "postStartup" to me in 0 millisecs   
end startup

on postStartup
   local tTest, tStack, tReadResult
   try
      if the platform is "android" then
         if there is a file "/sdcard/testDataAndroid.txt" then
            set the itemDelimiter to comma
            open file "/sdcard/testDataAndroid.txt" for text read
            read from file "/sdcard/testDataAndroid.txt" until EOF
            put line 1 of it into tReadResult
            close file "/sdcard/testDataAndroid.txt"
            put item 2 of tReadResult into tTest
            put item 3 of tReadResult into tStack
            go stack tStack
            show stack tStack
            log "test-begin"
            dispatch tTest to stack tStack
            log "test-end"
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
                  "local tTest, tStack" & return & \
                  "if the number of words of field" && quote & "testExecutionInput" & quote && "> 1 then" & return & \
                  "focus on nothing" & return & \
                  "put item 1 of the text of field" && quote & "testExecutionInput" & quote && "into tTest" & return & \
                  "put word 1 to -1 of (item 2 of the text of field" && quote & "testExecutionInput" & quote && ") into tStack" & return & \
                  "go stack tStack" & return & \
                  "show stack tStack" & return & \ 
                  "log" && quote & "test-begin" & quote & return & \
                  "dispatch tTest to stack tStack" & return & \
                  "log" && quote & "test-end" & quote & return & \
                  "end if" & return & \
                  "pass keyDown" & return & \
                  "end keyDown"
         else
            // We are running on the simulator.
            set the itemDelimiter to comma
            open file iPhoneResultDataSimulator for text read
            read from file iPhoneResultDataSimulator until EOF
            close file iPhoneResultDataSimulator
            put line 1 of it into tReadResult
            put item 2 of tReadResult into tTest
            put item 3 of tReadResult into tStack
            go stack tStack
            show stack tStack
            log "test-begin"
            dispatch tTest to stack tStack
            log "test-end"
         end if
      else
         if item 3 of $1 is true then
            go invisible stack item 2 of $1
            show stack item 2 of $1
         end if
         log "test-begin"
         dispatch item 1 of $1 to stack item 2 of $1
         log "test-end"
      end if
   catch tError
      repeat for each line tLine in tError
         log "  fail - " & tLine
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

on eventBegin pMessage
   local tLogThis
   
   put "log" && quote & "event-begin" & quote && quote & "  " & pMessage && getExecutionContext () & quote && quote into tLogThis
   put the milliseconds & quote after tLogThis
   
   // Write the information to be logged.
   writeToTarget tLogThis
end eventBegin

----------

on eventEnd pMessage
   local tLogThis, tTimeStamp
   
   put the milliseconds into tTimeStamp
   put "log" && quote & "event-end" & quote && quote & "  " & pMessage && getExecutionContext () & quote && quote & tTimeStamp & quote into tLogThis
   
   // Write the information to be logged.
   writeToTarget tLogThis
end eventEnd

----------

function getExecutionContext
   local tContext, tContextUpdated, tResult, tStackName, tLine
   // Get the execution context information of the test result.
   set the itemDelimiter to slash
   put the executionContexts & return into tContext
   put tContext into tContextUpdated
   put empty into tResult
   
   // Remove the lines we are not interested in from the execution context.
   put the fileName of me into tStackName
   repeat for each line tLine in tContext
      if not (tLine contains tStackName) or \
            tLine contains ",log," or \
            tLine contains ",eventBegin," or \
            tLine contains ",eventEnd," or \
            tLine contains "postStartup" or \
            tLine contains "getExecutionContext" or \
            tLine contains "keyDown" then
         replace tLine & return with empty in tContextUpdated
      end if
   end repeat
   replace tStackName with item -1 of tStackName in tContextUpdated
   
   // Filter out the relevant call stack data.
   repeat for each line tLine in tContextUpdated
      set the itemDelimiter to quote
      put " -" && item 2 of tLine & comma after tResult
      set the itemDelimiter to comma
      put item -2 of tLine & comma & item -1 of tLine after tResult
   end repeat
   return tResult
end getExecutionContext

----------

on writeToTarget pMessage
   // Write the message to the handling context.
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

// The Stacks Included in This Wrapper Stack.
on includeSubStacks pInclude
   local tStacksToInclude, tKey
   /*Include Stack From Here*/
   /*Include Stack Here*/
   
   if tStacksToInclude is an array then
      repeat for each line tKey in the keys of tStacksToInclude
         if pInclude is true then
            lock messages
            go invisible stack tStacksToInclude[tKey]
            unlock messages
            set the mainStack of stack tStacksToInclude[tKey] to "__TESTS__"
         else
            lock messages
            delete stack tStacksToInclude[tKey]
            unlock messages
         end if
      end repeat
   end if
end includeSubStacks
