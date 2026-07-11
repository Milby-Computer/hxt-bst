Script "stack_quality_card_id_1048"

/*
# Name: card "qualityWorkList" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1048 of stack "quality" of stack "livecodeTestInterface"
# Hash: 5IneImo3/CafKYYTlf3x9A==
*/


// Work List Structure
// STAGE 1:
// [WorkListID] This is the unique work list id that is unique to a batch of tests.
// [WorkListID]["CallbackID"] The unique callback id associated with a particular work list.
// [WorkListID]["Status"] This is a switch that indicates the status of the worklist:
//          - worklist created - The basic test information was added.
//          - worklist duplicate test optimized - The data was optimized for possible test duplication.
//          - worklist decomposed - The test information has been processed, ready for testing.
//          - worklist started - The test cycle has been started.
//          - worklist suspending - A request has been made to suspend testing.
//          - worklist suspended - Testing has been suspended.
//          - worklist finished - Testing is finished.
//          - worklist removed - The tests have been removed.
// [WorkListID][TestIndexID] This is the unique index that is assigned to a single test file.
// [WorkListID][TestIndexID]["TestID"] This is the test file that is to be tested.
// [WorkListID][TestIndexID]["VersionID"] This is the LiveCode version the test is to be run on.
// [WorkListID][TestIndexID]["PlatformID"] This is the hardware platform on which the test is to be run.
// [WorkListID][TestIndexID]["PlatformGroupID"] This is the hardware platform group on which the test is to be run.
// [WorkListID][TestIndexID]["TestConfigurationSignature"] The MD5 digest of the test configuration.
// [WorkListID][TestIndexID]["TestsToUse"] The tests to run.
// STAGE 2:
// [WorkListID][TestIndexID]["DuplicateID"] This refers to another identical test, if the user selected multiples of the same test by accident.
// STAGE 3:
// [WorkListID][TestIndexID]["StandaloneSettingsSignature"] The MD5 digest of the standalone configuration settings.
// STAGE 4:
// [WorkListID][TestIndexID]["DiffIDs"] This is only populated if differencing is required for the test.
//             Post test run completion. A process is started to run all diff tests.
//             It should also be possible to run the process throughout testing once we have flags that indicate that all tests with on particular diffID have been completed.
// [WorkListID][TestIndexID]["StackID"] This is the ID of the standalone that is generated for testing.
//             Once all tests have been completed then empty is assigned to this variable.
// [WorkListID][TestIndexID]["TestResults"][SubTestIndexID] This is the unique test number that each test in the work list has.
//             A test file (TestID) can have multiple tests that are to be run.
// [WorkListID][TestIndexID]["TestResults"][SubTestIndexID]["SetupComment"] Contains the comment that is passed in quotes after "setup" in a script file
// [WorkListID][TestIndexID]["TestResults"][SubTestIndexID]["Status"] This is the status in which the test currently is.
//          - not started // indicates that the test data has been created and is ready to run
//          - pending // indicates that the test is running
//          - complete // inidcates that the test is complete
//          - skipped // indicates that the test cannot be run on the test set up
//          - failed // indicates that the test has failed
// STAGE 5:
// [WorkListID][TestIndexID]["TestResults"][SubTestIndexID]["ProcessID"] This is the process ID used when spawning the test with openProcess.
// [WorkListID][TestIndexID]["TestResults"][SubTestIndexID]["Report"] This includes the report that was generated for the particular test.
// STAGE 6:

// The Work List is constructed, updated and maintained over a numer of itterations:
// 1. A request is sent to the Work List to add tests with particular run options for testing:
//          - Create a new Work List ID.
//          - Set the callback id for the particular work list.
//          - Create new Index entries. On for every TestID, VersionID and PlatformID combination.
//             At this point we do not look inside the files and decompose them into their sub tests, create MD5 digests ...
//          - Populate the TestConfigurationSignature.
//          - Set the status to "created".
// 2. If there is more than one Work List ID, ensure that duplicate test combinations are adequately tagged.
//          - Test that there is no duplication of tests between work lists. If there is, then add the Work List ID and Index here.
//             We use the TestConfigurationSignature for that, which is an MD5 digest of the TestID, VersionID and PlatformID.
//          - Set the status to "duplicate test optimized"
// 3. Once the data for testing has been added, we break the data down and make it pliable for optimization purposes.
//          - Create the MD5 digest of the standalone configuration settings.
//          - Set the status to "decomposed".
// 4. When tests are started, test standalones are built on an as needed basis.
//          - When a new standalone is being built for a particular platform, test all possible Work List ID and Test Index ID entries
//             to see if it is possible to include the particular stack in the standalone.
//          - Update the Stack ID with the path to the stack.
//          - Create the unique sub test index numbers.
//          - Set the status of the test to not started.
// 5. Run tests and update information in the StackID as required.
//          - Test that all conditions are meat for running a test: A stack exists, the tests has not been run before,
//             the test is not pending and the test does not have duplicate reference information.
//          - Set the status to pending.
//          - Set the process Id to the name that is given to open process. 
//          - Evaluate the running state of the test and set status accordingly to complete/failed.
//          - Ensure that the process is closed and set the process ID to empty.
//          - Populate the report with the information collected from the open process.
// 6. Once all tests have been run, ensure that all dupicate information is processed.

local gWorkList, gWorkListID, gTestIndexID, gHouseKeepingItteration, gWorkListRunning

////////////////////////////////////////////////////////////////////////////////////////////////////
// INTERFACE TO THE WORK LIST
////////////////////////////////////////////////////////////////////////////////////////////////////

// Reset any worklist information that may currently exist.
on workListInitialise
   put empty into gWorkList
   put 1 into gWorkListID
   put 0 into gHouseKeepingItteration
   put false into gWorkListRunning
   
   // This is the unique test ID for all the tests to be processed. This is not the same as the Index,
   // which is unique to a WorkListID and indicates the unique combination of TestID, VersionID and PlatformID.
   put 1 into gTestIndexID
end worklistInitialise

// Creates the worklist content and returns the worklist id
function workListCreate pTestIDs, pVersionIDs, pPlatformIDs, pCallbackID
   // Set the CallbackID for the particular work list.
   put pCallbackID into gWorkList[gWorkListID]["CallbackID"]
   
   // Run Stage 1.
   workListCreateStage1 pTestIDs, pVersionIDs, pPlatformIDs
   
   // Run Stage 2.
   workListCreateStage2
   
   //Run Stage 3.
   workListCreateStage3
   
   // Increment the Work List ID
   add 1 to gWorkListID
   
   // Return the worklist id of the worklist we just created
   return gWorkListID - 1
end WorklistCreate

