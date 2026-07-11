Script "stack_quality_card_id_1064"

/*
# Name: card "qualityBuildStacksFromScripts" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1064 of stack "quality" of stack "livecodeTestInterface"
# Hash: 0oLs8Q6KClUCKaQE9bm5JA==
*/


// ---------- Create the Test Stack ----------

function buildTestStackData @rWorkList, pTestIdPairs
   local tPass, tWrapperCode, tTestPair, tWrapperCodeAdded, tIndex
   local tExecutionInstructions, tStandaloneInstructions, tStackCode, tKey
   local rStackCode, rSubTests, rFileData, rMetaCode, rStandaloneCode, rSetupComments
   local rDiffDbs, rDiffCode
   
   put empty into rDiffCode
   put empty into tExecutionInstructions
   put empty into tStandaloneInstructions
   put empty into tStackCode
   put true into tPass
   put false into tWrapperCodeAdded
   
   // Add the wrapper code.
   put the script of card "qualityBuildScriptTemplate" of stack "quality" & return into tWrapperCode
   
   // Ensure that the iOS simulator can see the data exchange file:
   replace "PLACE-HOLDER-FOR-TEST-SPECIFIC-PATH" with the cLiveCodeTestDeviceDataCache of stack "quality" & \ 
         "testDataIos" & the cLiveCodeDeviceDataCacheExtension of stack "quality" in tWrapperCode
   
   // Ensure that the standalone has access to the resource directory.
   // The following code may have to change if this is going to happen over a network.
   replace "PLACE-HOLDER-FOR-RESORCE-SPECIFIC-PATH" with the cResourceStacks of stack "quality" in tWrapperCode
   
   // Cycle through each test in the test data array, convert it to LC and add it to the test stack.
   repeat for each line tTestPair in pTestIdPairs
      
      put empty into rDiffDbs
      put empty into rDiffCode
      put empty into rStackCode
      
      // Read the test file from the files system
      put readTextFile (rFileData, rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestID"], false) into tPass
      
      // We need to create the code that is to go into the LiveCode stack.
      if tPass is true then
         put processTest (rStackCode, rDiffCode, rDiffDbs, rSubTests, rSetupComments, rWorkList, rFileData, tTestPair) into tPass
      end if
      
      // We need to extract the meta information to create the execution instructions.
      if tPass is true then
         put processMeta (rMetaCode, rStandaloneCode, rWorkList, rFileData, rSubTests, rSetupComments, tTestPair) into tPass
      end if
      
      // If we have found differencing information then we need to create the comparison engine stack.
      if tPass is true and rDiffDbs is not empty then
         if the number of lines of rDiffDbs > 1 then breakpoint // We should never hit this but better safe than sorry
         // "processWrapForDiffStorage" should have ensured that the path for the new stack exists by now.
         dispatch function "buildDiffStack" to card "qualityEvalDiff" of stack "quality" with rStackCode, rDiffDbs
         put rDiffCode & rStackCode into rStackCode
      end if
      
      // If we have no errors, then construct the stack and the execution instructions.
      if tPass is true and rStackCode is not empty and rMetaCode is not empty then
         if tWrapperCodeAdded is false then
            put true into tWrapperCodeAdded
            put tWrapperCode into tStackCode
            put rStandaloneCode into tStandaloneInstructions
         end if
         // Ensure the stack name does not containt the LiveCode extension.
         dispatch function "getTrimmedSourceStackName" to card "qualityWorkList" of stack "quality" with item 1 of tTestPair, item 2 of tTestPair         
         put "PLACE-HOLDER-FOR-TEST-SPECIFIC-CARD-SCRIPT" && the result & return after tStackCode 
         put rStackCode & return after tStackCode
         put rMetaCode & return after tExecutionInstructions
      else
         // Ensure we mark tests as not runable
         put empty into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["Complete"]
         logThis "Test Build Exception - No test data found for processing in file:" && rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestID"] & return
         put false into tPass
      end if
      
      // If we have no errors and we have found diff tests then ensure the work list is aware of them.
      if tPass is true and rDiffDbs is not empty then
         put rDiffDbs into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["DiffIDs"]
         // Create an entry in the table to store the diff results.
         dispatch "workListCreateDiffEntries" to card "qualityWorkList" of stack "quality" with rDiffDbs, tTestPair
      end if
      
   end repeat
   
   if tExecutionInstructions is not empty and tStackCode is not empty then
      
      put line 1 of pTestIdPairs into rWorkList[item 1 of line 1 of pTestIdPairs][item 2 of line 1 of pTestIdPairs]["StackID"]
      
      // Create the test stack file.
      dispatch function "buildTestStack" to card "qualityBuildStacks" of stack "quality" with rWorkList[item 1 of line 1 of pTestIdPairs][item 2 of line 1 of pTestIdPairs]["PlatformGroupID"], line 1 of pTestIdPairs, tStackCode, tStandaloneInstructions
      put the result into tPass
      
      // Create the execution instructions file.
      if tPass is true then
         dispatch function "buildExecutionInstructions" to card "qualityBuildStacks" of stack "quality" with rWorkList[item 1 of line 1 of pTestIdPairs][item 2 of line 1 of pTestIdPairs]["PlatformGroupID"], line 1 of pTestIdPairs, tExecutionInstructions
         put the result into tPass
      end if
      
   else 
      logThis "Test Build Exception - No test data found for processing." & return
      put false into tPass
   end if
   
   // Update the work list with appropriate information.
   
   repeat for each line tTestPair in pTestIdPairs
      put line 1 of pTestIdPairs into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["StackID"]
      if tPass is false then
         if "TestResults" is among the keys of rWorkList[item 1 of tTestPair][item 2 of tTestPair] then
            repeat for each line tKey in the keys of rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestResults"]
               put "failed" into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestResults"][tKey]["Status"]
               put "Could not build the test files." into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestResults"][tKey]["Report"]
            end repeat
         else
            put empty into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestResults"]
         end if
      end if
   end repeat
   
   return tPass
end buildTestStackData

// ---------- Process the Test Meta Data File Content ----------

function processMeta @rMetaCode, @rStandaloneCode, @rWorkList, pInputData, pSubTests, pSetupComments, pTestPair
   local tLine, tResult, tI
   local tExecutionLimit, tShowTest, tSupportEnv, tStackName
   
   put empty into rMetaCode
   put true into tResult
   
   // Get the default values.
   put the cExecutionLimit of stack "quality" into tExecutionLimit
   put the cShowTest of stack "quality" into tShowTest
   put empty into tSupportEnv
   
   // Ensure the stack name does not containt the LiveCode extension.
   dispatch function "getTrimmedSourceStackName" to card "qualityWorkList" of stack "quality" with item 1 of pTestPair, item 2 of pTestPair
   put the result into tStackName
   
   repeat for each line tLine in pInputData
      switch word 1 of tLine
         case "setup"
            // Exit once we have hit the end of the meta data.
            exit repeat
            break
         case "max-test-duration"
            // Add the meta data that controls the test timeout.
            put word 2 to -1 of tLine into tExecutionLimit
            break
         case "show-test"
            // Add the meta data that controls whether or not stacks are to be made visible while running.
            put word 2 to -1 of tLine into tShowTest
            break
         case "support-env"
            put word 2 to -1 of tLine into tSupportEnv
            break
         default
            break
      end switch
      
      // Add the meta data that is responsible for the standalone configuration settings.
      if not (word 1 of tLine begins with "//") and (item 2 of tLine begins with rWorkList[item 1 of pTestPair][item 2 of pTestPair]["PlatformID"] & comma) then put tLine & return after rStandaloneCode
   end repeat
   
   // Create the number of entries to test as are tests in the test file.
   repeat with tI = 1 to pSubTests
      if "runTest_" & tI is among the items of rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestsToUse"] then
         if tI is 1 then
            put "--index" && "runTest_" & tI & comma & tStackName && \
                  "--maxduration" && tExecutionLimit && \ 
                  "--showtest" && tShowTest && \
                  "--supportenv" && tSupportEnv && \
                  "--filename" && rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"] into rMetaCode
         else 
            put return & "--index" && "runTest_" & tI & comma & tStackName && \
                  "--maxduration" && tExecutionLimit && \
                  "--showtest" && tShowTest && \
                  "--supportenv" && tSupportEnv && \
                  "--filename" && rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"] after rMetaCode
         end if
         // We create an entry in the work list for each test.
         put "not started" into rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestResults"]["runTest_" & tI & comma & tStackName]["Status"]
         put line tI of pSetupComments into rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestResults"]["runTest_" & tI & comma & tStackName]["SetupComment"]
      end if
   end repeat
   
   return tResult
end processMeta

// ---------- Process the Test Data Body File Content ----------

// Generate the test script with relevant test code that is later added to the test engines.
function processTest @rOutput, @rDiffCode, @rDiffDbs, @rSubTests, @rSetupComments, @rWorkList, pFileData, pTestPair
   local tLine, tLineIndex, tCompileResult, tInTestBody, tResult, tLineNumber, tCommandName, rDiffDb
   
   put false into tInTestBody
   put true into tResult
   put empty into rOutput
   put empty into tCommandName
   put 0 into tLineIndex
   put 0 into rSubTests
   put empty into rSetupComments
   
   // Process each line of the test and implement the relevant test code for scripts.
   repeat for each line tLine in pFileData
      put empty into rDiffDb
      add 1 to tLineIndex
      
      // Skip the meta data.
      if word 1 of tLine is "setup" then put true into tInTestBody
      if tInTestBody is false then next repeat
      
      // Process any diff syntax.
      if word 1 of tLine begins with "eval_" then
         processDiffTestingLine rOutput, rDiffCode, rDiffDb, tLineIndex, word 1 to -1 of tLine, rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"], tCommandName, rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestSignature"]
         
         // Add the db names to the list of dbs that have to be resolved.
         if rDiffDb is not empty and rDiffDb is not among the lines of rDiffDbs then
            put rDiffDb & return after rDiffDbs
         end if
         next repeat
      end if
      
      // Process the test body.
      switch word 1 of tLine
         case "assert"
            switch word 2 of tLine
               case "true" // "test"
                  if the number of words of tLine is 2 then
                     processTestTrueLine rOutput, tLineIndex, word 2 to -1 of tLine, rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"], tCommandName
                  else
                     processTestTrueLine rOutput, tLineIndex, word 3 to -1 of tLine, rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"], tCommandName
                  end if
                  break
               case "false"
                  if the number of words of tLine is 2 then
                     processTestTrueLine rOutput, tLineIndex, word 2 to -1 of tLine, rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"], tCommandName
                  else
                     processTestFalseLine rOutput, tLineIndex, word 3 to -1 of tLine, rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"], tCommandName
                  end if
                  break
               case "failure" // "test-error"
                  processTestFailureLine rOutput, tLineIndex, word 3 to -1 of tLine
                  break
               case "success" // "test-no-error"
                  processTestSuccessLine rOutput, tLineIndex, word 3 to -1 of tLine
                  break
               default
                  // "test"
                  processTestTrueLine rOutput, tLineIndex, word 2 to -1 of tLine, rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"], tCommandName
                  break
            end switch            
            break
         case "setup"
            add 1 to rSubTests
            put word 2 to -1 of tLine & return after rSetupComments
            put "runTest_" & rSubTests into tCommandName
            put "command runTest_" & rSubTests & return after rOutput
            processTestSetupLine rOutput, item 1 of pTestPair & "_" & rSubTests, word 2 to -1 of tLine
            break
         case "teardown"
            processTestTeardownLine rOutput, tLineIndex, word 2 to -1 of tLine
            put "end runTest_" & rSubTests & return & return after rOutput
            break
         case "eventBegin"
            processTestEventBeginLine rOutput, tLineIndex, word 2 to -1 of tLine
            break
         case "eventEnd"
            processTestEventEndLine rOutput, tLineIndex, word 2 to -1 of tLine
            break
         default
            put tLine & return after rOutput
            break
      end switch
   end repeat
   
   // Test if there are script errors.
   set the script of button "Test Compile" of card "qualityBuildStacksFromScripts" of stack "quality" to rOutput
   if the result is not empty then
      put the result into tCompileResult
      put item 2 of line 1 of tCompileResult into tLineNumber
      logThis "Test Syntax Exception in file:" && rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"] & ":" & return
      if tLineNumber is a number and rOutput is not empty then
         logThis tab & line tLineNumber of rOutput & return
      end if
      put empty into rOutput
      put false into tResult
   end if
   
   return tResult
