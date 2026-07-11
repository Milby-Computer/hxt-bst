Script "stack_quality_card_id_1087"

/*
# Name: card "qualityEvalDiff" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1087 of stack "quality" of stack "livecodeTestInterface"
# Hash: XChpICC73G3Q3stxA4sHGA==
*/


// Test if we can process diff results and evaluate them.
// -------------------------------------------

// Determine if we can safely get evaluate diff tests.
on workListProcessDiffs @xWorkList, pWorkListID
   local tDiffEntriesToUpdate
   local tTest, tTestIsRunning
   put false into tTestIsRunning
   // See if we can find any incomplete tests.
   // THE FOLLOWING LOOP NEEDST TO BE UPDATED SO THAT IT CAN TAKE ACCOUNT OF DIFF TESTS THAT CAN BE EVALUATED AT TEST RUNTIME
   // RATHER THAN AFTER ALL THE TESTS HAVE BEEN COMPLETED.
   // THIS WILL REQUIRE AN UPDATE TO THE CACHE FILES AS WE NEED TO KNOW IN ADVANCE WHAT ENTRY IS RUNNING DIFF TESTS.
   repeat for each line tTest in the keys of xWorkList[pWorkListID]
      if tTest is a number then
         if "DiffIDs" is among the lines of the keys of xWorkList[pWorkListID][tTest] and "TestID" is not among the lines of the keys of xWorkList[pWorkListID][tTest] then
            put pWorkListID & comma & tTest & return after tDiffEntriesToUpdate
            next repeat
         end if
         if "Complete" is not among the keys of xWorkList[pWorkListID][tTest] then 
            put true into tTestIsRunning
            exit repeat
         end if
      end if
   end repeat         
   if tTestIsRunning is false then
      // We can now process the tests and update the restults.
      repeat for each line tTest in tDiffEntriesToUpdate
         workListExecuteDiffComparisonStack xWorkList, item 1 of tTest, item 2 of tTest
      end repeat
   end if
end workListProcessDiffs

// Execute the diff tests for diff data.
on workListExecuteDiffComparisonStack @xWorkList, pWorkListID, pIndexID
   local tKey, tTest, tResults, tTestName, tVersions, tFunction
   
   // Ensure that any previous evaluation stacks have been closed.
   if there is a stack the cLiveCodeDiffResultsStack of stack "quality" then
      lock messages
      delete stack the cLiveCodeDiffResultsStack of stack "quality"
      unlock messages
   end if
   
   // Open the test stack and allow.
   lock messages
   go invisible stack xWorkList[pWorkListID][pIndexID]["StackID"]
   unlock messages
   
   // Ensure we were able to read the stack. 
   if there is a stack the cLiveCodeDiffResultsStack of stack "quality" then
      
      // Run the stack code to update the diff results.
      dispatch "processNewDbs" to stack xWorkList[pWorkListID][pIndexID]["StackID"]
      
      // Get the most recent diff results.
      dispatch "getLatestResults" to stack xWorkList[pWorkListID][pIndexID]["StackID"]
      put the result into tResults
      
      // Get all of the diff results.
      // dispatch "getAllResults" to stack xWorkList[pWorkListID][pIndexID]["StackID"]
      // put the result into tResults
      
      // Extract the results and store them in the relevant results entry.
      set the itemDelimiter to slash
      put item 1 of xWorkList[pWorkListID][pIndexID]["DiffIDs"] into tTestName
      set the itemDelimiter to comma
      repeat for each line tVersions in the keys of tResults
         // Bin some of the data we are not interested in
         if item 1 of tVersions is item 2 of tVersions then next repeat 
         repeat for each line tFunction in the keys of tResults[tVersions]
            put tResults[tVersions][tFunction] into xWorkList[pWorkListID][pIndexID]["TestResults"][tFunction & comma & tTestName]["Report"][tVersions]
         end repeat
      end repeat
      
      // Indicate that this is a result of comparison data.
      put "diffs" into xWorkList[pWorkListID][pIndexID]["DataType"]
      
      // Update the status of each entry test entry and set it to complete
      repeat for each line tTest in the keys of xWorkList[pWorkListID][pIndexID]["TestResults"]
         put "complete" into xWorkList[pWorkListID][pIndexID]["TestResults"][tTest]["Status"]
         dispatch "qualityHandleWorkListMessage" to xWorkList[pWorklistID]["CallbackID"] with "worklist changed" & comma & pWorkListID & comma & pIndexID & comma & tTest
      end repeat 
   end if
   
   // Remove the evaluation stack from memory.
   lock messages
   delete stack xWorkList[pWorkListID][pIndexID]["StackID"]
   unlock messages   
   
   // Upate the test entry to indicate that the evaluation is complete.
   put empty into xWorkList[pWorkListID][pIndexID]["Complete"]