// Work List creation stage 1.
on workListCreateStage1 pTestIDs, pVersionIDs, pPlatformIDs
   local tTest, tVersion, tPlatform, tSupportedPlatforms, tPrelimSubTestIndexID
   // Get the platforms we support.
   qualityListPlatforms
   put the result into tSupportedPlatforms
   // Create a new index entry for each possible TestID, VersionID and PlatformID combination.
   repeat for each line tTest in pTestIDs
      if tTest is empty then next repeat
      repeat for each line tVersion in pVersionIDs
         if tVersion is empty then next repeat
         repeat for each line tPlatform in pPlatformIDs
            if tPlatform is empty then next repeat
            put item 1 of tTest into gWorkList[gWorkListID][gTestIndexID]["TestID"]
            put item 2 to -1 of tTest into gWorkList[gWorkListID][gTestIndexID]["TestsToUse"]
            put tVersion into gWorkList[gWorkListID][gTestIndexID]["VersionID"]
            put tPlatform into gWorkList[gWorkListID][gTestIndexID]["PlatformID"]
            repeat for each line tKey in the keys of tSupportedPlatforms
               if tPlatform is among the lines of tSupportedPlatforms[tKey] then 
                  put tKey into gWorkList[gWorkListID][gTestIndexID]["PlatformGroupID"]
                  exit repeat
               end if
            end repeat
            if "PlatformGroupID" is not among the keys of gWorkList[gWorkListID][gTestIndexID] then
               logThis "Could not find the selected platform:" && tPlatform & return
            end if
            // Set the TestConfigurationSignature.
            put md5Digest (tTest & tVersion & tPlatform) into gWorkList[gWorkListID][gTestIndexID]["TestConfigurationSignature"] 
            // Increment the Test Index ID.
            add 1 to gTestIndexID
         end repeat
      end repeat
   end repeat   
   // Set the status to "created" 
   put "worklist created" into gWorkList[gWorkListID]["Status"]
   // Dispatch an update to the appropriate message handler.
   dispatch "qualityHandleWorkListMessage" to gWorkList[gWorkListID]["CallbackID"] with "worklist created" & comma & gWorkListID
end workListCreateStage1

// Work List creation stage 2.
on workListCreateStage2
   local tWorkListID, tNewTestIndexID, tExistingIndexID   
   // Check if there are duplicate test scenarios between Work Lists.
   repeat with tWorkListID = 1 to gWorkListID - 1
      repeat for each line tExistingTestIndexID in the keys of gWorkList[tWorkListID]
         repeat for each line tNewTestIndexID in the keys of gWorkList[gWorkListID]
            if tExistingTestIndexID is a number and tNewTestIndexID is a number and \
                  gWorkList[gWorkListID][tNewTestIndexID]["TestConfigurationSignature"] is gWorklist[tWorkListID][tExistingTestIndexID]["TestConfigurationSignature"] and \
                  "DuplicateID" is not among the lines of the keys of gWorkList[tWorkListID][tExistingTestIndexID] then
               put tWorkListID & comma & tExistingTestIndexID into gWorkList[gWorkListID][tNewTestIndexID]["DuplicateID"]
            end if
         end repeat
      end repeat
   end repeat
   // Set the status to "created" 
   put "worklist duplicate test optimized" into gWorkList[gWorkListID]["Status"]
   // Dispatch an update to the appropriate message handler.
   dispatch "qualityHandleWorkListMessage" to gWorkList[gWorkListID]["CallbackID"] with "worklist duplicate test optimized" & comma & gWorkListID
end workListCreateStage2

// Work List creation stage 3.
on workListCreateStage3
   local tNewTestIndexID, tSupportedPlatforms, xFileData, tLine, tStandaloneData
   local tPath, tCacheName, tMD5CachePaths, rMD5Digests, tKey
   local rDiffDbs
   
   // Get information on the supported platforms.
   qualityListPlatforms
   put the result into tSupportedPlatforms
   put empty into tMD5CachePaths
   
   // Get the MD5 digest of the standalone configuration settings.
   repeat for each line tNewTestIndexID in the keys of gWorkList[gWorkListID]
      if tNewTestIndexID is a number and "DupulicateID" is not among the lines of the keys of gWorkList[gWorkListID][tNewTestIndexID] then
         
         // Break the TestID down into the path and the name of a possible cache file.
         set the itemDelimiter to slash
         put item 1 to -2 of gWorkList[gWorkListID][tNewTestIndexID]["TestID"] & slash into tPath
         put item -1 of gWorkList[gWorkListID][tNewTestIndexID]["TestID"] & the cLiveCodeCacheExtension of stack "quality" into tCacheName
         
         // See if there are any files to cache.
         getCacheFiles tMD5CachePaths, tPath
         
         if not ( tCacheName is among the lines of tMD5CachePaths[tPath]) then
            // The user probably updated the file between runs. So we need to update the cache and work list entry.
            //////////////////////////////////// HSC ADD APPROPRIATE VARS get readTestFile (xFileContent, rDiffDb, pID)            
            
            // See if there are any files to cache.
            getCacheFiles tMD5CachePaths, tPath            
         end if
         
         if tCacheName is among the lines of tMD5CachePaths[tPath] then            
            // We have an up to date cache, read the MD5 data.
            qualityGetTestTags tPath & tCacheName, tMD5CachePaths
            put the result into xFileData
            put readMetaData (gWorkList[gWorkListID][tNewTestIndexID]["PlatformGroupID"] & "MD5", xFileData) into gWorkList[gWorkListID][tNewTestIndexID]["StandaloneSettingsSignature"]
            put readMetaData ("testUID", xFileData) into gWorkList[gWorkListID][tNewTestIndexID]["TestSignature"]
            if gWorkList[gWorkListID][tNewTestIndexID]["TestSignature"] is empty then
               logThis "No UID for test:" && gWorkList[gWorkListID][tNewTestIndexID]["TestID"] && "Please delete the cache file." & return 
            end if
         else
            // We can still not get hold of the relevant file. Log this and skip the test.            
            logThis "No cache file found for:" && gWorkList[gWorkListID][tNewTestIndexID]["TestID"] & "." & return 
            // HSC ADD RELEVANT INFO HERE
            // MAYBE PUT skipped into [WorkListID][TestIndexID]["TestResults"][SubTestIndexID]["Status"].
         end if
      end if
   end repeat  
   // Set the status to "decomposed" 
   put "worklist decomposed" into gWorkList[gWorkListID]["Status"]
   // Dispatch an update to the appropriate message handler.
   dispatch "qualityHandleWorkListMessage" to gWorkList[gWorkListID]["CallbackID"] with "worklist decomposed" & comma & gWorkListID
end workListCreateStage3

