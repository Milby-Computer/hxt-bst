Script "stack_quality_card_id_1076"

/*
# Name: card "qualityRunTestsIos" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1076 of stack "quality" of stack "livecodeTestInterface"
# Hash: PudYiJPL7cN6Iiff/qbapw==
*/


local gTestsOnTargets

// --------- Test Execution Management ----------

on iosInitialise
   put empty into gTestsOnTargets
end iosInitialise

// Start tests that are listed in the custom properties.
// Argument indicates if we are starting or restarting.
function runTestInstructions @rWorkList, pWorkListID, pIndexID, pTestID
   local tInstructions, tPass, tExtensions, tFileName, tExecutionLine, tExecutionFile, tTestStackName, tError
   local rQueryResult, rInstructions, tAppBundle, rSupportEnv
   
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
   
   // Create the execution file that contains the js to run against the application on the device.
   put the cLiveCodeTestDeviceDataCache of stack "quality" & "testDataIos" into tExecutionFile
   if rWorkList[pWorkListID][pIndexID]["PlatformID"] contains "Simulator" then
      put the cLiveCodeDeviceDataCacheExtension of stack "quality" after tExecutionFile
   else
      put the cLiveCodeDeviceJavaScriptExtension of stack "quality" after tExecutionFile
   end if
   
   if tPass is true then
      // Add the execution line with the appropriate token to the test case.
      put "--execution-line" && tExecutionLine & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Add the execution file with the appropriate token to the test case.
      put "--execution-file" && tExecutionFile & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Create the test instructions file for the device.
      get buildExecutionInstructions (rWorkList, pWorkListID, pIndexID, pTestID)
      
      // Load the test stack onto the device.
      if rWorkList[pWorkListID][pIndexID]["PlatformID"] contains "Simulator" then
         put empty into tError
      else
         put deployToTarget (rWorkList, pWorkListID, pIndexID, pTestID) into tError
      end if
      
      // Add a time stamp to the test case to indicate when the test was started.
      put "--test-start" && the long internet date & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // Add a second count for time measurement.
      put "--seconds-start" && the seconds & return after rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"]
      
      // See if the test can be run on iOS.
      dispatch "workListEvalSupport" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID, pTestID, rSupportEnv
      if the result is true then
         
         // Run the tests.
         If tError is empty then
            if rWorkList[pWorkListID][pIndexID]["PlatformID"] contains "Simulator" then
               if there is a stack "__TESTS__" then delete stack "__TESTS__"
               
               ## EB
               ## Get the built standalone.
               dispatch function "getExecutableName" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexID
               put the result into tAppBundle
               
               // We need the stack content for the standalone application settings/
               dispatch function "getStackName" to card"qualityWorkList" of stack "quality" with pWorkListID, pIndexID
               put the result into tTestStackName
               open invisible stack tTestStackName
               
               repeat with tI = 0 to 3
                  get iOSDeployAction (rWorkList[pWorkListID][pIndexID]["PlatformID"], tAppBundle)
                  if the result is not empty then 
                     logThis "Could not run test on iOS simulator, due to:" && the result & return
                  else
                     exit repeat            
                  end if
               end repeat
               
               delete stack "__TESTS__"
               
            else
               get runOnTarget (rWorkList, pWorkListID, pIndexID, pTestID)
               if the result is not empty then
                  logThis "Could not run test on iOS target:" && rWorkList[pWorkListID][pIndexID]["PlatformID"] && "due to:" && the result & return
                  //put false into tPass
               end if
            end if
         else
            logThis "Could not load onto iOS target:" && rWorkList[pWorkListID][pIndexID]["PlatformID"] && "due to:" && tError & return
         end if   
         
      else
         
         // This platform is not supported.
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

local sDeployActionInProgress

