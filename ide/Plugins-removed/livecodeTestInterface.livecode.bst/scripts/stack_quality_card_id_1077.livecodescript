Script "stack_quality_card_id_1077"

/*
# Name: card "qualityRunTestsAndroid" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1077 of stack "quality" of stack "livecodeTestInterface"
# Hash: GLeRvBlS3Q2lFaP8DBQPfA==
*/


local gTestsOnTargets

// --------- Test Execution Management ----------

on androidInitialise
   put empty into gTestsOnTargets
end androidInitialise

// Start tests that are listed in the custom properties.
// Argument indicates if we are starting or restarting.
function runTestInstructions @rWorkList, pWorkListID, pIndexID, pTestID
   local tInstructions, tPass, tExtensions, tFileName, tExecutionLine, tExecutionFile, tError, tDevice
   local rQueryResult, rInstructions, rSupportEnv
   
   put empty into tInstructions
   put false into tPass
   put the cTestExecutableExtension of stack "quality" into tExtensions
   
   // Check if test information is already loaded from the test instructions file.
   if "Report" is not among the keys of rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID] then
      dispatch function "getInstructionsName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID
      put the result into tFileName
      if tFileName is not empty then
         get readTextFile (rInstructions, tFileName)
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
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rQueryResult, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "showtest"
      if rQueryResult is empty then put false into tPass
   end if
   
   // Get the environment support information.
   if tPass is true then
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rSupportEnv, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "supportenv"
   end if
   
   // Create the execution line.
   if tPass is true then
      dispatch function "getExecutableName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID
      put the result into tFileName
      if tFileName is not empty then
         put tFileName into tExecutionLine
      else
         put false into tPass
      end if
   end if
   
   // Create the execution file to run against the application on the device.
   put the cLiveCodeTestDeviceDataCache of stack "quality" & "testDataAndroid" & \
         the cLiveCodeDeviceDataCacheExtension of stack "quality" into tExecutionFile
   
   if tPass is true then     
      // Add the execution line with the appropriate token to the test case.
      put "--execution-line" && tExecutionLine & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Add the execution file with the appropriate token to the test case.
      put "--execution-file" && tExecutionFile & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Create the test instructions file for the device.
      get buildExecutionInstructions (rWorkList, pWorkListID, pIndexID, pTestID)      
      
      // Load the test instructions file onto the device.
      get pushTestInstructionsFile (rWorkList[pWorkListID][pIndexID]["PlatformID"], rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"])
      if the result is not empty then
         logThis "Could not load the test instructions onto Android target:" && rWorkList[pWorkListID][pIndexID]["PlatformID"] && "due to:" && the result 
      end if
      
      // Load the test stack onto the device.
      put deployToTarget (rWorkList, pWorkListID, pIndexID, pTestID) into tError
      
      // Add a time stamp to the test case to indicate when the test was started.
      put "--test-start" && the long internet date & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Add a second count for time measurement.
      put "--seconds-start" && the seconds & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // See if the test can be run on android.
      dispatch "workListEvalSupport" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID, pTestID, rSupportEnv
      if the result is true then
         
         // Run the test on the device.
         if tError is empty then
            
            // Ensure we remove anything from the devices name that is not part of it.
            put rWorkList[pWorkListID][pIndexID]["PlatformID"] into tDevice
            replace "Android " with empty in tDevice
            
            //executeShellCommand localPathToAdb(), "shell", "am", "start", "-n", the cAndroidPackageName of stack "quality" & "/.mblandroid"
            get doShellCommand (localPathToAdb(), "-s" && quote & tDevice & quote && "shell" && "am" && "start" && "-n" && the cAndroidPackageName of stack "quality" & "/.mblandroid")
            if not the result contains "Starting" then
               logThis "Launch of Android app failed:" && the result & return
            end if
         else
            logThis "Could not run test on Android target:" && rWorkList[pWorkListID][pIndexID]["PlatformID"] && "due to:" && tError & return
         end if
         
      else
         
         // We do not support this test set up.
         put "--seconds-end" && the seconds & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Add a time stamp to the test case to indicate when the test was completed.
         put "--test-end" && the long internet date & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Update the running test information to remove running information and indicate that the process has been completed.
         put "skipped" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
         
         // Dispatch an update to the appropriate message handler.
         dispatch "qualityHandleWorkListMessage" to rWorkList[pWorkListID]["CallbackID"] with "worklist changed" & comma & pWorkListID & comma & pIndexID & comma & pTestID
         
      end if
      
   end if
   
   return tPass
end runTestInstructions

----------

function buildExecutionInstructions @rWorkList, pWorkListID, pIndexID, pTestID
   local tPass, tResultText
   local rFileName, rShowTest
   
   put true into tPass
   // If we have found a new test, then check if it has an execution line.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rFileName, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-file"
   if rFileName is empty then
      logThis "Device Deploy Exception - Could not find temporary file name for execution instructions."
      put false into tPass
   end if
   
   // Open the test instructions file for writing.
   open file (rFileName) for text write
   
   // Get the show test flag.
   if tPass is true then
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rShowTest, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "showtest"
      if rShowTest is empty then put false into tPass
   end if
   
   // See if we can write to the test instructions file.
    write rWorkList[pWorkListID][pIndexID]["PlatformID"] & comma & pTestID & comma & rShowTest & return to file rFileName
   if the result is not empty then
      put the result into tResultText
      logThis "Test Instructions Exception - Could not write test instructions file for" && rFileName & ":" & return & tResultText & return
      return false
   end if
   
   // See if we can close the Test Results File.
   close file (rFileName)
   if the result is not empty then
      put the result into tResultText
      logThis "Test Instructions Exception - Could not close test instructions file for" && rFileName & ":" & return & tResultText & return
      return false
   end if
   
   return tPass
end buildExecutionInstructions

----------

// Allow a Minion to evaluate a running test.
// Process process handles, test for completion of tests, test for test expiration.
// Add log information to test instructions.
function evaluateTest @rWorkList, pWorkListID, pIndexID, pTestID
   local tLocalActiveTestRuns, tStartTime, tExpired, tDispatchUpdate
   local rQueryResult, rFileData, rFileName
   
   put false into tDispatchUpdate
   
   // We did not run the test and do not have to evaluate it
   if rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"] begins with "skipped" then return true         
   
   // Pull the test instructions file from the device.
   get pullTestInstructionsFile (rWorkList[pWorkListID][pIndexID]["PlatformID"], rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"])
   if the result is not empty then
      logThis "Device Read Exception - Could not read temporary file from device:" & the result & return
   end if      
   
   // Get the execution file path to the file that was read from the device.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rFileName, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-file"
   if rFileName is empty then
      logThis "Device Read Exception - Could not find temporary file name for execution instructions." & return
   end if
   
   // Open the process information from the Android device and attach the data to the local active test run information.
   if readTextFile (rFileData, rFileName) is false then
      logThis "Device Read Exception - Could not read test instructions file for" && rFileName & ":" & return
      return false
   else
      put line 2 to -1 of rFileData & return after tLocalActiveTestRuns
   end if
   
   // Get the maximum time the test is supposed to run for.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rQueryResult, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "maxduration"
   
   // Test if the process has expired:
   // Get the start time in seconds.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tStartTime, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "seconds-start"
   if the seconds - tStartTime > rQueryResult then 
      put true into tExpired
   else
      put false into tExpired
   end if
   
   // See if there is a diff test db file on the device that needs a new home.
   // Pull the test db file from the device and ensure it moves to the appropriate new location.
   if "DiffIDs" is among the keys of rWorkList[pWorkListID][pIndexID] then
      get pullDbTestFile (rWorkList[pWorkListID][pIndexID]["PlatformID"], rWorkList[pWorkListID][pIndexID]["DiffIDs"])
      if the result is not empty then
         logThis "Device Read Exception - Could not test for diff databas file on device:" & the result & return
      end if
   end if
   
   // Test if we have hit the end of the test.
   repeat for each line tLine in tLocalActiveTestRuns
      if word 1 of tLine is "log" and word 2 to -1 of tLine contains "test-end" then
         
         // Add the information we got from the device to the test report.
         put tLocalActiveTestRuns & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Add a second count for time measurement.
         put "--seconds-end" && the seconds & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Add a time stamp to the test case to indicate when the test was completed.
         put "--test-end" && the long internet date & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
         
         // Update the running test information to remove running information and indicate that the process has been completed.
         put "complete" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
         
         // Ensure we dispatch an update message to the UI.
         put true into tDispatchUpdate
         
         exit repeat
      end if
   end repeat
   
   // If a process has expited but did not complete then it may have died and we need to log an abort.
   if rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"] is not "complete" then
      // Update the test case information to log that the process has expired.
      if tExpired is true then
         put "failed,expired" into rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"]
         
         // Ensure we dispatch an update message to the UI.
         put true into tDispatchUpdate
         
      end if
   end if
   
   // Dispatch an update to the appropriate message handler.
   if tDispatchUpdate is true then
      dispatch "qualityHandleWorkListMessage" to rWorkList[pWorkListID]["CallbackID"] with "worklist changed" & comma & pWorkListID & comma & pIndexID & comma & pTestID
   end if
   
   return true
end evaluateTest

----------

// Queue tests that can be executed by this minion.
--function queueTestsToRun, pDevice 
   --local tNumberOfTests, tNumberOfNewTests, tPass
   --set the itemDelimiter to "_"
   --put true into tPass
      
   // See how many tests the minion is currently processing.
   --put getNumberOfActiveMinionTests (tNumberOfTests, the name of me, pDevice) into tPass
   
   // We only ever run one test at a time on a device.
   --if tPass is true then
      --if tNumberOfTests > 0  then
         --return tPass
      --end if
   --end if
   
   // Add a new test to the list of tests to be run.
   --if tPass then
      --put addTestsToExecution (1, the name of me, pDevice) into tPass
   --end if
   
   --return tPass
--end queueTestsToRun

----------

// Deploy to Android target.
function deployToTarget @rWorkList, pWorkListID, pIndexID, pTestID
   local tError, tDevice, tExecutionLine, tProcesses
   put empty into tError
   
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tExecutionLine, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-line"
   
   // Ensure we remove anything from the devices name that is not part of it.
   put rWorkList[pWorkListID][pIndexID]["PlatformID"] into tDevice
   replace "Android " with empty in tDevice
   
   set the itemDelimiter to quote
   
   if (tDevice is among the keys of gTestsOnTargets and gTestsOnTargets[tDevice] is rWorkList[pWorkListID][pIndexID]["StackID"]) then
      // Ensure the app is closed down if we are not loading it.
      put doShellCommand (localPathToAdb(), "-s" && quote & tDevice & quote && "shell ps") into tProcesses
      filter tProcesses with "*" & the cAndroidPackageName of stack "quality" & "*"
      if the number of lines in tProcesses is 1 then
         get doShellCommand (localPathToAdb(), "-s" && quote & tDevice & quote && "shell kill" && word 2 of tProcesses)
      else
         // This is cleaner but only works on newer versions of Android.
         get doShellCommand (localPathToAdb(), "-s" && quote & tDevice & quote && "shell am force-stop" && the cAndroidPackageName of stack "quality")
      end if      
   else
      //executeShellCommand localPathToAdb(), "-s", pDevice, "install", "-r", pExecutionData
      get doShellCommand (localPathToAdb(), "-s" && quote & tDevice & quote && "install" && "-r" && quote & tExecutionLine & quote)
      //executeShellCommand localPathToAdb(), "install", "-r", "-s", pExecutionData
      if the result contains "KB/s" then
         put rWorkList[pWorkListID][pIndexID]["StackID"] into gTestsOnTargets[tDevice]
      else
         put "Installation of app failed:" && the result into tError
      end if
   end if
   
   if "revStandaloneProgress" is among the lines of the openStacks then
      close stack "revStandaloneProgress"
   end if
   
   return tError
end deployToTarget

----------

// Get Test Instructions File and Push it to the Target.
function pushTestInstructionsFile pDevice pInstructions
   local rFileName
   
   // Ensure we remove anything from the devices name that is not part of it.
   replace "Android " with empty in pDevice
   
   // Get the execution file path to the file that is to be loaded onto the device.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rFileName, pInstructions, "execution-file"
   
   if rFileName is empty then
      logThis "Device Deploy Exception - Could not find temporary file name for execution instructions." & return
   end if
   
   get doShellCommand (localPathToAdb(), "-s" && quote & pDevice & quote && "push" && quote & rFileName & quote && quote & "/sdcard/testDataAndroid.txt" & quote) 
   if it contains "KB/s" then
      return empty
   else
      logThis "Device Deployment Exception - Could not load instructions onto device" && it & return
      return it
   end if 
   
end pushTestInstructionsFile

----------

// Get Test Instructions Filename and Pull target information to that file name.
function pullTestInstructionsFile pDevice pInstructions
   local rFileName
   
   // Ensure we remove anything from the devices name that is not part of it.
   replace "Android " with empty in pDevice
   
   // Get the execution file path to the file that is to be read from the device.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rFileName, pInstructions, "execution-file"
   
   if rFileName is empty then
      logThis "Device Deploy Exception - Could not find temporary file name for execution instructions." & return
   end if
   
   get doShellCommand (localPathToAdb(), "-s" && quote & pDevice & quote && "pull" && quote & "/sdcard/testDataAndroid.txt" & quote && quote & rFileName & quote) 
   if it contains "KB/s" then
      return empty
   else
      return it
   end if 
   
   return empty
end pullTestInstructionsFile

----------

// Get Test Instructions Filename and Pull target information to that file name.
function pullDbTestFile pDevice pDiffDb
   local rFilePath, tDbFiles, tDbFile, tResult
   
   put empty into tResult
   
   // Ensure we remove anything from the devices name that is not part of it.
   replace "Android " with empty in pDevice
   
   // Get the list of database files from the device.
   get doShellCommand (localPathToAdb(), "-s" && quote & pDevice & quote && "shell" && quote & "ls /sdcard/" & quote) 
   put it into tDbFiles
   
   // Make sure we are only looking at the db files.
   filter tDbFiles with "*" & the cLiveCodeTestDbExtension of stack "quality"   
   
   // Try to download the db files.
   repeat for line tDbFile in tDbFiles
      get doShellCommand (localPathToAdb(), "-s" && quote & pDevice & quote && "pull" && quote & "/sdcard/" & tDbFile & quote && quote & the cLiveCodeTestDbFolder of stack "quality" & pDiffDb & quote) 
      if not (it contains "KB/s") then
         put it & return after tResult
      end if 
   end repeat
   
   // Validate that everything was downloaded as expected.
   if tResult is empty then
      repeat for line tDbFile in tDbFiles
         if not (there is a file quote & the cLiveCodeTestDbFolder of stack "quality" & pDiffDb & tDbFile & quote) then
            put "diff db retrieval exception - could not download /sdcard/" & tDbFile && "to" && the cLiveCodeTestDbFolder of stack "quality" & pDiffDb & tDbFile & return after tResult
         end if
      end repeat
   end if
   
   // Try to delete the db files on the device, if everything worked as expected.
   if tResult is empty then
      repeat for line tDbFile in tDbFiles
         get doShellCommand (localPathToAdb(), "-s" && quote & pDevice & quote && "shell" && quote & "rm /sdcard/" & tDbFile & quote)
      end repeat
   end if
   
   return tResult
end pullDbTestFile

----------

function localPathToAdb 
   dispatch function "pathToAdb" to button "Android" of stack "revDeployLibrary"
   if it is "handled" and the result is not empty then
      return the result
   else
      return empty
   end if
end localPathToAdb