// Try to create work list entries for the differencing results.
// We do not populate "TestResults" at this point. This takes place once the results are made available.
on workListCreateDiffEntries pDiffDbs, pTestPair
   local tWorkListID, tTestIndexID, tDiffDb, tDiffDbs, tDiffDbsToCreate, tWorkListToCreateIn
   put 1 into tWorkListToCreateIn // SET THIS TO EMPTY AND UPDATE AS PER THE PARTICULAR WORK LIST IN WHICH THE DIFFS TAKE PLACE.
   put pDiffDbs into tDiffDbs
   // Check if there are diff result entries for the tests we are already running.
   repeat with tWorkListID = 1 to gWorkListID - 1
      if tDiffDbs is empty then exit repeat
      repeat for each line tTestIndexID in the keys of gWorkList[tWorkListID]
         // Find other diff result entries.
         if "DiffIDs" is among the lines of the keys of gWorkList[tWorkListID][tTestIndexID] then
            if  "TestID" is not among the lines of the keys of gWorkList[tWorkListID][tTestIndexID] then
               put gWorkList[tWorkListID][tTestIndexID]["DiffIDs"] into tDiffDb
               if gWorkList[tWorkListID][tTestIndexID]["DiffIDs"] is among the lines of tDiffDbs then
                  replace gWorkList[tWorkListID][tTestIndexID]["DiffIDs"] with empty in tDiffDbs
               end if
            else
               // UPDATE CODE HERE SO THAT WE CAN ASSIGN THE ID OF THE PARTICULAR WORK LIST THAT CONTAINS THE TESTS.
            end if
         end if
      end repeat
   end repeat
   repeat for each line tDiffDb in tDiffDbs
      if tDiffDb is not empty then
         put tWorkListToCreateIn & comma & tDiffDb & return after tDiffDbsToCreate
      end if
   end repeat
   repeat for each line tDiffDb in tDiffDbsToCreate
      put item 2 of tDiffDb into gWorkList[item 1 of tDiffDb][gTestIndexID]["DiffIDs"]
      put the cLiveCodeTestDbFolder of stack "quality" & item 2 of tDiffDb & the cLiveCodeDiffResultsStack of stack "quality" & the cLiveCodeExtension of stack "quality" into gWorkList[item 1 of tDiffDb][gTestIndexID]["StackID"]
      //dispatch "qualityHandleWorkListMessage" to gWorkList[item 1 of tDiffDb]["CallbackID"] with "worklist changed" & comma & item 1 of tDiffDb & comma & gTestIndexID
      put gWorkList[item 1 of pTestPair][item 2 of pTestPair]["SetupComment"] into gWorkList[item 1 of tDiffDb][gTestIndexID]["SetupComment"]
      add 1 to gTestIndexID      
   end repeat
end workListCreateDiffEntries

// Starts processing the work lists.
function workListStart pWorkListIDs
   local tWorkListID
   repeat for each item tWorkListID in pWorkListIDs
      if tWorkListID is among the keys of gWorkList then
         switch gWorkList[tWorkListID]["Status"]
            case "worklist started"
               logThis "Start - Action Request for Work List:" && tWorkListID && "Denied - Already Running." & return 
               break
            case "worklist finished"
               logThis "Start - Action Request for Work List:" && tWorkListID && "Denied - Testing is Finished." & return
               break
            case "worklist removed"
               logThis "Start - Action Request for Work List:" && tWorkListID && "Denied - Tests Removed." & return
               break
            case "worklist removing"
               logThis "Start - Action Request for Work List:" && tWorkListID && "Denied - Tests Being Removed." & return
               break
            case "worklist created"
            case "worklist duplicate test optimized"
            case "worklist suspending"
               logThis "Start - Action Request for Work List:" && tWorkListID && "Denied - Not Ready to Run." & return
               break
            case "worklist decomposed"
            case "worklist suspended"
               // Set the status to "started".
               put "worklist started" into gWorkList[tWorkListID]["Status"]
               // Dispatch an update to the appropriate message handler.
               dispatch "qualityHandleWorkListMessage" to gWorkList[tWorkListID]["CallbackID"] with "worklist started" & comma & tWorkListID
               // Ensure that the test loop is running.
               if gWorkListRunning is false then
                  put true into gWorkListRunning
                  dispatch "workListLoop" to card "qualityWorkList" of stack "quality"
               end if
               break
            default
               logThis "Start - Action Request for Work List:" && tWorkListID && "Denied - Unknown Request:" && gWorkList[tWorkListID]["Status"] & "." & return
               break
         end switch
      end if
   end repeat
end worklistStart

// Stops processing the work lists.
function workListStop pWorkListIDs
   local tWorkListID
   repeat for each item tWorkListID in pWorkListIDs
      if tWorkListID is among the keys of gWorkList then
         switch gWorkList[tWorkListID]["Status"]
            case "worklist created"
            case "worklist duplicate test optimized"
            case "worklist suspending"
            case "worklist decomposed"
            case "worklist suspended"
               logThis "Stop - Action Request for Work List:" && tWorkListID && "Denied - Not Running." & return 
               break
            case "worklist finished"
               logThis "Stop - Action Request for Work List:" && tWorkListID && "Denied - Testing is Finished." & return
               break
            case "worklist removed"
               logThis "Stop - Action Request for Work List:" && tWorkListID && "Denied - Tests Removed." & return
               break
            case "worklist removing"
               logThis "Stop - Action Request for Work List:" && tWorkListID && "Denied - Tests Being Removed." & return
               break
            case "worklist started"
               // Set the status to "suspending"
               put "worklist suspending" into gWorkList[tWorkListID]["Status"]
               // Dispatch an update to the appropriate message handler.
               dispatch "qualityHandleWorkListMessage" to gWorkList[tWorkListID]["CallbackID"] with "worklist suspending" & comma & tWorkListID
               break
            default
               logThis "Stop - Action Request for Work List:" && tWorkListID && "Denied - Unknown Request:" && gWorkList[tWorkListID]["Status"] & "." & return
               break
         end switch
      end if
   end repeat
end worklistStop

// Destroys work lists that are currently being processed in some form or another.
function workListDestroy pWorkListIDs
   local tWorkListID, tTest
   repeat for each item tWorkListID in pWorkListIDs
      if tWorkListID is among the keys of gWorkList then
         switch gWorkList[tWorkListID]["Status"]
            case "worklist created"
            case "worklist duplicate test optimized"
               logThis "Destroy - Action Request for Work List:" && tWorkListID && "Denied - Not yet Created." & return 
               break
            case "worklist suspending"
               logThis "Destroy - Action Request for Work List:" && tWorkListID && "Denied - Not yet Suspended." & return 
               break
            case "worklist removed"
               logThis "Destroy - Action Request for Work List:" && tWorkListID && "Denied - Already Removed." & return
               break
            case "worklist removing"
               logThis "Destroy - Action Request for Work List:" && tWorkListID && "Denied - Already Being Removed." & return
               break
            case "worklist started"
               logThis "Destroy - Action Request for Work List:" && tWorkListID && "Denied - Testing is Running." & return 
               break               
            case "worklist finished"
            case "worklist decomposed"
            case "worklist suspended"
               // Delete the test entries.
               repeat for each line tTest in the keys of gWorkList[tWorkListID]
                  if tTest is a number then delete variable gWorkList[tWorkListId][tTest] 
               end repeat
               // Set the status to "removing".
               put "worklist removing" into gWorkList[tWorkListID]["Status"]
               // Dispatch an update to the appropriate message handler.
               dispatch "qualityHandleWorkListMessage" to gWorkList[tWorkListID]["CallbackID"] with "worklist removed" & comma & tWorkListID
               break
            default
               logThis "Destroy - Action Request for Work List:" && tWorkListID && "Denied - Unknown Request:" && gWorkList[tWorkListID]["Status"] & "." & return
               break
         end switch
      end if
   end repeat
end worklistDestroy

// Sorts the worklist entries by order of the pSortKey pairs:
// - A sort key pair consists of the key to sort by and the direction of the sort: "+|-"
function workListSort pWorkListIDs, pSortKeys
end worklistSort

// Returns the number of tests in a work list.
function workListGetCount pWorkListIDs
   local tIndex, tResult, tKey
   put 0 into tResult
   repeat for each item tIndex in pWorkListIDs
      if tIndex is among the lines of the keys of gWorkList then
         repeat for each line tKey in the keys of gWorkList[tIndex]
            if "TestsToUse" is among the keys of gWorkList[tIndex][tKey] then
               add the number of items in gWorkList[tIndex][tKey]["TestsToUse"] to tResult
            end if
         end repeat
      else
         logThis "No Work List with ID:" && tIndex & "." & return
      end if      
   end repeat
   return tResult