-- This method is invoked locally as a wrapper to suppress the time out dialogue
function iOSDeployAction pTarget, pAppBundle
   local tResult
   
   if sDeployActionInProgress then
      return "Deploy action is in progress."
   end if
   
   -- Get the stack we are dealing with
   local tStack
   put the mainStack of the topStack into tStack
   
   -- Make sure we save the stack if it needs it
   set the defaultStack to tStack
   
   put true into sDeployActionInProgress
   
   -- Invoke the action in the appropriate platform-specific library
   local tError
   dispatch "deployDo" to button "iOS" of stack "revDeployLibrary" with tStack, pTarget, pAppBundle
   put the result into tError
   
   put false into sDeployActionInProgress
   
   -- Report an error if one occured
   return tError
end iOSDeployAction

----------

function buildExecutionInstructions @rWorkList, pWorkListID, pIndexID, pTestID
   local tPass, tResultText
   local rFileName, rExecutionLimit, rShowTest
   
   put true into tPass
   // If we have found a new test, then check if it has an execution line.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rFileName, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-file"
   if rFileName is empty then
      logThis "Device Deploy Exception - Could not find temporary file name for execution instructions."
      put false into tPass
   end if
   
   // If we have found a new test, then check if it has a timout.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rExecutionLimit, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "maxduration"
   if rExecutionLimit is empty then
      logThis "Device Deploy Exception - Could not find timeout limit for execution instructions."
      put false into tPass
   end if
   
   // Get the show test flag.
   if tPass is true then
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rShowTest, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "showtest"
      if rShowTest is empty then put false into tPass
   end if
      
   // Open the test instructions file for writing.
   open file (rFileName) for text write
   
   if rWorkList[pWorkListID][pIndexID]["PlatformID"] contains "Simulator" then
      write rWorkList[pWorkListID][pIndexID]["PlatformID"] & comma & pTestID & comma & rShowTest & return to file rFileName
   else   
      // See if we can write to the test instructions file.
      // This is the JavaScript stuff used by instruments.
      write "var target = UIATarget.localTarget();" & return to file rFileName
      write "var testcomplete = false;" & return to file rFileName
      write "var imax =" && rExecutionLimit & "; // This is automatically set." & return to file rFileName
      // If we need to pass in whether or not we are showing the data for timing then uncomment the following
      // The wrapper script also needs to be updated to handle this
      //write "var runthis =" && quote & pTestID & "," & rShowTest && "," && quote & "; // This is automatically set." & return to file rFileName
      write "var runthis =" && quote & pTestID && "," && quote & "; // This is automatically set." & return to file rFileName
      write "var i;" & return & return to file rFileName
      
      write "// Process alert messages" & return to file rFileName
      write "UIATarget.onAlert = function onAlert(alert)" & return to file rFileName
      write "{" & return to file rFileName
      write "  var title = alert.name();" & return to file rFileName
      write "  var body = alert.elements()[2].name();" & return & return to file rFileName
      
      write "// If we are iOS7 we have to do the following" & return to file rFileName
      write "  if (body == null)" & return to file rFileName
      write "  {" & return to file rFileName      
      write "    body = alert.scrollViews()[0].staticTexts()[1].value();" & return to file rFileName
      write "  }" & return to file rFileName      
      
      write "  if (title ==" && quote & "Answer Test" & quote & ")" & return to file rFileName
      write "  {" & return to file rFileName      
      write "    UIALogger.logMessage (body);" & return to file rFileName
      write "    alert.buttons()[" & quote & "OK" & quote & "].tap();" & return & return to file rFileName
      
      write "    // Test if we have come to the end of the test." & return to file rFileName
      write "    if (body && body.indexOf ('test-end') != -1)" & return to file rFileName
      write "      testcomplete = true;" & return to file rFileName
      write "    i = 0;" & return to file rFileName
      write "    return true;" & return to file rFileName
      
      write "  }" & return to file rFileName
      write "  return false;" & return to file rFileName
      write "}" & return & return to file rFileName
      
      write "UIALogger.logMessage (" & quote & rWorkList[pWorkListID][pIndexID]["PlatformID"] & comma & pTestID & quote & ");" & return & return to file rFileName
      
      write "target.frontMostApp().keyboard().typeString(runthis);" & return & return to file rFileName
      
      write "for (i = 0; i < imax; i++)" & return to file rFileName
      write "{" & return to file rFileName
      write "  target.delay(1);" & return to file rFileName
      write "  if (testcomplete == true)" & return to file rFileName
      write "    i = imax;" & return to file rFileName
      write "}" & return to file rFileName
   end if
   
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
   local tDispatchUpdate, tLocalActiveTestRuns, tFolders, tExpired
   local rFileName, rFileData, rTestData, rQueryResult, rStartTime
   
   put false into tDispatchUpdate
   
   // We did not run the test and do not have to evaluate it
   if rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Status"] begins with "skipped" then return true         
      
   if rWorkList[pWorkListID][pIndexID]["PlatformID"] contains "Simulator" then 
      
      // Get the execution file path to the file that was read from the device.
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rFileName, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-file"
      if rFileName is empty then
         logThis "Simulator Read Exception - Could not read test instructions file for" && rFileName & ":" & return
         return false
      end if
      
      // Open the process information from the iOS device and attach the data to the local active test run information.
      if readTextFile (rFileData, rFileName) is false then
         logThis "Simulator Read Exception - Could not read test instructions file for" && rFileName & ":" & return
         return false
      else
         put line 2 to -1 of rFileData & return after tLocalActiveTestRuns
      end if
      
   else
      
      // List the folders that contain the instruments results.
      if there is a folder (the cLiveCodeTestInstruments of stack "quality") then
         put listFolders (the cLiveCodeTestInstruments of stack "quality") into tFolders
         repeat for each line tFolder in tFolders
            if tFolder begins with "Run" then
               
               if readTextFile (rFileData, the cLiveCodeTestInstruments of stack "quality" & tFolder & slash & "Automation Results.plist") is false then
                  return false
               else
                  get extractTestResultsFromPlist (rTestData, rFileData)
                  if line 1 of rTestData begins with rWorkList[pWorkListID][pIndexID]["ProcessID"] and line 1 of rTestData ends with pTestID then
                     put line 2 to -1 of rTestData & return after tLocalActiveTestRuns
                     exit repeat
                  end if 
               end if
            end if
         end repeat
      end if
      
   end if
   
   // Get the mimum time the test is supposed to run for
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rQueryResult, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "maxduration"
   
   // Test if the process has expired:
   // Get the start time in seconds.
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with rStartTime, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "seconds-start"
   if the seconds - rStartTime > rQueryResult then 
      put true into tExpired
   else
      put false into tExpired
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
         
         // Remove the temporary instruments data.
         if tFolder begins with "Run" then
             revDeleteFolder the cLiveCodeTestInstruments of stack "quality" & tFolder 
         end if
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
         
         // Remove the temporary instruments data.
         if tFolder begins with "Run" then
            revDeleteFolder the cLiveCodeTestInstruments of stack "quality" & tFolder
         end if
      end if
   end if
   
   // Dispatch an update to the appropriate message handler.
   if tDispatchUpdate is true then
      dispatch "qualityHandleWorkListMessage" to rWorkList[pWorkListID]["CallbackID"] with "worklist changed" & comma & pWorkListID & comma & pIndexID & comma & pTestID
   end if
   
   return true