end workListExecuteDiffComparisonStack

// Build the LiveCode Diff stack file.
function buildDiffStack pCode, pDiffDb
   local tSaveResult, tSaveFileName, tPass, tWrapperCode
   
   put true into tPass
   
   // Create the file name of the test stack.
   put the cLiveCodeTestDbFolder of stack "quality" & word 1 to -1 of pDiffDb & the cLiveCodeDiffResultsStack of stack "quality" & the cLiveCodeExtension of stack "quality" into tSaveFileName
   
   // Test if there is already a diff stack.
   if there is a file tSaveFileName then return tPass
   
   if pCode is empty then
      logThis "Test Build Exception - No diff code found for processing." & return
      put false into tPass
   end if
   
   if there is a stack the cLiveCodeDiffResultsStack of stack "quality" then delete stack the cLiveCodeDiffResultsStack of stack "quality"
   
   // Ensure that any previous evaluation stacks have been closed.
   if there is a stack the cLiveCodeDiffResultsStack of stack "quality" then
      lock messages
      delete stack the cLiveCodeDiffResultsStack of stack "quality"
      unlock messages
   end if
   
   // Create a new stack.
   lock messages
   //create stack the cLiveCodeDiffResultsStack of stack "quality"
   // DO NOT USE THE FOLLOWING FORM ON IOS. IT DOES NOT LIKE IT ONE BIT!
   create invisible stack the cLiveCodeDiffResultsStack of stack "quality"
   set the defaultStack to the cLiveCodeDiffResultsStack of stack "quality"
   new card "runEvals"
   new button "execEval"
   unlock messages
   
   // Get the script that sucks in the database information and processes the diff information.
   put the script of card "qualityEvalDiffTemplate" of stack "quality" & return into tWrapperCode
   
   // Ensure the stack knows what database extensions to look for:
   replace "PLACE-HOLDER-FOR-TEST-DB-EXTENSION" with the cLiveCodeTestDbExtension of stack "quality" in tWrapperCode
   
   // Ensure the stack knows what what its name is:
   replace "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" with the cLiveCodeDiffResultsStack of stack "quality" in tWrapperCode
      
   // Set the script of the stack that processes the diff data.
   set the script of stack the cLiveCodeDiffResultsStack of stack "quality" to  tWrapperCode & pCode
      
   // Ensure that executing something on a different stack does not take the focus away.
   set the defaultStack to "quality"
   
   // Save the new script.
   lock messages
   save stack the cLiveCodeDiffResultsStack of stack "quality" as tSaveFileName
   unlock messages
   
   // Test that there were no problems when saving the stack.
   if the result is not empty then
      put the result into tSaveResult
      logThis "Test Build Exception - Could not save LiveCode diff stack file:" & return & tSaveResult & return
      put false into tPass
   end if
   
   // Remove the created stack from memory.
   lock messages
   delete stack the cLiveCodeDiffResultsStack of stack "quality"
   unlock messages   
end buildDiffStack