end processTest

----------

// Create the code for test set ups.
command processTestSetupLine @xOutput, pLineIndex, pLine // DONE
   put "local ___temp___, ___error___" & return after xOutput
   
   // If there is no information provided by the test then return a default value of "functionality".
   if pLine is empty then
      get "functionality"
   else
      get char 2 to -2 of pLine
   end if
   
   // Write the code to the output.
   put "log" && quote & "test-begin" && it & quote & return after xOutput
end processTestSetupLine

----------

// Create the code for test tear downs.
command processTestTeardownLine @xOutput, pLineIndex, pLine
   // Write the code to the output.
   put "log" & quote & "test-end" & quote & return after xOutput
end processTestTeardownLine

----------

// Process time stamp begin.
command processTestEventBeginLine @xOutput, pLineIndex, pLine
   // Write the code to the output.
   put "/*"&pLineIndex&"*/ log" && quote & "event-begin" & quote && "& quote && quote &" && quote & "  " & pLine && "-" && pLineIndex & quote & return after xOutput
end processTestEventBeginLine
            
----------

// Process time stamp end.
command processTestEventEndLine @xOutput, pLineIndex, pLine
   // Write the code to the output.
      put "/*"&pLineIndex&"*/ log" && quote & "event-end" & quote && "& quote && quote &" && quote & "  " & pLine && "-" && pLineIndex & quote & return after xOutput
end processTestEventEndLine
            