end worklistGetCount

// Returns the number of test that have been processed in the work list.
// We may want to keep track of a global, rather than running this code each time.
function workListGetProgress pWorkListIDs
   local tIndex, tKey, tKey2, tResult, tComplete
   put 0 into tResult
   repeat for each item tIndex in pWorkListIDs
      if tIndex is among the lines of the keys of gWorkList then
         repeat for each line tKey in the keys of gWorkList[tIndex]
            if tKey is a number and "TestResults" is among the keys of gWorkList[tIndex][tKey] then
               repeat for each line tTest in the keys of gWorkList[tIndex][tKey]["TestResults"]
                  if gWorkList[tIndex][tKey]["TestResults"][tTest] is an array and \
                        "Status" is among the keys of gWorkList[tIndex][tKey]["TestResults"][tTest] and \
                        (gWorkList[tIndex][tKey]["TestResults"][tTest]["Status"] is "complete" or \
                        gWorkList[tIndex][tKey]["TestResults"][tTest]["Status"] is "skipped" or \
                        gWorkList[tIndex][tKey]["TestResults"][tTest]["Status"] begins with "failed") then
                     add 1 to tResult
                  end if
               end repeat 
            end if
         end repeat         
      else
         logThis "No Work List with ID:" && tIndex & "." & return
      end if      
   end repeat
   return tResult
end workListGetProgress

// Returns an array of field entries for a given work list entry.
function workListGetItemDetails pWorkListID, pIndexes
   local tIndex, tKey, tFilters, tResult
   // Specify here what items are to be filtered out for use in the UI:
   put "DuplicateID,TestResults,PlatformID,VersionID,TestID,DiffIDs,DataType" into tFilters
   put empty into tResult
   if pWorkListID is among the lines of the keys of gWorkList then
      repeat for each item tIndex in pIndexes
         if gWorkList[pWorkListID][tIndex] is an array then
            repeat for each line tKey in the keys of gWorkList[pWorkListID][tIndex]
               if tKey is among the items of tFilters then
                  put gWorkList[pWorkListID][tIndex][tKey] into tResult[pWorkListID][tIndex][tKey]
               end if
            end repeat
         else
            logThis "Work List:" && pWorkListID && " has no Index" && tIndex & "." & return
         end if
      end repeat
   else
      logThis "No Work List with ID:" && pWorkListID & "." & return
   end if
   return tResult
end workListGetItemDetails

////////////////////////////////////////////////////////////////////////////////////////////////////
// FILE NAME GENERATION CODE
////////////////////////////////////////////////////////////////////////////////////////////////////

// Get the executable name for a particular test entry.
function getExecutableName pWorkListID, pIndex
   local tExtensions
   put the cTestExecutableExtension of stack "quality" into tExtensions
   if pWorkListID is among the keys of gWorkList and \ 
         pIndex is among the keys of gWorkList[pWorkListID] and \
         "PlatformGroupID" is among the keys of gWorkList[pWorkListID][pIndex] and \
         gWorkList[pWorkListID][pIndex]["PlatformGroupID"] is among the keys of tExtensions and \
         "StackID" is among the keys of gWorkList[pWorkListID][pIndex] and \
         gWorkList[pWorkListID][pIndex]["StackID"] is not empty then
      if gWorkList[pWorkListID][pIndex]["PlatformGroupID"] is not "Desktop" then
         return the cLiveCodeTestStandalones of stack "quality" & \
               the cTestStackName of stack "quality" & \
               "_" & \
               gWorkList[pWorkListID][pIndex]["PlatformGroupID"] & \
               "_" & \
               item 1 of gWorkList[pWorkListID][pIndex]["StackID"] & \
               "_" & \
               item 2 of gWorkList[pWorkListID][pIndex]["StackID"] & \
               tExtensions[gWorkList[pWorkListID][pIndex]["PlatformGroupID"]]
      else if gWorkList[pWorkListID][pIndex]["PlatformGroupID"] is among the keys of tExtensions then
         return the cLiveCodeTestStandalones of stack "quality" & \
               the cTestStackName of stack "quality" & \
               "_" & \
               gWorkList[pWorkListID][pIndex]["PlatformGroupID"] & \
               "_" & \
               item 1 of gWorkList[pWorkListID][pIndex]["StackID"] & \
               "_" & \
               item 2 of gWorkList[pWorkListID][pIndex]["StackID"] & \
               tExtensions[gWorkList[pWorkListID][pIndex]["PlatformID"]]
      else
         return empty 
      end if
   else
      return empty
   end if
end getExecutableName

// Get the stack name for a particular test entry.
function getStackName pWorkListID, pIndex
   if pWorkListID is among the keys of gWorkList and \ 
         pIndex is among the keys of gWorkList[pWorkListID] and \
         "PlatformGroupID" is among the keys of gWorkList[pWorkListID][pIndex] and \
         "StackID" is among the keys of gWorkList[pWorkListID][pIndex] and \
         gWorkList[pWorkListID][pIndex]["StackID"] is not empty then
      return the cLiveCodeTestStacks of stack "quality" & \
            the cTestStackName of stack "quality" & \
            "_" & \
            gWorkList[pWorkListID][pIndex]["PlatformGroupID"] & \
            "_" & \
            item 1 of gWorkList[pWorkListID][pIndex]["StackID"] & \
            "_" & \
            item 2 of gWorkList[pWorkListID][pIndex]["StackID"] & \
            the cLiveCodeExtension of stack "quality"
   else
      return empty
   end if
end getStackName

// Get the stack name for a particular test entry.
function getTrimmedSourceStackName pWorkListID, pIndex
   local tStackName   
   put empty into tStackName
   set the itemDelimiter to slash
   if pWorkListID is among the keys of gWorkList and \
         pIndex is among the keys of gWorkList[pWorkListID] and \
         "TestID" is among the keys of gWorkList[pWorkListID][pIndex] then
      put item -1 of gWorkList[pWorkListID][pIndex]["TestID"] into tStackName
      if tStackName ends with the cLiveCodeExtension of stack "quality" or tStackName ends with the cRevExtension of stack "quality" or tStackName ends with the cLiveCodeTestExtension of stack "quality" then
         set the itemDelimiter to "."
         put item 1 to -2 of tStackName into tStackName
      else
         put empty into tStackName
      end if 
   end if
   return tStackName
end getTrimmedSourceStackName

// Get the execution instructions information name for a particular entry
function getInstructionsName pWorkListID, pIndex
   if pWorkListID is among the keys of gWorkList and \ 
         pIndex is among the keys of gWorkList[pWorkListID] and \
         "PlatformGroupID" is among the keys of gWorkList[pWorkListID][pIndex] and \
         "StackID" is among the keys of gWorkList[pWorkListID][pIndex] and \
         gWorkList[pWorkListID][pIndex]["StackID"] is not empty then
      return the cLiveCodeTestInstructions of stack "quality" & \
            the cTestStackName of stack "quality" & \
            "_" & \
            gWorkList[pWorkListID][pIndex]["PlatformGroupID"] & \
            "_" & \
            item 1 of gWorkList[pWorkListID][pIndex]["StackID"] & \
            "_" & \
            item 2 of gWorkList[pWorkListID][pIndex]["StackID"] & \
            the cLiveCodeTestInstructionsExtension of stack "quality"
   else
      return empty
   end if