end evaluateTest

----------

// Deploy to iOS target.
function deployToTarget @rWorkList, pWorkListID, pIndexID, pTestID
   local tError, tI, tExecutionLine, tDevice
   put empty into tError
   
   // Ensure we remove anything from the devices name that is not part of it.
   put rWorkList[pWorkListID][pIndexID]["PlatformID"] into tDevice
   replace "iPhone " with empty in tDevice
   replace "iPad " with empty in tDevice
   
   if tDevice is among the keys of gTestsOnTargets and gTestsOnTargets[tDevice] is rWorkList[pWorkListID][pIndexID]["StackID"] then
      // Do we have to do a clean shut down of an application on an iOS device here?
   else
      dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tExecutionLine, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-line"
      
      if (rWorkList[pWorkListID][pIndexID]["StackID"] is pWorkListID & comma & pIndexID) then
         get doShellCommand (the cFruitStrap of stack "quality", "-b" && quote & tExecutionLine & quote && tDevice)
         
         if the result contains "Installed package" then
            put rWorkList[pWorkListID][pIndexID]["StackID"] into gTestsOnTargets[tDevice]
         else
            put "Installation of app failed:" && the result into tError
         end if
      end if
      
      if "revStandaloneProgress" is among the lines of the openStacks then
         close stack "revStandaloneProgress"
      end if
   end if
   return tError
