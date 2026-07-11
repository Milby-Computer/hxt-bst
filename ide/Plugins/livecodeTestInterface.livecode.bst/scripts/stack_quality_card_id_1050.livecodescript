Script "stack_quality_card_id_1050"

/*
# Name: card "qualityBuildStacksFromStacks" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1050 of stack "quality" of stack "livecodeTestInterface"
# Hash: dX61KPWHx2DCTGG1OFKykw==
*/


// ---------- Create the Test Stack ----------

function buildTestStackData @rWorkList, pTestIdPairs
   local tPass, tTestPair, tWrapperCodeAdded, tIndex, tStackFileName, tStackFileNamesToDelete
   local tExecutionInstructions, tStandaloneInstructions, tStackCode, tLine
   local rMetaCode, rFileData, rDiffDbs
   
   put empty into tExecutionInstructions
   put empty into tStandaloneInstructions
   put empty into tStackCode
   put true into tPass
   put 1 into tIndex
   // Add the wrapper code.
   put the script of card "qualityBuildStackTemplate" of stack "quality" & return into tStackCode
   
   // Ensure that the iOS simulator can see the data exchange file:
   replace "PLACE-HOLDER-FOR-TEST-SPECIFIC-PATH" with the cLiveCodeTestDeviceDataCache of stack "quality" & \ 
         "testDataIos" & the cLiveCodeDeviceDataCacheExtension of stack "quality" in tStackCode
   
   // Ensure that the standalone has access to the resource directory.
   // The following code may have to change if this is going to happen over a network.
   replace "PLACE-HOLDER-FOR-RESORCE-SPECIFIC-PATH" with the cResourceStacks of stack "quality" in tStackCode
   
   // Cycle through each test in the test data array, convert it to LC and add it to the test stack.
   repeat for each line tTestPair in pTestIdPairs
      
      // Create a temporary copy of the stack file to load
      put rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestID"] into tStackFileName
      replace the cTestFolder of stack "quality" with the cLiveCodeTestStackCache of stack "quality" in tStackFileName
      if rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestID"] is tStackFileName then next repeat
      
      // Add the stack name to delete.
      put tStackFileName & return after tStackFileNamesToDelete
      
      // Create the target directory
      set the itemDelimiter to slash
      createAllFolders item 1 to -2 of tStackFileName
      set the itemDelimiter to comma
      
      // Copy the stack file to the cache location.
      revCopyFile rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestID"], tStackFileName
      
      // Read the test file from the files system.
      put readStackFile (rFileData, rDiffDbs, tStackFileName, rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestSignature"]) into tPass
      
      // We need to extract the meta information to create the execution instructions.
      if tPass is true then
         if processMeta (rMetaCode, rWorkList, rFileData, tTestPair) is false then put false into tPass
         //processMeta (rMetaCode, tTestDataArray[tTestKey][tKey], tTestCaseDirectory, tKey) is false then put false into tResult
      end if
      
      // If we have no errors, then construct the stack and the execution instructions.
      if tPass is true and tStackCode is not empty and rMetaCode is not empty then
         replace "/*Include Stack Here*/" with "put" && quote & tStackFileName & quote && "into tStacksToInclude[" & tIndex & "]" & return & "   /*Include Stack Here*/" in tStackCode
         put rMetaCode & return after tExecutionInstructions
         // Make sure we include any resource information that the test stack may require
         if processAddResources (tStackCode, tIndex, rFileData) is false then put false into tPass 
         add 1 to tIndex
      else
         // Ensure we mark tests as not runable
         put empty into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["Complete"]
         logThis "Test Build Exception - No test data found for processing in file:" && rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestID"] & return
      end if
      
      // If we have no errors and we have found diff tests then ensure the work list is aware of them.
      if tPass is true and rDiffDbs is not empty then
         put rDiffDbs into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["DiffIDs"]
         // Create an entry in the table to store the diff results
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
   
   // Remove the temporary LiveCode stacks.
   repeat for each line tLine in tStackFileNamesToDelete
      delete file tLine
   end repeat
   
   // Update the work list with appropriate information.
   repeat for each line tTestPair in pTestIdPairs
      put line 1 of pTestIdPairs into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["StackID"]
      if tPass is false then
         if "TestResults" is among the keys of rWorkList[item 1 of tTestPair][item 2 of tTestPair] then
            repeat for each line tKey in the keys of rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestResults"]
               put "failed" into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestResults"][tKey]["Status"]
               put "Could not build the test files." into rWorkList[item 1 of tTestPair][item 2 of tTestPair]["TestResults"][tKey]["Report"]
            end repeat
         end if
      end if
   end repeat
   
   return tPass
end buildTestStackData

// ---------- Process the Test Meta Data File Content ----------
function processMeta @rMetaCode, @rWorkList, pInputData, pTestPair
   local tLine, tResult, tInMeta, tStackName, tI
   local tExecutionLimit, tShowTest, tSupportEnv
   
   put true into tInMeta
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
      if tInMeta then
         switch word 1 of tLine
            case "max-test-duration"
               put word 2 to -1 of tLine into tExecutionLimit
               break
            case "show-test"
               put word 2 to -1 of tLine into tShowTest
               break
            case "support-env"
               put word 2 to -1 of tLine into tSupportEnv
               break
            default
               break
         end switch
      else
         if word 1 of tLine begins with "subtest" and word 2 of tLine begins with "test_" and \
         word 2 of tLine is among the items of rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestsToUse"] then
            // Create the number of entries to test as are tests in the test file.
            if rMetaCode is empty then
               put "--index" && word 2 of tLine & comma & tStackName && \
                     "--maxduration" && tExecutionLimit && \
                     "--showtest" && tShowTest && \
                     "--supportenv" && tSupportEnv && \
                     "--filename" && rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"] into rMetaCode
            else 
               put return & "--index" && word 2 of tLine & comma & tStackName && \
                     "--maxduration" && tExecutionLimit && \
                     "--showtest" && tShowTest && \
                     "--supportenv" && tSupportEnv && \
                     "--filename" && rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestID"] after rMetaCode
            end if
            // We create an entry in the work list for each test
            put "not started" into rWorkList[item 1 of pTestPair][item 2 of pTestPair]["TestResults"][word 2 of tLine & comma & tStackName]["Status"]
         end if
      end if
      if word 1 of tLine is "setup" then put false into tInMeta      
   end repeat
   // Test if we found any data we can use.
   return tResult
end processMeta

function processAddResources @rStackCode, @rIndex, pInputData
   local tLine, tResource, tPass, tBeginInsert, tEndInsert, tExistingEntry
   put true into tPass
   repeat for each line tLine in pInputData
      if word 1 of tLine is "setup" then exit repeat
      if word 1 of tLine is "resource-stack" then
         if the cResourceStacks of stack "quality" is empty then 
            logThis "Test Build Exception - No path specified for resource files." & return
            put false into tPass
            exit repeat
         end if
         put offset ("/*Include Stack From Here*/", rStackCode) into tBeginInsert
         repeat for each item tResource in word 2 to -1 of tLine
            put offset ("/*Include Stack Here*/", rStackCode) into tEndInsert
            if there is a file (the cResourceStacks of stack "quality" & tResource) then
               put offset (the cResourceStacks of stack "quality" & tResource, rStackCode) into tExistingEntry
               if tExistingEntry < tBeginInsert or tExistingEntry > tEndInsert then
                  add 1 to rIndex
                  replace "/*Include Stack Here*/" with "put" && quote & the cResourceStacks of stack "quality" & tResource & quote && "into tStacksToInclude[" & rIndex & "]" & return & "   /*Include Stack Here*/" in rStackCode
               end if
            else
               logThis "Test Build Exception - No resource file: " && the cResourceStacks of stack "quality" & tResource & return
               put false into tPass
            end if            
         end repeat
      end if      
   end repeat
   return tPass
end processAddResources
         