end getInstructionsName

////////////////////////////////////////////////////////////////////////////////////////////////////
// THE WORK LIST CYCLE
////////////////////////////////////////////////////////////////////////////////////////////////////

// The main work list loop operations
on workListLoop
   local tWorkListID, tTestsAreRunning, tTest, rWorkListTestsToBuild
   
   put false into tTestsAreRunning
   
   // Ensure that the test loop is to be running.
   if gWorkListRunning is false then exit workListLoop
   
   // Do some housekeeping.
   if gHouseKeepingItteration > 5 then // Set the hosekeeping interval as is appropriate.
      // Ensure we remove any old standalone data we do not need anymore.
      // Also ensure that the suspending and destroying processes are carried through.
      // Test that work lists have been completed.
      workListHousekeeping gWorkList
      put 0 into gHouseKeepingItteration
   else
      add 1 to gHouseKeepingItteration
   end if
   
   // Try to get results from running tests and update the work list accordingly.
   // This also tries to start tests and returns a list of idle platforms for which executables do not yet exist.
   workListGetTestResults rWorkListTestsToBuild
   put the result into tTestsAreRunning
   
   // Build a standalones for particular targets.
   repeat for each key tTest in rWorkListTestsToBuild
      dispatch "runGeneration" to card "qualityBuildStacks" of stack "quality" with gWorkList, item 1 of rWorkListTestsToBuild[tTest], item 2 of rWorkListTestsToBuild[tTest]
      dispatch "buildExecutable" to card "qualityBuildStandalone" of stack "quality" with gWorkList, item 1 of rWorkListTestsToBuild[tTest], item 2 of rWorkListTestsToBuild[tTest]
   end repeat
   
   // Send a message to workListLoop in an appropriate time interval, depending on the run state of tests.
   if tTestsAreRunning then
      send "workListLoop" to me in 200 milliseconds
   else
      send "workListLoop" to me in 1000 milliseconds
   end if
end workListLoop

////////////////////////////////////////////////////////////////////////////////////////////////////
// Work List House Keeping
////////////////////////////////////////////////////////////////////////////////////////////////////

// An executed test cycle is responsible for removing any temporary files that are needed to run the test.
// The only exception being standalone files that are generated for multiple tests that may also contain tests across work lists.
// We remove standalone files that are not needed as part of the housekeeping cycle.
// XXX WE STILL HAVE TO DEAL WITH DUPLICATES AND THEIR RESOLUTION XXX
// XXX IN PARTICULAR, WE NEED TO KNOW WHAT TO DO WHEN WE ARE DELETING A WORKLIST THAT HAS TESTS, COMPLETE OR NOT XXX
// XXX WITH OTHER WORKLISTS DEPENDING ON THEIR RESOLUTION XXX
// XXX - DO WE MOVE THE REQUIREMENTS FROM THE LIST BEING DELETED TO ANOTHER LIST AND REBEND ALL OTHER DEPENDENCIES? XXX
// XXX - DO WE DELETE ALL ENTRIES APART FROM THE ONES WHICH OTHER LISTS DEPEND ON? XXX
// XXX    THEN UPDATE THE PROCESS TO KEEP LOOKING IN DELETED LSITS FOR POSIBLE DEPENDENCIES? XXX
// XXX - PEROSONALLY PREFER THE FIRST VARIATION
on workListHousekeeping 
   local tWorkListID, tStandalonesInUse, tTestStackFiles, tTestInstructionFiles, tTestInstrumentsFolders, tTestStandaloneFiles, tTestStandaloneFolders, tFile, tWorkListsBeingRemoved, tFileDataLine, tWorkListPointer, tStackName, tInstructionsName, tStandaloneName, tExtensions, tListOfExtensions
   put empty into tWorkListsBeingRemoved
   put empty into tStandalonesInUse
   
   // Get the possible standalone extensions.
   put the cTestExecutableExtension of stack "quality" into tExtensions
   put tExtensions into tListOfExtensions
   combine tListOfExtensions using return
   filter tListOfExtensions without empty
   
   repeat for each line tWorkListID in the keys of gWorkList
      
      // Test for any work lists that are being removed.
      if gWorkList[tWorkListID]["Status"] is "worklist removing" then
         put tWorkListID & comma after tWorkListsBeingRemoved
      end if
      
      // See if we have been requested to suspend a work list list.
      if gWorkList[tWorkListID]["Status"] is "worklist suspending" then
         workListSuspended tWorkListID
      end if
      
      // See if we can run any diff comparison tests.
      if gWorkList[tWorkListID]["Status"] is "worklist started" then
         dispatch "workListProcessDiffs" to card "qualityEvalDiff" of stack "quality" with gWorkList, tWorkListID
      end if
      
      // See if a work list has completed all of the tests.
      if gWorkList[tWorkListID]["Status"] is "worklist started" then
         workListFinished tWorkListID
      end if
            
      // Find out what standalones are still in use.
      if gWorkList[tWorkListID]["Status"] is "worklist suspending" or \
            gWorkList[tWorkListID]["Status"] is "worklist started" or \
            gWorkList[tWorkListID]["Status"] is "worklist suspended" then
         repeat for each line tTest in the keys of gWorkList[tWorkListID]
            // Make sure that test entries that were created with bad test files are marked accordingly.
            if "Complete" is among the keys of gWorkList[tWorkListID][tTest] and \
                  "StackID" is among the keys of gWorkList[tWorkListID][tTest] then
               delete variable gWorkList[tWorkListID][tTest]["StackID"]
            end if
            if "StackID" is among the keys of gWorkList[tWorkListID][tTest] and \
                  gWorkList[tWorkListID][tTest]["StackID"] is not among the lines of tStandalonesInUse then
               put tWorkListID & comma & tTest & return after tStandalonesInUse
               //put gWorkList[tWorkListID][tTest]["StackID"] & return after tStandalonesInUse
            end if
         end repeat
      end if     
   end repeat
   
   // Get the list of all standalone and stack files from the filesystem.
   put listFiles (the cLiveCodeTestStacks of stack "quality", empty) into tTestStackFiles
   put listFiles (the cLiveCodeTestInstructions of stack "quality", empty) into tTestInstructionFiles
   put listFiles (the cLiveCodeTestStandalones of stack "quality", empty) into tTestStandaloneFiles
   put listFolders (the cLiveCodeTestStandalones of stack "quality", empty) into tTestStandaloneFolders
   filter tTestStandaloneFolders without "."
   filter tTestStandaloneFolders without ".."
   //replace the cLiveCodeTestStandalones of stack "quality" with empty in tTestStandaloneFiles
   
   // Filter out the files that are not in use anymore.
   repeat for each line tWorkListPointer in tStandalonesInUse
      set the itemDelimiter to comma
      put getStackName (item 1 of tWorkListPointer, item 2 of tWorkListPointer) into tStackName
      put getInstructionsName (item 1 of tWorkListPointer, item 2 of tWorkListPointer) into tInstructionsName
      put getExecutableName (item 1 of tWorkListPointer, item 2 of tWorkListPointer) into tStandaloneName
      set the itemDelimiter to slash
      filter tTestStackFiles without item -1 of tStackName
      filter tTestInstructionFiles without item -1 of tInstructionsName
      filter tTestStandaloneFiles without item -1 of tStandaloneName
      filter tTestStandaloneFolders without item -1 of tStandaloneName
   end repeat
   
   set the itemDelimiter to "."
   // Delete all intermediate stack files that were needed for testing.
   repeat for each line tFile in tTestStackFiles
      if "." & item -1 of tFile is the cLiveCodeExtension of stack "quality" then
         delete file the cLiveCodeTestStacks of stack "quality" & item 1 to -2 of tFile & the cLiveCodeExtension of stack "quality"
      end if
   end repeat
   
   // Delete all intermediate instruction files that were needed for testing.
   repeat for each line tFile in tTestInstructionFiles
      if "." & item -1 of tFile is the cLiveCodeTestInstructionsExtension of stack "quality" then
         delete file the cLiveCodeTestInstructions of stack "quality" & item 1 to -2 of tFile & the cLiveCodeTestInstructionsExtension of stack "quality"
      end if
   end repeat
   
   // Delete all intermediate standalone files that were needed for testing.
   repeat for each line tFile in tTestStandaloneFiles
      if "." & item -1 of tFile is among the lines of tListOfExtensions then
         delete file the cLiveCodeTestStandalones of stack "quality" & tFile
      end if
   end repeat
   
   local tTestFolder
   // Delete all intermediate standalone folders that were needed for testing.
   repeat for each line tFile in tTestStandaloneFolders
      put the cLiveCodeTestStandalones of stack "quality" & item 1 to -2 of tFile & tExtensions["iOS"] into tTestFolder
      if there is a folder tTestFolder then
         if the cLiveCodeTestStandalones of stack "quality" is not empty and item 1 to -2 of tFile is not empty and tExtensions["iOS"] is not empty then
            revDeleteFolder the cLiveCodeTestStandalones of stack "quality" & item 1 to -2 of tFile & tExtensions["iOS"]
         end if
      end if
   end repeat
   
   // Delete all instruments files that are generated.
   put listFolders (the cLiveCodeTestInstruments of stack "quality", "instrumentscl*.trace") into tTestInstrumentsFolders
   repeat for each line tFile in tTestInstrumentsFolders
      if the cLiveCodeTestInstruments of stack "quality" is not empty and tFile is not empty then
         revDeleteFolder the cLiveCodeTestInstruments of stack "quality" & tFile
      end if
   end repeat
   
   // If work lists are being removed, then we can set them to removed now.
   // Housekeeping should have removed all temporary files at this point.
   if tWorkListsBeingRemoved is not empty then
      put char 1 to -2 of tWorkListsBeingRemoved into tWorkListsBeingRemoved
      repeat for each item tWorkListID in tWorkListsBeingRemoved
         // Set the status to "removed".
         put "worklist removed" into gWorkList[tWorkListID]["Status"]
         // Dispatch an update to the appropriate message handler.
         dispatch "qualityHandleWorkListMessage" to gWorkList[tWorkListID]["CallbackID"] with "worklist removed" & comma & tWorkListID
      end repeat
   end if
