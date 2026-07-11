Script "stack_quality_card_id_1075"

/*
# Name: card "qualityRunTestsDesktop" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1075 of stack "quality" of stack "livecodeTestInterface"
# Hash: +daNoGTcbO0nofaW86HQ2g==
*/


local gProcessLogData
// --------- Test Execution Management ----------

// Start tests that are listed in the custom properties.
// Argument indicates if we are starting or restarting.
function runTestInstructions @rWorkList, pWorkListID, pIndexID, pTestID
   local tInstructions, tLine, tFileName, tPass, tExecutionLine, tExtensions, tMaxExecutionTime, tTimingDelay, tStartSeconds
   local rQueryResult, rInstructions, rShowTest, rSupportEnv
   
   put empty into tInstructions
   put false into tPass
   put the cTestExecutableExtension of stack "quality" into tExtensions
   
   // Check if test information is already loaded from the test instructions file.
   if "Report" is not among the keys of rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID] then
      dispatch function "getInstructionsName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID
      put the result into tFileName
      if tFileName is not empty then
         get readTextFile (rInstructions, tFileName, false)
         if rInstructions is not empty then
            repeat for each line tLine in rInstructions
               if word 2 of tLine is pTestID then
                  put tLine into tInstructions
                  exit repeat
               end if
            end repeat
            if tInstructions is not empty then
               dispatch function "breakInstructions" to card "qualityRunTests" of stack "quality" with rQueryResult, tInstructions
               put rQueryResult into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
               put true into tPass
            end if
         end if
      end if
   else
      put true into tPass
   end if
   
   // If the test is already running, then ignore it and move to the next one.
   if tPass is true then
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rQueryResult, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "test-start"
      if rQueryResult is not empty then put false into tPass
   end if
   
   // If we have found a new test, then check if it has an execution line.
   if tPass is true then
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rQueryResult, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-line"
      if rQueryResult is not empty then put false into tPass
   end if
   
   // Get the show test flag.
   if tPass is true then
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rShowTest, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "showtest"
      if rShowTest is empty then put false into tPass
   end if
   
   // Get the environment support information.
   if tPass is true then
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rSupportEnv, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "supportenv"
   end if
   
   // Create the execution line.
   if tPass is true then
      dispatch function "getExecutableName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID
      put the result into tFileName
      if tFileName is empty then
         put false into tPass
      else
         put quote & tFileName & quote && pTestID & comma & rShowTest into tExecutionLine   
      end if
   end if
   
   // If we are running in the timing mode, then we need to know now for how long a test may run.
   if the cTimingMode of stack "quality" is true then
      // Get the maimum time the test is supposed to run for
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tMaxExecutionTime, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "maxduration"
      // Get the scheduling delay when running in timing mode.
      put the cTimingDelay of stack "quality" into tTimingDelay
      put empty into gProcessLogData
   end if
   
   // Add the execution line with the appropriate token to the test case.
   if tPass is true then
      
      // Add a time stamp to the test case to indicate when the test was started.
      put "--test-start" && the long internet date & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Add a second count for time measurement.
      put the seconds into tStartSeconds
      put "--seconds-start" && tStartSeconds & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Set the status of the test to pending/
      put "pending" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
      
      // Dispatch an update to the appropriate message handler.
      dispatch "qualityHandleWorkListMessage" to rWorkList[pWorkListID]["CallbackID"] with "worklist changed" & comma & pWorkListID & comma & pIndexID & comma & pTestID
      
      // See if the test can be run on the desktop.
      dispatch "workListEvalSupport" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID, pTestID, rSupportEnv
      if the result is true then
         
         // We are running the test.
         if the cTimingMode of stack "quality" is true then
            // Start the process that is to be tested.
            get doOpenProcess (tExecutionLine)
            put "--execution-line" && tExecutionLine & return before rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
            repeat forever            
               read from process tExecutionLine until EOF in 10 milliseconds
               if it is not empty then
                  put it after gProcessLogData
               end if
               if not (there is a process tExecutionLine) then exit repeat
               if the seconds - tStartSeconds > tMaxExecutionTime then exit repeat
               wait for tTimingDelay milliseconds
            end repeat
            put evaluateTest (rWorkList, pWorkListID, pIndexID, pTestID) into tPass
         else
            // Start the process that is to be tested.
            get doOpenProcess (tExecutionLine)
            put "--execution-line" && tExecutionLine & return before rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         end if
         
      else
         // We do not support this test set up.
         put "--execution-line" && tExecutionLine & return before rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Add a second count for time measurement.
         put "--seconds-end" && the seconds & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Add a time stamp to the test case to indicate when the test was completed.
         put "--test-end" && the long internet date & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Update the running test information to remove running information and indicate that the process has been completed.
         put "skipped" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
         
         dispatch "qualityHandleWorkListMessage" to rWorkList[pWorkListID]["CallbackID"] with "worklist changed" & comma & pWorkListID & comma & pIndexID & comma & pTestID
         
      end if
      
   end if
   return tPass