end deployToTarget

----------

// Run on iOS target.
function runOnTarget @rWorkList, pWorkListID, pIndexID, pTestID
   local tError, tI, tExecutionLine, tExecutionFile, tDevice, tOldDefaultFolder
   put empty into tError
   
   // Ensure we remove anything from the devices name that is not part of it.
   put rWorkList[pWorkListID][pIndexID]["PlatformID"] into tDevice
   replace "iPhone " with empty in tDevice
   replace "iPad " with empty in tDevice
   
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tExecutionLine, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-line"
   dispatch function "queryTest" to card "qualityRunTests" of stack "quality" with tExecutionFile, rWorkList[pWorkListID][pIndexID]["TestResults"][pTestID]["Report"], "execution-file"
   
   put the defaultFolder into tOldDefaultFolder
   set the defaultFolder to the cLiveCodeTestInstruments of stack "quality"
   
   repeat with tI = 0 to 3
      put empty into tError
      get doShellCommand ("instruments", "-w" && \
            tDevice && \
            "-t" && the cAutomationTemplate of stack "quality" && \
            quote & tExecutionLine & quote && \
            "-e UIASCRIPT" && quote & tExecutionFile & quote && \
            "-e UIARESULTSPATH" && \
            quote & the cLiveCodeTestInstruments of stack "quality" & quote)
      if the number of lines in the result < 3 then
         put "Launch of app failed:" && the result into tError
         wait for 2 seconds
      else
         exit repeat
      end if
   end repeat
   
   set the defaultFolder to tOldDefaultFolder
   
   if "revStandaloneProgress" is among the lines of the openStacks then
      close stack "revStandaloneProgress"
   end if
   
   return tError
end runOnTarget

----------

// Add test instructions to the test array.
command addTestInstructions pKey, pInstructions
   local tExecutionInstructions, tDevices, tDevice
   
   put listiOSDevices () into tDevices
   if tDevices is not empty then
      put the cExecutionInstructions of me into tExecutionInstructions
      // Loop through each connected iOS devices here.
      repeat for each line tDevice in tDevices do
         put pInstructions into tExecutionInstructions[tDevice][pKey]
      end repeat
      set the cExecutionInstructions of me to tExecutionInstructions
   end if
   
end addTestInstructions

// ---------- XML Helpers ----------

function extractTestResultsFromPlist @rResult, pInputText
   local tXmlId, tTempInput, tLine, tResult, tIndex
   
   put true into tResult
   put empty into rResult
   put pInputText into tTempInput
   
   // Tidy up the input data.
   repeat with tLine = 1 to the number of lines in tTempInput
      if line tLine of tTempInput contains "<plist" then
         replace line 1 to tLine of tTempInput with empty in tTempInput
      else if line tLine of tTempInput contains "</plist>" then
         replace line tLine of tTempInput with empty in tTempInput
      end if
   end repeat
      
   // Convert text into XML tree.
   put revCreateXMLTree (tTempInput, true, true, false) into tXmlId
   
   // Extract the relevant data from the XML tree.
   repeat with tIndex = 1 to revXMLNumberOfChildren (tXmlId, "/dict/array", "dict", -1)
      if revXMLNodeContents (tXmlId, "/dict/array/dict[" & tIndex & "]/string[1]") is "Default" then
         put revXMLNodeContents (tXmlId, "/dict/array/dict[" & tIndex & "]/string[2]") & return after rResult
      end if
   end repeat
   
   // Tidy up the result data.
   replace "\n" with return in rResult
   replace  "&lt;" with "<" in rResult
   replace "&gt;" with ">" in rResult
   
   // The following is needed for iOS7
   replace quote && "log" && quote with quote & return & "log" && quote in rResult
   return tResult
end extractTestResultsFromPlist