end workListHousekeeping

// Try to suspend a work list by ensuring that all test flags have no more tests running.
on workListSuspended pWorkListID
   local tTest, tKey, tTestIsRunning, tIpsum
   put false into tTestIsRunning
   // See if we can find any running tests.
   repeat for each line tTest in the keys of gWorkList[pWorkListID]
      if tTest is a number and "TestResults" is among the keys of gWorkList[pWorkListID][tTest] then
         repeat for each line tKey in the keys of gWorkList[pWorkListID][tTest]["TestResults"]
            if gWorkList[pWorkListID][tTest]["TestResults"][tKey]["Status"] is "pending" then
               put true into tTestIsRunning
               exit repeat
            end if
         end repeat
         if tTestIsRunning is true then exit repeat
      end if
   end repeat         
   
   // If there are no more tests running, then update the UI with that information.
   if tTestIsRunning is false then
      // Set the status to "suspended".
      put "worklist suspended" into gWorkList[pWorkListID]["Status"]
      // Dispatch an update to the appropriate message handler.
      dispatch "qualityHandleWorkListMessage" to gWorkList[pWorkListID]["CallbackID"] with "worklist suspended" & comma & pWorkListID
   end if
end workListSuspended

// Try to finish a work list by ensuring that all test flags indicate that all tests have been run.
on workListFinished pWorkListID
   local tTest, tKey, tTestIsRunning
   put false into tTestIsRunning
   // See if we can find any incomplete tests.
   repeat for each line tTest in the keys of gWorkList[pWorkListID]
      if tTest is a number then
         if "Complete" is not among the keys of gWorkList[pWorkListID][tTest] then
            put true into tTestIsRunning
            exit repeat
         end if
      end if
   end repeat         
   
   // If there are no more tests running, then update the UI with that information.
   if tTestIsRunning is false then
      // Set the status to "finished".
      put "worklist finished" into gWorkList[pWorkListID]["Status"]
      // Ensure that the test loop does not run again.
      put false into gWorkListRunning      
      // Dispatch an update to the appropriate message handler.
      dispatch "qualityHandleWorkListMessage" to gWorkList[pWorkListID]["CallbackID"] with "worklist finished" & comma & pWorkListID
   end if
end workListFinished

////////////////////////////////////////////////////////////////////////////////////////////////////
// Work List Test Processing
////////////////////////////////////////////////////////////////////////////////////////////////////

// Check if we have tests that are returning results to us.
// We also dispatch a message to the UI with "worklist changed" from here.
// WE KEEP THE [WorkListID][TestIndexID]["StackID"] WHEN [WorkListID][TestIndexID]["TestResults"][SubTestIndexID]["Status"] IS ONE OF HE FOLLOWING:
// - not started
// - pending
// WE MAY KEEP THE [WorkListID][TestIndexID]["StackID"] WHEN [WorkListID][TestIndexID]["TestResults"][SubTestIndexID]["Status"] IS :
// - complete
// - failed
// DEPENDS ON THE VALUE OF the cKeepPassData and cKeepFailData of stack "quality" -> SET TO TRUE


// Try to get results from running tests and update the work list accordingly.
// This also returns a list of idle platforms. Idle platforms can be found in work lists that are "started"
// and are characterised by platforms that have either "complete" or "failed" in their status or
// no "TestResults" entry associated with them.
on workListGetTestResults @rWorkListTestsToBuild
   local tTestsRunning, tTest, tWorkListID, tSubTest, tFinished
   local rWorkListTestsToRun, rWorkListTestsRunning
   
   // Find out if we have tests we can start and what ones need new standalones.
   workListFindTestsToRun rWorkListTestsToBuild, rWorkListTestsToRun, rWorkListTestsRunning
   
   // Start tests that are in rWorkListTestsToRun.
   workListStartTests rWorkListTestsToRun, rWorkListTestsRunning
   
   // Evaluate the tests in rWorkListTestsRunning.
   workListEvaluateTests rWorkListTestsRunning
   
   // Test if anything may be running.
   if rWorkListTestsToBuild is an array or rWorkListTestsToRun is an array or rWorkListTestsRunning is an array then
      return true
   else
      return false
   end if
end workListGetTestResults