end runTestInstructions

----------

// Allow a Minion to evaluate a running test.
// Process process handles, test for completion of tests, test for test expiration.
// Add log information to test instructions.
function evaluateTest @rWorkList, pWorkListID, pIndexID, pTestID
   local tStartTime, tProcess, tProcessFlag, tExpired, tProcessResult, tDispatchUpdate
   local rQueryResult
   
   put false into tDispatchUpdate
   
   // We did not run the test and do not have to evaluate it
   if rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"] begins with "skipped" then return true         
   
   // Get the execution line of the test we are currently looking at.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tProcess, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-line"
   
   // Test if there is a process associated with the test we are running.
   if there is a process tProcess then
      put true into tProcessFlag
   else
      put false into tProcessFlag
   end if
   
   // Get the maimum time the test is supposed to run for
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rQueryResult, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "maxduration"
   
   // Test if the process has expired:
   // Get the start time in seconds.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tStartTime, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "seconds-start"
   if the seconds - tStartTime > rQueryResult then 
      put true into tExpired
   else
      put false into tExpired
   end if
   
   // Read from the process and write relevant information to the test instructions in memory.
   repeat forever
      if the cTimingMode of stack "quality" is true then
         if gProcessLogData is empty then exit repeat
         put line 1 of gProcessLogData into tProcessResult
         put line 2 to -1 of gProcessLogData into gProcessLogData         
      else
         if tProcessFlag is false then exit repeat
         
         // Test if there is a process associated with the test we are running.
         if there is a process tProcess then
            put true into tProcessFlag
         else
            put false into tProcessFlag
            exit repeat
         end if
         
         read from process tProcess until return in 10 milliseconds
         if it is empty then
            exit repeat
         else
            put it into tProcessResult
         end if
      end if
      
      // Update the test instruction file with test results.
      //put "log" && quote & line 1 of tProcessResult & quote && quote & the milliseconds & quote & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      put line 1 of tProcessResult & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Test if we have hit the end of the test execution and need to terminate reading from the process.
      if tProcessResult begins with "log" && quote & "test-end" then
         
         // Add a second count for time measurement.
         put "--seconds-end" && the seconds & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Add a time stamp to the test case to indicate when the test was completed.
         put "--test-end" && the long internet date & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Update the running test information to remove running information and indicate that the process has been completed.
         put "complete" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
         
         // Ensure we dispatch an update message to the UI.
         put true into tDispatchUpdate
         
         // Ensure the process is closed.
         dispatch function "closeThisProcess" to card "qualityRunTests" of stack "quality" with tProcess
         
         // End this test loop.
         exit repeat
      end if
   end repeat
   
   // If a process has expited but did not complete then it may have died and we need to log an abort.
   if rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"] is not "complete" then
      // Update the test case information to log that the process has died.         
      if tProcessFlag is false then
         put "failed,died" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
         put true into tDispatchUpdate
      end if
      
      // Update the test case information to log that the process has expired.
      if tExpired is true then
         put "failed,expired" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
         put true into tDispatchUpdate
      end if      
   end if
   
   // Dispatch an update to the appropriate message handler.
   if tDispatchUpdate is true then
      dispatch "qualityHandleWorkListMessage" to rWorkList[pWorkListID]["CallbackID"] with "worklist changed" & comma & pWorkListID & comma & pIndexID & comma & pTestID
   end if
   return true
end evaluateTest