// Find tests to build for particular platforms.
on workListFindTestsToRun @rWorkListTestsToBuild, @rWorkListTestsToRun, @rWorkListTestsRunning
   local tWorkListID, tIndexID, tTestID, tKey, tWorkListTestsToBuild, tResult, tStackIdInUse
   put empty into tWorkListTestsToBuild
   put empty into rWorkListTestsToRun
   put empty into rWorkListTestsRunning
   // See if we can find any running tests.
   repeat for each line tWorkListID in the keys of gWorkList
      if gWorkList[tWorkListID]["Status"] is "worklist started" then
         // Get information from running work lists.
         repeat for each line tIndexID in the keys of gWorkList[tWorkListID]
            if tIndexID is not a number then next repeat
            if "TestResults" is not among the keys of gWorkList[tWorkListID][tIndexID] and \
                  "Complete" is not among the keys of gWorkList[tWorkListID][tIndexID] then
               // Try to populate: - tests to build         
               addWorkListEntryForTestsToBuild tWorkListTestsToBuild, tWorkListID, tIndexID
            else
               if "StackID" is among the keys of gWorkList[tWorkListID][tIndexID] then
                  put false into tStackIdInUse
                  repeat for each line tTestID in the keys of gWorkList[tWorkListID][tIndexID]["TestResults"]
                     if gWorkList[tWorkListID][tIndexID]["TestResults"][tTestID]["Status"] is "pending" then
                        put true into tStackIdInUse
                        // Try to populate: - tests running
                        addWorkListEntryForExistingTests rWorkListTestsRunning, tWorkListID, tIndexID, tTestID
                     else if gWorkList[tWorkListID][tIndexID]["TestResults"][tTestID]["Status"] is "not started" then
                        put true into tStackIdInUse
                        // Try to populate: - tests to run 
                        addWorkListEntryForExistingTests rWorkListTestsToRun, tWorkListID, tIndexID, tTestID
                     else if the cKeepPassData of stack "quality" is true and gWorkList[tWorkListID][tIndexID]["TestResults"][tTestID]["Status"] is "complete" then
                        put true into tStackIdInUse
                     else if the cKeepPassData of stack "quality" is true and gWorkList[tWorkListID][tIndexID]["TestResults"][tTestID]["Status"] is "skipped" then
                        put true into tStackIdInUse
                     else if the cKeepFailData of stack "quality" is true and gWorkList[tWorkListID][tIndexID]["TestResults"][tTestID]["Status"] begins with "failed" then
                        put true into tStackIdInUse
                     end if
                  end repeat
                  // Remove the StackID entry after all the tests it includes for a particular index have been completed.
                  if tStackIdInUse is false then
                     delete variable gWorkList[tWorkListID][tIndexID]["StackID"]
                     put empty into gWorkList[tWorkListID][tIndexID]["Complete"]
                  end if
               end if
            end if
         end repeat
      else if gWorkList[tWorkListID]["Status"] is "worklist suspending" then
         // Get information from worklists that are suspendiing.
         repeat for each line tIndexID in the keys of gWorkList[tWorkListID]
            if tIndexID is not a number then next repeat
            if "StackID" is among the keys of gWorkList[tWorkListID][tIndexID] and \
                  "TestResults" is among the keys of gWorkList[tWorkListID][tIndexID] then
               repeat for each line tTestID in the keys of gWorkList[tWorkListID][tIndexID]["TestResults"]
                  if gWorkList[tWorkListID][tIndexID]["TestResults"][tTestID]["Status"] is "pending" then
                     // Try to populate: - tests running
                     addWorkListEntryForExistingTests rWorkListTestsRunning, tWorkListID, tIndexID, tTestID
                  end if
               end repeat
            end if
         end repeat
      end if
   end repeat
   // Check that we are not building a new standalone for a device that still has tests to run.
   repeat for each line tKey in the keys of tWorkListTestsToBuild
      if tKey is not among the keys of rWorkListTestsToRun and tKey is not among the keys of rWorkListTestsRunning then
         put tWorkListTestsToBuild[tKey] into rWorkListTestsToBuild[tKey]
      end if
   end repeat
   // Check that we are not stating too many tests for a particular platform
   repeat for each line tKey in the keys of rWorkListTestsRunning
      if the number of lines in rWorkListTestsRunning[tKey] > the cMaxParallelTasks of stack "quality" and \
            tKey is among the lines of the keys of rWorkListTestsToRun then
         delete variable rWorkListTestsToRun[tKey]
      end if
      put line 1 of rWorkListTestsRunning[tKey] into rWorkListTestsRunning[tKey]
   end repeat
   repeat for each line tKey in the keys of rWorkListTestsToRun
      put line 1 of rWorkListTestsToRun[tKey] into rWorkListTestsToRun[tKey]
   end repeat
end workListFindTestsToRun

on addWorkListEntryForTestsToBuild @rListToUpdate, pWorkListID, pIndexID
   if rListToUpdate is not an array or gWorkList[pWorkListID][pIndexID]["PlatformGroupID"] is not among the keys of rListToUpdate then
      put pWorkListId & comma & pIndexID into rListToUpdate[gWorkList[pWorkListID][pIndexID]["PlatformGroupID"]]
   end if
end addWorkListEntryForTestsToBuild

on addWorkListEntryForExistingTests @rListToUpdate, pWorkListID, pIndexID, pTestID
   //if rListToUpdate is not an array or gWorkList[pWorkListID][pIndexID]["PlatformGroupID"] is not among the keys of rListToUpdate then
   //put pWorkListId & comma & pIndexID & comma & pTestID into rListToUpdate[gWorkList[pWorkListID][pIndexID]["PlatformGroupID"]]
   //end if
   put pWorkListId & comma & pIndexID & comma & pTestID & return after rListToUpdate[gWorkList[pWorkListID][pIndexID]["PlatformGroupID"]]
end addWorkListEntryForExistingTests

// Try to start new tests.
on workListStartTests @rWorkListTestsToRun, @rWorkListTestsRunning
   local tKey
   if rWorkListTestsToRun is an array then
      repeat for each line tKey in the keys of rWorkListTestsToRun
         if tKey is "Desktop" then dispatch function "runTestInstructions" to card "qualityRunTestsDesktop" of stack "quality" with gWorkList, item 1 of rWorkListTestsToRun[tKey], item 2 of rWorkListTestsToRun[tKey], item 3 to -1 of rWorkListTestsToRun[tKey]
         if tKey is "iOS" then dispatch function "runTestInstructions" to card "qualityRunTestsIos" of stack "quality" with gWorkList, item 1 of rWorkListTestsToRun[tKey], item 2 of rWorkListTestsToRun[tKey], item 3 to -1 of rWorkListTestsToRun[tKey]
         if tKey is "Android" then dispatch function "runTestInstructions" to card "qualityRunTestsAndroid" of stack "quality" with gWorkList, item 1 of rWorkListTestsToRun[tKey], item 2 of rWorkListTestsToRun[tKey], item 3 to -1 of rWorkListTestsToRun[tKey]
         put rWorkListTestsToRun[tKey] into rWorkListTestsRunning[tKey]
      end repeat
      put empty into rWorkListTestsToRun
   end if
end workListStartTests

on workListEvaluateTests @rWorkListTestsRunning
   local tKey
   repeat for each line tKey in the keys of rWorkListTestsRunning
      // If we are in timing mode, then test evaluation on desktop is executed by the relevant run instructions.
      if the cTimingMode of stack "quality" is false then
         if tKey is "Desktop" then dispatch function "evaluateTest" to card "qualityRunTestsDesktop" of stack "quality" with gWorkList, item 1 of rWorkListTestsRunning[tKey], item 2 of rWorkListTestsRunning[tKey], item 3 to -1 of rWorkListTestsRunning[tKey]
      end if
      if tKey is "iOS" then dispatch function "evaluateTest" to card "qualityRunTestsIos" of stack "quality" with gWorkList, item 1 of rWorkListTestsRunning[tKey], item 2 of rWorkListTestsRunning[tKey], item 3 to -1 of rWorkListTestsRunning[tKey]
      if tKey is "Android" then dispatch function "evaluateTest" to card "qualityRunTestsAndroid" of stack "quality" with gWorkList, item 1 of rWorkListTestsRunning[tKey], item 2 of rWorkListTestsRunning[tKey], item 3 to -1 of rWorkListTestsRunning[tKey]
   end repeat
end workListEvaluateTests

// Assess if a particular test can be run on the system configuration that is available.
//--------------------------------------------------------------------
// The meta data that specifies under what conditions a test can run.
// Tokens are: OS, DEV, LC
// Operators are: OR, AND, NOT, (, )
// Tokens are followed by the syntax that is as follows:
// OS ->MacOS|Linux|Win32|Android|iOS [version]
// DEV -> sim|dev
// LC -> is|<|> version number  
// The logic between each line is OR.
on workListEvalSupport pWorkListID, pIndexID, pTestID, pSupportEnv
   local tPlatform, tVersion, tSupportedOs, tReplaceString, tResult
   
   // If support information is not specified then we assume that the test can run.
   if pSupportEnv is empty then return true
   
   put "MacOS,Win32,Linux,iPhone,iPad,Android" into tSupportedOs
   
   // Get information about the environment on which the test is to run.
   put gWorkList[pWorkListID][pIndexID]["PlatformID"] into tPlatform
   qualityGetVersionLabel gWorkList[pWorkListID][pIndexID]["VersionID"]
   put the result into tVersion
   replace "(" with "" in tVersion
   replace ")" with "" in tVersion
   replace "LiveCode" with "" in tVersion
   
   // Find out what platform the test is to run on
   repeat for each item tReplaceString in tSupportedOs
      if tReplaceString is among the words of tPlatform then
         replace "OS" && tReplaceString with "true" in pSupportEnv
      end if
   end repeat
   
   // Substitute the OS information in the logic expression.
   put "OS" && tPlatform into tReplaceString
   replace tReplaceString with "true" in pSupportEnv
   
   repeat for each item tReplaceString in tSupportedOs
      replace "OS" && tReplaceString with "false" in pSupportEnv
   end repeat
   
   // Substitute the LC version information in the logic expression.
   constructSupportLogic pSupportEnv, tVersion
   
   // Evaluate the expression.
   do "put" && pSupportEnv && "into tResult"
   if tResult is "true" then
      return true
   else
      return false
   end if
end workListEvalSupport

// Convert the metada logic into logic that native LC can process.
// ----------------------------------------------------
// The meta data that specifies under what conditions a test can run.
// Tokens are: OS, DEV, LC
// Operators are: OR, AND, NOT, (, )
// Tokens are followed by the syntax that is as follows:
// OS ->MacOS|Linux|Win32|Android|iOS [version]
// DEV -> sim|dev
// LC -> is|<|> version number  
// The logic between each line is OR.
command constructSupportLogic @rSyntax, pLcTestVersion
   local tIndex, tBegin, tEnd, tSyntax, tNewSyntax, tLcVersionInfoOld, tLcVersionInfoNew
   if rSyntax is empty then exit constructSupportLogic
   
   put 0 into tBegin
   put 0 into tEnd
   put rSyntax into tSyntax
   
   // Get a representation of the LC version we are to test against.
   getLcVersionKey pLcTestVersion
   
   // Add some space so that we can parse the string.
   set the itemDelimiter to space
   replace "LC" with " LC " in tSyntax
   replace "(" with " ( " in tSyntax
   replace ")" with " ) " in tSyntax
   replace "  " with space in tSyntax
   
   put tSyntax into tNewSyntax
   
   // Get the begin and end pointers to LC version information.
   repeat with tIndex = 1 to the number of items in tSyntax
      
      if item tIndex of tSyntax is "LC" then
         put tIndex into tBegin
         next repeat
      end if
      if tBegin is not 0 then
         if item tIndex of tSyntax is among the items "OR AND )" then
            put tIndex-1 into tEnd
         else if tIndex is the number of items in tSyntax then
            put tIndex into tEnd
         else
            next repeat
         end if
      else
         next repeat
      end if
      
      // Get a copy of the LC version information.
      put item tBegin to tEnd of tSyntax into tLcVersionInfoOld
      put tLcVersionInfoOld into tLcVersionInfoNew
      getLcVersionKey tLcVersionInfoNew
      replace "LC" with pLcTestVersion in tLcVersionInfoNew
      put 0 into tBegin
      put 0 into tEnd
            
      // Update the syntax with the appropriate LC information.
      replace tLcVersionInfoOld with tLcVersionInfoNew in tNewSyntax
      
   end repeat

   // Update the output information
   put tNewSyntax into rSyntax

end constructSupportLogic

// Convert a LiveCode version into a real number that can be compared.
command getLcVersionKey @rLcVersion
   local tLcVersionTemp
   
   put empty into tLcVersionTemp
   
   repeat while tLcVersionTemp is not rLcVersion
      
      put rLcVersion into tLcVersionTemp
      // Tidy up the string so we can process it.
      
      if rLcVersion ends with "." then
         put char 1 to -2 of rLcVersion into rLcVersion
      end if
      
      // Ensure that we have appropriate DP, RC or GM information present.
      if not (rLcVersion contains "DP" or rLcVersion contains "RC" or rLcVersion contains "GM") then
         put "GM1" after rLcVersion
      end if
      
      // Ensure we remove any hyphens, spaces and full stops that are not needed.
      replace "-DP" with "DP" in rLcVersion
      replace "DP-" with "DP" in rLcVersion
      replace "-RC" with "RC" in rLcVersion
      replace "RC-" with "RC" in rLcVersion
      replace "-GM" with "GM" in rLcVersion
      replace "GM-" with "GM" in rLcVersion
      
      set the itemDelimiter to "."
      if the number of items in rLcVersion is 2 then
         replace "DP" with ".0DP" in rLcVersion
         replace "RC" with ".0RC" in rLcVersion
         replace "GM" with ".0GM" in rLcVersion
      end if
      
   end repeat
   
   replace "." with "" in rLcVersion
   replace " " with "" in rLcVersion
   replace "LC" with "LC " in rLcVersion
   replace "is" with " is " in rLcVersion
   replace "<" with " < " in rLcVersion
   replace ">" with " > " in rLcVersion
   
   // Replace the LiveCode version with an number that allows numerical comparison.
   // DP -> 2  RC -> 3  GM -> 8
   replace "DP" with ".2" in rLcVersion
   replace "RC" with ".3" in rLcVersion
   replace "GM" with ".8" in rLcVersion   
end getLcVersionKey
