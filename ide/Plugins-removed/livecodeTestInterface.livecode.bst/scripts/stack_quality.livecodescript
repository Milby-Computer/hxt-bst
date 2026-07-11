Script "stack_quality"

/*
# Name: stack "quality" of stack "livecodeTestInterface"
# ID: stack "quality" of stack "livecodeTestInterface"
# Hash: j+ZpCz5s9pIWEN3fd+YUZQ==
*/


// Test Framework set up
// ------------------

// Reset any default custom property information.

on qualityReset
   dispatch "workListInitialise" to card "qualityWorkList" of stack "quality"
   dispatch "androidInitialise" to card "qualityRunTestsAndroid" of stack "quality"
   dispatch "iosInitialise" to card "qualityRunTestsIos" of stack "quality"
   dispatch "gitInitialize" to card "qualityGitHubInteraction" of stack "quality"
end qualityReset

on qualityInitialise
   local tExtensions
   
   // Reset all past run data
   qualityReset
   
   // Data not to be changed via configuration.
   set the cRevExtension of stack "quality" to ".rev"                                 -- The file extension of Revolution stacks.
   set the cLiveCodeExtension of stack "quality" to ".livecode"                  -- The file extension of LiveCode stacks.
   set the cLiveCodeTestExtension of stack "quality" to ".lct"                    -- The file extension of LiveCode script files.
   set the cLiveCodeCacheExtension of stack "quality" to ".lcc"                 -- The file extension of cache files that are used by the test framework.
   set the cLiveCodeTestDbExtension of stack "quality" to ".db.livecode"  -- The file extension of LiveCode database files that are used to store result data between tests.
   set the cLiveCodeDiffResultsStack of stack "quality" to "qualityeval"      -- The LiveCode stack that contains the code to process the differencing databases and store the results.
   set the cLiveCodeTestInstructionsExtension of stack "quality" to ".lci"   -- The file extension of instruction files that the test framework uses in order to instruct what test have to be executed.
   set the cLiveCodeDeviceDataCacheExtension of stack "quality" to ".txt" -- The file extension of intermediate text files that are used to pass test instructions and test results between hosts and devices.
   set the cLiveCodeDeviceJavaScriptExtension of stack "quality" to ".js"    -- The file extension of intermediate java script files that are used to guilde the instruments process of iOS.
   
   // Set up the file name extensions for the executables on the paticular platforms.
   put ".app" into tExtensions["MacOS"]
   put ".exe" into tExtensions["Win32"]
   put ".x86" into tExtensions["Linux"]
   put ".apk" into tExtensions["Android"]
   put ".app" into tExtensions["iOS"]
   put "" into tExtensions["Desktop"]
   set the cTestExecutableExtension of stack "quality" to tExtensions
   
   // Set up default data.
   set the cTestCache of stack "quality" to rootPath () & "_cache" & slash      -- The top level location in which test administration files are managed.
   set the cFruitStrap of stack "quality" to rootPath () & "_fruitstrap" & slash   -- The location where fruitstrap lives.
   set the cLiveCodeTestDbFolder of stack "quality" to rootPath () & "_lctestdb" & slash  -- The location where LiveCode test comparison files are stored.
   set the cAutomationTemplate of stack "quality" to empty                         -- The location of the automation template in XCode.
   set the cKeepPassData of stack "quality" to false                                    -- By default don't keep any intermediate testing files for passed tests.
   set the cKeepFailData of stack "quality" to false                                      -- By default don't keep any intermediate testing files for failed tests.
   set the cExecutionLimit of stack "quality" to 20                                        -- The execution timeout limit that applies to tests.
   set the cShowTest of stack "quality" to true                                            -- Flag that specifies if the stack with the test on it to be opened before tests are run.
   set the cTestStackName of stack "quality" to "exec-tests"                         -- The default file name prefix for automatically generated test files.
   set the cAndroidPackageName of stack "quality" to "com.yourcompany.yourapp" -- The android package name.
   set the cMaxParallelTasks of stack "quality" to 10                                     -- The number of processes that are to run in parallel.
   set the cTimingMode of stack "quality" to false                                        -- Flag for the timing mode.
   set the cTimingDelay of stack "quality" to 1000                                       -- The timing delay used in timing mode.
   set the cRecursionListDepth of stack "quality" to 5                                 -- The recursion search depth for recursively explored directory structures.
end qualityInitialise

// Provides the configuration information to the test framework.
// - The tokens are:
//          “ScriptTestFolder”    - a comma delimited list of the script test files.
//          "FruitStrap"              - the location of FruitStrap
//          “XCode”                   - a comma delimited list of xCode installations to use.
//          "TestCache"             - the temporary location that the test framework uses to run its tests.
//          “AndroidSDK”          - the location of the android SDK.
//          “StackTestFolder”    - a comma delimited list of the stack test files.
//          "KeepResources"     - the result statuses for which to keep intermediate data. Don't set this or use a combination of: passed, failed
on qualityConfigure pToken, pValue
   local tSupportedTokens, tInternalToken, tCaseSensitive
   // GitHub - The GitHub location
   // XCode - The XCode location
   // LiveCodeInstallFolder - The installation location of LiveCode versions
   // TestFolder - A nested directory structure in which test scripts and stacks are stored
   // StackTestFolder - A unique directory in which test stacks are stored
   // ScriptTestFolder - A unique directory in which test scripts are stored
   // AndroidSDK - The Android sdk that is to be used
   // TestCache - The location in which the test framework maintains its processing files
   // FruitStrap - The location of the fruit strap installation
   // KeepResources
   // ExecutionLimit
   // AutomationTemplate - The XCode automation template location that is used to run test on iOS devices
   // ResourceStacks - A directory of resource stacks that are loaded into the test standalone at a substack level
   // LiveCodeTestDbFolder - The location in which the LiveCode Database files are stored
   put "GitHub,XCode,LiveCodeInstallFolder,TestFolder,StackTestFolder,ScriptTestFolder,AndroidSDK,TestCache,FruitStrap,KeepResources,ExecutionLimit,AutomationTemplate,ResourceStacks,LiveCodeTestDbFolder" into tSupportedTokens
   put the caseSensitive into tCaseSensitive
   set the caseSensitive to true
   
   if pToken is not among the items of tSupportedTokens then exit qualityConfigure
   put "c" & pToken into tInternalToken
   set the tInternalToken of stack "quality" to pValue
   
   if pToken is "TestCache" then
      // More data not to be changed via configuration.
      set the cLiveCodeTestStacks of stack "quality" to the cTestCache of stack "quality" & "stacks" & slash                                -- The location in which the LiveCode stacks are built before being converted into standalones.
      set the cLiveCodeTestInstructions of stack "quality" to the cTestCache of stack "quality" & "instructions" & slash                 -- The location in which the test instructions are stored.
      set the cLiveCodeTestInstruments of stack "quality" to the cTestCache of stack "quality" & "instruments" & slash                -- The location to which instruments data is written.
      set the cLiveCodeTestStandalones of stack "quality" to the cTestCache of stack "quality" & "standalones" & slash               -- The location in which standalone files are built.
      set the cLiveCodeTestDeviceDataCache of stack "quality" to the cTestCache of stack "quality" & "devicedatacache" & slash -- The location in which intermediate test files for data transfer between hosts and devices are kept.
      set the cLiveCodeTestGitHubCache of stack "quality" to the cTestCache of stack "quality" & "githubcache" & slash              -- The location in which intermediate github to engine mapped files are kept.
      set the cLiveCodeTestStackCache of stack "quality" to the cTestCache of stack "quality" & "assertstacks" & slash                -- The location in which intermediate LiveCode stacks are kept that have had their code assert substituted.
      
      // Ensure the selected directories are present.
      createAllFolders the cLiveCodeTestStacks of stack "quality"
      createAllFolders the cLiveCodeTestInstructions of stack "quality"
      createAllFolders the cLiveCodeTestInstruments of stack "quality"
      createAllFolders the cLiveCodeTestStandalones of stack "quality"
      createAllFolders the cLiveCodeTestDeviceDataCache of stack "quality"
      createAllFolders the cLiveCodeTestGitHubCache of stack "quality"
   end if
   
   set the caseSensitive to tCaseSensitive
end qualityConfigure

// Test Case Managemet
// ------------------

// Returns a list of ids for all of the tests that can be found.
on qualityListTests
   local tTests, tFoundTests, tLine, tPath, tFoundFiles, tTempFoundTests
   put empty into tTests
   
   // Get the ids for all tests in a recursive fashion.
   repeat for each item tPath in the cTestFolder of stack "quality"      
      listFilesRecursive tFoundFiles, tPath, empty, the cRecursionListDepth of stack "quality"
      put tFoundFiles into tTempFoundTests
      filter tTempFoundTests with "*" & the cRevExtension of stack "quality"
      if tTempFoundTests is not empty then put tTempFoundTests after tTests ["Tests"]
      put tFoundFiles into tTempFoundTests
      filter tTempFoundTests with "*" & the cLiveCodeExtension of stack "quality"
      if tTempFoundTests is not empty then put tTempFoundTests after tTests ["Tests"]
      put tFoundFiles into tTempFoundTests
      filter tTempFoundTests with "*" & the cLiveCodeTestExtension of stack "quality"
      if tTempFoundTests is not empty then put tTempFoundTests after tTests ["Tests"]
   end repeat
   
   // Get the ids for the stack files.
   repeat for each item tPath in the cStackTestFolder of stack "quality"
      if there is a folder tPath then
         put listFiles (tPath, "*" & the cRevExtension of stack "quality") into tFoundTests
         put listFiles (tPath, "*" & the cLiveCodeExtension of stack "quality") after tFoundTests
         repeat for each line tLine in tFoundTests
            put tPath & tLine & return after tTests ["Stacks"]
         end repeat
      end if
   end repeat
   
   // Get the ids for the script files.
   repeat for each item tPath in the cScriptTestFolder of stack "quality"
      if there is a folder tPath then
         put listFiles (tPath, "*" & the cLiveCodeTestExtension of stack "quality") into tFoundTests
         repeat for each line tLine in tFoundTests
            put tPath & tLine & return after tTests ["Scripts"]
         end repeat
      end if
   end repeat
   
   return tTests
end qualityListTests

// Returns the label of a particular test (for human readability).
on qualityGetTestLabel pID
   local tTo, tFileName
   //if the platform is "win32" then 
      //set the itemDelimiter to backslash
   //else
      set the itemDelimiter to slash
   //end if
   put item -1 of pID into tFileName
   put offset (the cRevExtension of stack "quality", tFileName) into tTo
   if tTo is not 0 then return char 1 to (tTo-1) of tFileName
   put offset (the cLiveCodeExtension of stack "quality", tFileName) into tTo
   if tTo is not 0 then return char 1 to (tTo-1) of tFileName
   put offset (the cLiveCodeTestExtension of stack "quality", tFileName) into tTo
   if tTo is not 0 then return char 1 to (tTo-1) of tFileName
   
   return empty   
end qualityGetTestLabel

// Returns the meta information that is stored with a test.
// We also maintain a cache here to make loading faster.
on qualityGetTestTags pID, @xCachePaths
   local rDiffDb, rFileContent
   // Read the meta data.
   get readTestFile (rFileContent, rDiffDb, xCachePaths, pID)
   
   return rFileContent
end qualityGetTestTags

on updateMetaKeys @xFileData
   local tLine, tKey, tMD5Digests
   // Get the standalone configuration settings that are relevant to each platform.
   set the itemDelimiter to comma
   put empty into tMD5Digests["ios"]
   put empty into tMD5Digests["android"]
   repeat for each line tLine in xFileData
      if word 1 of tLine is "setup" then exit repeat
      if char 2 to -1 of item 1 of tLine is among the keys of tMD5Digests then
         put tLine & return after tMD5Digests[char 2 to -1 of item 1 of tLine]
      end if
   end repeat
   
   // Process the meta data and ensure we pull out anything that is not related.
   repeat for each key tKey in tMD5Digests               
      if tMD5Digests[tKey] is not empty then
         replace space with empty in tMD5Digests[tKey]
         replace tab with empty in tMD5Digests[tKey]
         sort lines of tMD5Digests[tKey] by item 2 of each
         replace return with empty in tMD5Digests[tKey]
         put the md5Digest of tMD5Digests[tKey] into tMD5Digests[tKey]
      end if
      put tKey & "MD5" && tMD5Digests[tKey] & return before xFileData
   end repeat
   
   // Generate a UID that is specific to this test.
   put "testUID" && uuid () & return before xFileData   
end updateMetaKeys

// Returns the source code that is stored in a test.
// We also maintain a cache here to make loading faster.
on qualityGetTestSource pID
   local tFileContent, tScriptData, tLine, tLogThis
   local tPath, tCacheName, tCachePaths
   local rDiffDb
   
   // Check if we can use a cache file.
   if not (pID ends with the cLiveCodeCacheExtension of stack "quality") then
      // Break the TestID down into the path and the name of a possible cache file.
      set the itemDelimiter to slash
      put item 1 to -2 of pID & slash into tPath
      put item -1 of pID into tCacheName
      put tCacheName & the cLiveCodeCacheExtension of stack "quality" into tCacheName
      
      // See if there are any files to cache.
      getCacheFiles tCachePaths, tPath
      
      if tCacheName is among the lines of tCachePaths[tPath] then
         // We have an up to date cache.
         put tPath & tCacheName into pID
      end if   
   end if
      
   put false into tLogThis
   get readTestFile (tFileContent, rDiffDb, pID)
   if tFileContent is not empty then
      repeat for each line tLine in tFileContent
         if word 1 of tLine is "setup" then put true into tLogThis
         if tLogThis is true then put tLine & return after tScriptData
      end repeat
      if tScriptData is not empty then return tScriptData
   end if
   return empty
end qualityGetTestSource

// LiveCode Version Management
// -------------------------

// Returns a list of all LiveCode versions that are available.
on qualityListVersions
   local tListedVersions, tConfirmedVersions, tItem, tLine, tFoundEnginesPath
   if the cLiveCodeInstallFolder of stack "quality" is empty then
      return empty
   end if
   
   // Do we have something in the default installation location?
   repeat for each item tItem in the cLiveCodeInstallFolder of stack "quality"         
      if the platform is "MacOS" then
           put listFolders (tItem, "LiveCode*.app") into tListedVersions
         repeat for each line tLine in tListedVersions
            put getEnginesForLiveCode (tItem & tLine) into tFoundEnginesPath
            if tFoundEnginesPath is not empty then
               put tFoundEnginesPath & return after tConfirmedVersions
            end if
         end repeat
      else if the platform is "Win32" then
         put listFolders (tItem, "LiveCode*") into tListedVersions
         repeat for each line tLine in tListedVersions
            put getEnginesForLiveCode (tItem & tLine) into tFoundEnginesPath
            if tFoundEnginesPath is not empty then
               put tFoundEnginesPath & return after tConfirmedVersions
            end if
         end repeat
      else if the platform is "Linux" then
         put listFolders (tItem, "livecode*-*") into tListedVersions
         repeat for each line tLine in tListedVersions
            put getEnginesForLiveCode (tItem & tLine) into tFoundEnginesPath
            if tFoundEnginesPath is not empty then
               put tFoundEnginesPath & return after tConfirmedVersions
            end if
         end repeat
      end if
   end repeat
   
   // Do we have something in a git hub installation location?
   repeat for each item tItem in the cGitHub of stack "quality"
      put empty into tListedVersions
      listFilesRecursive tListedVersions, tItem, "version", the cRecursionListDepth of stack "quality"
      replace "version" with empty in tListedVersions
      repeat for each line tLine in tListedVersions
         put tLine & return after tConfirmedVersions
      end repeat
   end repeat
   return tConfirmedVersions
end qualityListVersions 

// Returns the label of a particular LiveCode version (for human readability).
on qualityGetVersionLabel pID
   local tFrom, tTo
   if the cGitHub of stack "quality" is not empty and pID begins with the cGitHub of stack "quality" then
      set the itemDelimiter to slash
      return "LiveCode GitHub -" && item -1 of pID
   end if
   put offset ("LiveCode", pID) into tFrom
   if the platform is "MacOS" then
      put offset (".app", pID, tFrom) into tTo
   else if the platform is "Win32" then
      put offset ("/Runtime", pID, tFrom) into tTo
   else if the platform is "Linux" then
      replace "livecodecommunity-" with "LiveCode Community " in pID
      replace "livecode-" with "LiveCode " in pID
      replace "-rc-" with " (rc " in pID
      replace "-dp-" with " (dp " in pID
      replace "-gm-" with " (gm " in pID
      if offset ("(", pID) > 0 then replace "/Runtime" with ")/Runtime" in pID 
      put offset ("/Runtime", pID, tFrom) into tTo
   end if
   if tFrom is 0 or tTo is 0 then
      return empty
   else
      return char tFrom to (tFrom+tTo-1) of pID
   end if
end qualityGetVersionLabel

// Platform Management
// ------------------

// Returns a list of all the platforms that are available.
on qualityListPlatforms
   local tPlatforms, tIosDevices, tListIosSyntax, tIosItem
   
   // Hook into the IDE to get the supported simulators.
   dispatch function "revIDEDeployListTargets" to stack "revDeployLibrary"
   put the result into tPlatforms
   
   // List the attached iOS devices.
   if the platform is "MacOS" then
      
      // See if we have any iPhones connected.
      put "system_profiler SPUSBDataType | sed -n -e '/iPhone/,/Serial/p' | grep" && quote & "Serial Number:" & quote && "| awk -F" && quote & ":" && quote && "'{print $2}'" into tListIosSyntax
      put shell (tListIosSyntax) into tIosDevices
      if tIosDevices is not empty then
         repeat for each line tIosItem in tIosDevices
            put "iPhone" && tiOSDevices before tPlatforms["iOS"]
         end repeat
      end if
      
      // See if we have any iPads connected.
      put "system_profiler SPUSBDataType | sed -n -e '/iPad/,/Serial/p' | grep" && quote & "Serial Number:" & quote && "| awk -F" && quote & ":" && quote && "'{print $2}'" into tListIosSyntax
      put shell (tListIosSyntax) into tIosDevices
      if tIosDevices is not empty then
         repeat for each line tiIosItem in tIosDevices
            put "iPad" && tiOSDevices before tPlatforms["iOS"]
         end repeat
      end if      
   end if
   
   // List the desktop platform.
   put the platform into tPlatforms["Desktop"]
   
   return tPlatforms
end qualityListPlatforms

// Returns the label of a particular platform (for human readability).
on qualityGetPlatformLabel pID
   return pID
end qualityGetPlatformLabel

// Get the Number of Potential Tests
// ---------------------------
// Calculates the number of tests to run before creating the work lists.
on qualityGetCount pTestIDs, pVersionIDs, pPlatformIDs
   local tTestItem, tTests
   put 0 into tTests
   filter pTestIDs without empty
   repeat for each line tTestItem in pTestIDs
      if the number of items in tTestItem is not 0 then
         add (the number of items in tTestItem) - 1 to tTests
      end if
   end repeat
   filter pVersionIDs without empty
   filter pPlatformIDs without empty
   return tTests * \
         the number of lines in pVersionIDs * \
         the number of lines in pPlatformIDs
end qualityGetCount

// Work List Interaction
// -----------------
// Reset any worklist information that may currently exist.
on qualityWorklistInitialise
   dispatch "workListInitialise" to card "qualityWorkList" of stack "quality"
end qualityWorklistInitialise

// Returns the worklist id and allows messages to be sent to pCallbackID with the following information:
// - “worklist created”, work list ID, empty
//          sent once the metadata and standalonge configuration information has been processed to provide grouping information.
// - “worklist started”, work list ID, empty
//          sent once the work list processing has started after calling “qualityWorklistStart”.
// - “worklist finished”, work list ID, empty
//          sent once the work list has completed all of the tests.
// - “worklist suspended”, work list ID, empty
//          sent once the work list has been stopped with “qualityWorklistStop”.
// - “worklist removed”, work list ID, empty
//          sent once the work list has been destroyed with “qualityWorklistDestroy”.
// - “worklist changed”, work list ID, list of indexes
//          sent once an update is made to one of the work list entries.
on qualityWorklistCreate pTestIDs, pVersionIDs, pPlatformIDs, pCallbackID
   dispatch function "workListCreate" to card "qualityWorkList" of stack "quality" with pTestIDs, pVersionIDs, pPlatformIDs, pCallbackID
   return the result
end qualityWorklistCreate

// Starts processing the work lists.
on qualityWorklistStart pWorkListIDs
   dispatch function "workListStart" to card "qualityWorkList" of stack "quality" with pWorkListIDs
   return the result
end qualityWorklistStart

// Stops processing the work lists.
on qualityWorklistStop pWorkListIDs
   dispatch function "workListStop" to card "qualityWorkList" of stack "quality" with pWorkListIDs
   return the result
end qualityWorklistStop

// Destroys work lists that are currently being processed in some form or another.
on qualityWorklistDestroy pWorkListIDs
   dispatch function "workListDestroy" to card "qualityWorkList" of stack "quality" with pWorkListIDs
   return the result
end qualityWorklistDestroy

// Sorts the worklist entries by order of the pSortKey pairs:
// - A sort key pair consists of the key to sort by and the direction of the sort: "+|-"
on qualityWorklistSort pWorkListIDs, pSortKeys
   dispatch function "workListSort" to card "qualityWorkList" of stack "quality" with pWorkListIDs, pSortKeys
   return the result
end qualityWorklistSort

// Returns the number of tests in a work list.
on qualityWorklistGetCount pWorkListIDs
   dispatch function "workListGetCount" to card "qualityWorkList" of stack "quality" with pWorkListIDs
   return the result
end qualityWorklistGetCount

// Returns the number of test that have been processed in the work list.
on qualityWorklistGetProgress pWorklistIDs
   dispatch function "workListGetProgress" to card "qualityWorkList" of stack "quality" with pWorkListIDs
   return the result
end qualityWorklistGetProgress

// Returns an array of field entries for a given work list entry.
on qualityWorklistGetItemDetails pWorkListID, pIndexes
   dispatch function "workListGetItemDetails" to card "qualityWorkList" of stack "quality" with pWorkListID, pIndexes
   return the result
end qualityWorklistGetItemDetails
   
// Conversion Functions and Data Extraction
// ---------------------------------

// Get the information associated with a token from the test file meta data.
function readMetaData pToken, pData
   local tLine
   
   repeat for each line tLine in pData
      if word 1 of tLine is "setup" then exit repeat
      if word 1 of tLine is pToken then return word 2 to -1 of tLine
   end repeat
   return empty
end readMetaData

// Read a test file.
function readTestFile @xData, @rDiffDbs, @xCachePaths, pFileName 
   local tPath, tCacheName, tCreateCache
   
   put false into tCreateCache
   put empty into xData
   put empty into rDiffDbs
   
   // Check if we can use a cache file.
   if not (pFileName ends with the cLiveCodeCacheExtension of stack "quality") then
      // Break the TestID down into the path and the name of a possible cache file.
      set the itemDelimiter to slash
      put item 1 to -2 of pFileName & slash into tPath
      put item -1 of pFileName into tCacheName
      put tCacheName & the cLiveCodeCacheExtension of stack "quality" into tCacheName
      
      // See if there are any files to cache.
      getCacheFiles xCachePaths, tPath
      
      if tCacheName is among the lines of xCachePaths[tPath] then
         // We have an up to date cache.
         put tPath & tCacheName into pFileName
      else
         put true into tCreateCache
      end if   
   end if
   
   if pFileName ends with the cLiveCodeTestExtension of stack "quality" or pFileName ends with the cLiveCodeCacheExtension of stack "quality" then
      get readTextFile (xData, pFileName, tCreateCache)
   else if pFileName ends with the cRevExtension of stack "quality" or pFileName ends with the cLIveCodeExtension of stack "quality" then
      get readStackFile (xData, rDiffDbs, pFileName, empty)
   end if
   
   if tCreateCache is true then
      // Add the key information.
      updateMetaKeys xData
      // Save a new cache file.
      get writeTextFile (xData, tPath & tCacheName)
   end if
   
   // Make sure we get the UID for the diff db
   // replace "/uid/" with word 2 of (line 1 of xData) in rDiffDbs
   
   return true
end readTestFile

// Read the contents of a file into memory.
function readTextFile @rData, pFileName, pCreateCacheData
   local tProcessData, tLine, tTestIndex, tExpectedTeardown, tInMeta
   
   put true into tInMeta
   put 1 into tTestIndex
   put empty into rData
   put false into tExpectedTeardown
   
   // Test if there is a physical file. 
   if there is no file (pFileName) then
      logThis "File Exception:" && quote & pFileName & quote && "does not exist." & return
      return false
   end if
   
   // See if we can read content from the file.
   put url ("file:" & pFileName) into tProcessData
   
   if pCreateCacheData is true then
      repeat for each lines tLine in tProcessData
         if tLine is empty or tLine begins with "--" or tLine begins with "//" then next repeat
         
         // Copy over the meta data
         if tInMeta is true then 
            if word 1 of tLine is "setup" then
               put "setup" & return after rData
               put false into tInMeta
            else
               put tLine & return after rData
               next repeat
            end if
         end if
         
         // Copy over the rest of the data.
         if word 1 of tLine is "setup" then
            if tExpectedTeardown is true then
               logThis "Data Parse Exception:" && quote & pFileName & quote && "No matching" && quote & "setup" & quote & slash & quote & "teardown" & quote && "pair for subtest" && tTestIndex & return
            else
               put true into tExpectedTeardown
            end if
            put "subtest" & tTestIndex && "runTest_" & tTestIndex & return after rData
            add 1 to tTestIndex
         else if word 1 of tLine is "teardown" then
            put false into tExpectedTeardown
         end if
         
      end repeat
      put "teardown" & return after rData      
   else
      put tProcessData into rData
   end if
   
   return true
end readTextFile

// Write the content of memory to a file.
function writeTextFile pData, pFileName
   local tResultText
   // Open the test instructions file for writing.
   open file (pFileName) for text write
   // See if we can write to the test instructions file.
   write pData to file (pFileName)
   if the result is not empty then
      put the result into tResultText
      logThis "Text Write Exception - Could not write to file" && pFileName & ":" && tResultText & return
      return false
   end if
   // See if we can close the file.
   close file (pFileName)
   if the result is not empty then
      put the result into tResultText
      logThis "Text Write Exception - Could not close file" && pFileName & ":" && tResultText & return
      return false      
   end if
   return true
end writeTextFile

// Read the stack file and convert the content into text that can be processed
// to extract the metadata, standalone configuration data and stack script.
function readStackFile @rData, @rDiffDbs, pFileName, pDiffDbId
   local tTestMetaData, tStandaloneData, tError, tStackScript, tLine, tKey, tKey2, tAssertSubScript, tTestIndex
   
   put empty into rData
   put empty into rDiffDbs
   
   // Test if there is a physical stack file. 
   if there is no file (pFileName) then
      logThis "File Exception:" && quote & pFileName & quote && "does not exist." & return
      return false
   end if
   
   // See if we can load the stack.
   lock messages
   go invisible stack pFileName
   
   // Substitute assert statements with the appropriate LiveCode syntax.
   if pFileName begins with the cLiveCodeTestStackCache of stack "quality" then
      handleAssert tAssertSubScript, rDiffDbs, the script of stack pFileName, pFileName, pDiffDbId
      
      // Do we need to create a diff comparison engine stack?
      if rDiffDbs is not empty then
         if the number of lines of rDiffDbs > 1 then breakpoint // We should never hit this but better safe than sorry.
         // "processWrapForDiffStorage" should have ensured that the path for the new stack exists by now.
         dispatch function "buildDiffStack" to card "qualityEvalDiff" of stack "quality" with the script of stack pFileName, rDiffDbs
         //get buildDiffStack (the script of stack pFileName, rDiffDbs)
      end if
      
      set the script of stack pFileName to tAssertSubScript
      save stack pFileName
   end if
   
   unlock messages
   
   // See if we can dispatch a meta data update request to the stack we loaded.
   try
      dispatch "setMetaData" to card "meta-data" of stack pFileName
   catch tError
   end try
   
   if tError is empty then
      // See if we can read the metadata.
      put the cTestMetaData of stack pFileName into tTestMetaData
      put the customProperties ["cRevStandaloneSettings"] of stack pFileName into tStandaloneData
   else
      put empty into tTestMetaData
      put empty into tStandaloneData
   end if
   
   // See if we can get the script of the stack.
   put the script of stack pFileName after tStackScript
   
   // Remove the stack we loaded from memory.
   lock messages
   delete stack pFileName
   unlock messages
   
   // Convert the metadata into a text representation.
   if tTestMetaData is an array then
      repeat for each line tKey in the keys of tTestMetaData
         put tKey && tTestMetaData[tKey] & return after rData
      end repeat
   end if
   if tStandaloneData is an array then
      repeat for each line tKey in the keys of tStandaloneData
         if item 1 of tKey is "ios" or item 1 of tKey is "android" then
            if tStandaloneData[tKey] is an array then
               repeat for each line tKey2 in the keys of tStandaloneData[tKey]
                  put quote & tKey & quote && quote & tKey2 & quote && quote & tStandaloneData[tKey][tKey2] & quote & return after rData
               end repeat
            else
               put quote & tKey & quote && quote & tStandaloneData[tKey] & quote & return after rData
            end if
         end if
      end repeat
   end if
   
   // Ensure we know where the data came from.
   put "source stack" & return after rData
   
   // Add the stack code.
   put "setup" & return after rData
   put 1 into tTestIndex
   repeat for each line tLine in tStackScript
      if (word 1 of tLine is "on" or word 1 of tLine is "command") and word 2 of tLine begins with "test_" then 
         put "subtest" & tTestIndex&& word 2 to -1 of tLine & return after rData
         add 1 to tTestIndex
      end if
   end repeat
   put "teardown" & return after rData      
   return true
end readStackFile

// Determine if there is an up to date cache file for a .livecode, .rev or .lct file,
// or get all the up to date cache files in a directory.
on getCacheFiles @rMD5CachePaths, pPath
   local tOldFolderPath, tPathToLookIn, tFileToFilterOn, tFileData, tTempFileData, tFileDataAfterFilter, tItem, tLineCache, tLineCode, tCacheFile, tExtensionLength
      
   set the itemDelimiter to slash
   
   // Set up the data that is used to match information on the file system.
   if there is a file pPath then
      put "*" & the cLiveCodeCacheExtension of stack "quality" & "," & item -1 of pPath into tFileToFilterOn
      put item 1 to -2 of pPath into tPathToLookIn
   else
      put "*" & the cLiveCodeCacheExtension of stack "quality" & ",*" & the cLiveCodeExtension of stack "quality" & ",*" & the cRevExtension of stack "quality" & ",*" & the cLiveCodeTestExtension of stack "quality" into tFileToFilterOn
      put pPath into tPathToLookIn
   end if
   
   // Do we have to create cache information?
   if tPathToLookIn is not among the lines of the keys of rMD5CachePaths and there is a folder tPathToLookIn then
      
      // Create a space in the cache storage area.
      put empty into rMD5CachePaths[tPathToLookIn]
      
      // Read the file names.
      put the defaultFolder into tOldFolderPath
      set the defaultFolder to tPathToLookIn
      put the long files into tFileData
      
      // Filter out data as was set up for information matching.
      set the itemDelimiter to comma
      put empty into tFileDataAfterFilter
      repeat for each item tItem in tFileToFilterOn
         put tFileData into tTempFileData
         filter tTempFileData with tItem & ",*"
         if tTempFileData is not empty then
            put tTempFileData & return after tFileDataAfterFilter
         end if
      end repeat
      
      put the length of the cLiveCodeCacheExtension of stack "quality" + 1 into tExtensionLength
      
      // Eliminate any entries that are stale or for which test files do not exist.
      repeat with tLineCache = 1 to the number of lines in tFileDataAfterFilter
         if item 1 of line tLineCache of tFileDataAfterFilter ends with the cLiveCodeCachExtension of stack "quality" then
            repeat with tLineCode = tLineCache+1 to the number of lines in tFileDataAfterFilter
               if (item 1 of line tLineCode of tFileDataAfterFilter is char 1 to -tExtensionLength of item 1 of line tLineCache of tFileDataAfterFilter) and \ 
                     item 5 of line tLineCode of tFileDataAfterFilter < item 5 of line tLineCache of tFileDataAfterFilter then
                  put item 1 of line tLineCache of tFileDataAfterFilter & return after rMD5CachePaths[tPathToLookIn]
                  exit repeat
               end if
            end repeat
         else
            exit repeat
         end if
      end repeat
      
   end if
   
   // Clean up the folder pointer.
   set the defaultFolder to tOldFolderPath
      
end getCacheFiles
   
// Helpers
// ------

// Validate that a path to LiveCode includes engines.
function getEnginesForLiveCode pID
   local tEngines
   if the platform is "MacOS" then
      put pID & "/Contents/Tools/Runtime/" into tEngines
   else if the platform is "Win32" then
      put pID & "/Runtime/" into tEngines
   else if the platform is "Linux" then
      put pID & "/Runtime/" into tEngines
   end if
   if there is a folder tEngines then
      return tEngines
   else
      return empty
   end if   
end getEnginesForLiveCode

// Echo relevant information to the terminal or output field.
command logThis pMessage
   if pMessage is not empty and pMessage is not space then
      put pMessage after msg
   end if
end logThis

// Display array data.
function displayArrayData pArray, pIndent
   // Create the variable that loops through the keys in the array.
   local tKey
   if pArray is an array then
      // Print information to indicate that we are entering a new nested level of the array.
      get "ARRAY" & return
      // Print full stops that allow the reader to track the depth of an element.
      put "." after pIndent
      // Create the indentation.
      put tab after pIndent
      repeat for each key tKey in pArray
         // Call displayArrayData with a nested array.
         put format("%s[%s] => %s\n", pIndent, tKey, displayArrayData (pArray[tKey], pIndent)) after it
      end repeat
      delete the last char of it
      return it
   else
      return pArray
   end if
end displayArrayData

// Match a list of items agains another list of items with wildcard support.
function matchAnyItem pList1, pList2
   local tItem
   set the itemDelimiter to comma
   
   // Ensure that we can handle white space.
   replace space with "" in pList1
   replace space with "" in pList2
   
   // Test for some standard conditions.
   if pList1 is "*" or pList2 is "*" then return true
   if pList1 is empty and pList2 is empty then return true
   if pList1 is empty and pList2 is not empty then return false
   
   // Do the list comparison.
   repeat for each item tItem in pList1
      if tItem is among the items of pList2 then return true
   end repeat
   
   // We did not find a match.
   return false
end matchAnyItem

// Common Interface Calls
// -------------------

// Get the root path of the stack.
function rootPath
   set the itemDelimiter to slash
   return item 1 to -2 of the filename of stack "quality" & slash
end rootPath

// List all the files in a particular directory tree.
on listFilesRecursive @rFiles, pFolder, pFileFilter, pDepth
   local tFolder, tFile, tFoldersToTest
   if pDepth is a number then
      if pDepth is 0 then exit listFilesRecursive
      put pDepth - 1 into pDepth
   end if
   if pFolder ends with slash then put char 1 to -2 of pFolder into pFolder
   repeat for each line tFile in listFiles (pFolder, pFileFilter)
      put pFolder & slash & tFile & return after rFiles
   end repeat 
   put listFolders (pFolder, empty) into tFoldersToTest
   filter tFoldersToTest without ".*"
   repeat for each line tFolder in tFoldersToTest
      listFilesRecursive rFiles, pFolder & slash & tFolder, pFileFilter, pDepth
   end repeat    
end ListFilesRecursive

// List all the files in a particular directory.
function listFiles pFolder, pFilter
   local tOldFolder
   if there is a folder pFolder then
      put the folder into tOldFolder
      set the folder to pFolder
      get the files
      if pFilter is not empty then filter it with pFilter
      set the folder to tOldFolder
      return it
   else
      return empty
   end if
end listFiles

// List all the folders in a particular directory.
function listFolders pFolder, pFilter
   local tOldFolder
   if there is a folder pFolder then
      put the folder into tOldFolder
      set the folder to pFolder
      get the folders
      if pFilter is not empty then filter it with pFilter
      set the folder to tOldFolder
      return it
   else
      return empty
   end if
end listFolders

// Ensure the relevant folders are present
command createAllFolders pFolder
   set the itemDel to "/"
   repeat with x = 1 to the number of items in pFolder
      if item 1 to x of pFolder is not empty and there is not a folder (item 1 to x of pFolder) then
         create folder (item 1 to x of pFolder) 
      end if 
   end repeat
end createAllFolders

// Execute a Shell Command.
function doShellCommand pCommand, pArguments
   local tCommandPath
   set the itemDelimiter to slash
   put item 1 to -2 of pCommand into tCommandPath
   
   local tOldPath
   put $PATH into tOldPath
   if the platform is "win32" then
      //set the itemDelimiter to backslash
      replace slash with backslash in tCommandPath
      put tCommandPath & ";" before $PATH
      //put tCommandPath & ";" & sJavaRoot & "\bin" & ";" before $PATH
   else if the platform is "macos" then
      put tCommandPath & ":" before $PATH
   else if the platform is "linux" then
      put tCommandPath & ":" before $PATH
      //put tCommandPath & ":" & sJavaRoot & "/bin" & ":" before $PATH      
   end if
   
   set the hideConsoleWindows to true
   get shell(item -1 of pCommand && pArguments)
   
   put tOldPath into $PATH
   
   return it
end doShellCommand

// Open a process for Reading.
function doOpenProcess @rProcess
   local tPathToRemember, tProcessName, tProcessArguments
   if the platform is "Linux" then
      put the defaultFolder into tPathToRemember
      set the itemDelimiter to quote 
      put item 2 of rProcess into tProcessName
      put item 3 of rProcess into tProcessArguments
      set the itemDelimiter to slash
      put "./" & item -1 of tProcessName && tProcessArguments into rProcess
      set the defaultFolder to item 1 to -2 of tProcessName
      
      open process rProcess for read
      
      set the defaultFolder to tPathToRemember
   else
      open process rProcess for read
   end if
   return empty
end doOpenProcess

// Return the path to cached git hub engines, if we are looking at git hub.
function ensureEngines pID, pPlatform
   local tItem
     
   // Test if we are trying to cache GitHub data.
   repeat for each item tItem in the cGitHub of stack "quality"
      if pID begins with tItem then
         dispatch function "mapGitHubCacheFiles" to card "qualityGitHubInteraction" of stack "quality" with pID, pPlatform
         return the result
      end if
   end repeat
   return pID
end ensureEngines

// Access Methods to Private Quality Properties
// -----------------------------------

on qualityGetTestExtension
    return the cLiveCodeTestExtension of stack "quality" 
end qualityGetTestExtension

on qualityTimingMode
   set the cTimingMode of stack "quality" to true
end qualityTimingMode

on qualityRunMode
   set the cTimingMode of stack "quality" to false
end qualityRunMode

on qualityGetGitHubPath
    return the cGitHub of stack "quality" 
end qualityGetGitHubPath

function qualityResourcePath
    return the cResourceStacks of stack "quality" 
end qualityResourcePath

// Assert to old Syntax Conversion
// ------------------------------

command handleAssert @rScriptOutput, @rDiffDbs, pScriptInput, pSourceFileName, pDiffDbId
   local tLine, tLineIndex, tCommandName, rDiffDb, rDiffCode
   
   put empty into rDiffCode
   put empty into tCommandName
   put empty into rDiffDbs
   put empty into rScriptOutput
   put 0 into tLineIndex
   
   repeat for each line tLine in pScriptInput
      put empty into rDiffDb
      add 1 to tLineIndex
      
      // Get the current command name.
      if (word 1 of tLine is "command" or word 1 of tLine is "on") and word 2 of tLine begins with "test_" then
         put word 2 of tLine into tCommandName
      end if
      
      // Process any diff syntax.
      if word 1 of tLine begins with "eval_" then
         processDiffTestingLine rScriptOutput, rDiffCode, rDiffDb, tLineIndex, word 1 to -1 of tLine, pSourceFileName, tCommandName, pDiffDbId
         
         // Add the db names to the list of dbs that have to be resolved.
         if rDiffDb is not empty and rDiffDb is not among the lines of rDiffDbs then
            put rDiffDb & return after rDiffDbs
         end if
         next repeat
      end if
      
      // Process any assert syntax.
      if word 1 of tLine is "assert" then
         switch word 2 of tLine
            case "true" // "test"
               if the number of words of tLine is 2 then
                  processTestTrueLine rScriptOutput, tLineIndex, word 2 to -1 of tLine, pSourceFileName, tCommandName
               else
                  processTestTrueLine rScriptOutput, tLineIndex, word 3 to -1 of tLine, pSourceFileName, tCommandName
               end if
               break
            case "false"
               if the number of words of tLine is 2 then
                  processTestTrueLine rScriptOutput, tLineIndex, word 2 to -1 of tLine, pSourceFileName, tCommandName
               else
                  processTestFalseLine rScriptOutput, tLineIndex, word 3 to -1 of tLine, pSourceFileName, tCommandName
               end if
               break
            case "failure" // "test-error"
               processTestFailureLine rScriptOutput, tLineIndex, word 3 to -1 of tLine
               break
            case "success" // "test-no-error"
               processTestSuccessLine rScriptOutput, tLineIndex, word 3 to -1 of tLine
               break
            default
               // "test"
               processTestTrueLine rScriptOutput, tLineIndex, word 2 to -1 of tLine, pSourceFileName, tCommandName
               break
         end switch
         next repeat
      end if
      
      put tLine & return after rScriptOutput
   end repeat
   
   put rDiffCode & rScriptOutput into rScriptOutput
   
end handleAssert

----------

// Insert code for difference testing.
command processDiffTestingLine @xOutput, @rDiffCode, @rDbName, pLineIndex, pLine, pSourceFileName, pCommandName, pDiffDbId 
   put empty into rDbName
   if pLine begins with "eval_" then
      // Write the code to the output.
      put "/*"&pLineIndex&"*/" && word 1 of pLine & "_" & pCommandName && word 2 to -1 of pLine & ";" && " if the result is false then;log" && quote & "  fail - record - line" && pLineIndex & quote & ";else; log" && quote & "  pass - record - line" && pLineIndex & quote & ";end if;" & return after xOutput
      // Test if we are processing differencing with custom control evaluation or if we are using buit in comparators.
      if pLine begins with "eval_output" then
         // Create the generic storage code
         processWrapperForGenericDiffStorage xOutput, rDiffCode, rDbName, pLine, pSourceFileName, pCommandName, pDiffDbId
      else
         // Create the user storage code.
         processWrapperForDiffStorage xOutput, rDiffCode, rDbName, pLine, pSourceFileName, pCommandName, pDiffDbId
      end if
   end if
end processDiffTestingLine

----------

// Process a self evaluating test.
command processTestTrueLine @xOutput, pLineIndex, pLine, pSourceFileName, pCommandName
   // Write the code to the output.
   put "/*"&pLineIndex&"*/ if not (" & pLine & ") then;log" && quote & "  fail - line" && pLineIndex & quote & ";else; log" && quote & "  pass - line" && pLineIndex & quote & ";end if;" & return after xOutput
end processTestTrueLine

----------

// Process a self evaluating test.
command processTestFalseLine @xOutput, pLineIndex, pLine, pSourceFileName, pCommandName
   // Write the code to the output.
   put "/*"&pLineIndex&"*/ if (" & pLine & ") then;log" && quote & "  fail - line" && pLineIndex & quote & ";else; log" && quote & "  pass - line" && pLineIndex & quote & ";end if;" & return after xOutput
end processTestFalseLine

----------

// Process a self evalutating error test. 
command processTestFailureLine @xOutput, pLineIndex, pLine
   // Write the code to the output.
   put "put empty into ___error___" & return after xOutput
   put "try" & return after xOutput
   put "put (" & pLine & ") into ___temp___" & return after xOutput
   put "catch ___error___" & return after xOutput
   put "end try" & return after xOutput
   put "/*"&pLineIndex&"*/ if ___error___ is empty then;log" && quote & "  fail - line" && pLineIndex & quote & ";else;log" && quote & "  pass - line" && pLineIndex & quote & ";end if;" & return after xOutput
end processTestFailureLine

----------

// Process a self evaluating non-error test.
command processTestSuccessLine @xOutput, pLineIndex, pLine
   // Write the code to the output.
   put "put empty into ___error___" & return after xOutput
   put "try" & return after xOutput
   put "put (" & pLine & ") into ___temp___" & return after xOutput
   put "catch ___error___" & return after xOutput
   put "end try" & return after xOutput
   put "/*"&pLineIndex&"*/ if ___error___ is not empty then;log" && quote & "  fail - line" && pLineIndex & quote & ";else;log" && quote & "  pass - line" && pLineIndex & quote & ";end if;" & return after xOutput
end processTestSuccessLine

----------

// Create the storage code for user specified differencing.
command processWrapperForDiffStorage @xOutput, @rDiffCode, @rDbName, pCommandSyntax, pSourceFileName, pCommandName, pDiffDbId
   local tOutput, tStackName
   
   // Test if we already have a wrapper for this particular bit of code.
   if "command" && word 1 of pCommandSyntax & "_" & pCommandName && "pControlId1, pControlId2" is among the lines of rDiffCode then exit processWrapperForDiffStorage
   
   // Create the database name in which to store the data.
   set the itemDelimiter to "."
   put item 1 to -2 of pSourceFileName into tStackName
   set the itemDelimiter to slash
   put item -1 of tStackName into tStackName
   put tStackName & slash & pDiffDbId & slash into rDbName
   
   // Ensure that the relevant database path exists.
   createAllFolders the cLiveCodeTestDbFolder of stack "quality" & rDbName
   
   // Create the wrapper code for storing the diference results.
   put "command" && word 1 of pCommandSyntax & "_" & pCommandName && "pControlId1, pControlId2" & return after tOutput
   put "   local tFileName, tStackName, tIndex" & return after tOutput
   // The uid in the following lines is a placeholder for the unique id of a test that is stored in the metadata and constructed as an md5 digest of the path and seconds.
   put "   if the platform is" && quote & "android" & quote && "then" & return after tOutput
   put "      put" && quote & "/sdcard/" & quote && "& the platform" && "&" && quote & "_" & quote && "&" && "the version" && "&" && quote & the cLiveCodeTestDbExtension of stack "quality" & quote && "into tFileName" & return after tOutput
   put "   else if the platform is" && quote & "iphone" & quote && "and there is no folder" && quote & the cLiveCodeTestDbFolder of stack "quality" & rDbName & quote && "then" & return after tOutput
   put "      put empty into tFileName" & return after tOutput
   put "   else" & return after tOutput
   put "      put" && quote & the cLiveCodeTestDbFolder of stack "quality" & rDbName & quote && "&" && "the platform" && "&" && quote & "_" & quote && "&" && "the version" && "&" && quote & the cLiveCodeTestDbExtension of stack "quality" & quote && "into tFileName" & return after tOutput
   put "   end if" & return after tOutput
   put "   put the platform" && "&" && quote & "_" & quote && "&" && "the version into tStackName" & return after tOutput
   put "   // Open/Create a DB stack." & return after tOutput
   put "   lock messages" & return after tOutput
   put "   if there is a stack tStackName then delete stack tStackName" & return after tOutput
   put "   if there is a file tFileName then" & return after tOutput
   put "      go invisible stack tFileName" & return after tOutput
   put "   else" & return after tOutput
   put "      create stack tStackName" & return after tOutput
   put "      go invisible stack tStackName" & return after tOutput
   put "   end if" & return after tOutput
   put "   if there is no stack tStackName then return false" & return after tOutput
   put "   unlock messages" & return after tOutput
   put "   // Make sure we know where this file has to go, if it is created on a device that does not have access to the file system." & return after tOutput
   put "   set the cDbLocation of stack tStackName to tFileName" & return after tOutput   
   put "   // Create a DB card if needed." & return after tOutput
   put "   if there is no card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "then" & return after tOutput
   put "      create card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote & return after tOutput
   put "      set the cDbCounter of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "to 1" & return after tOutput
   put "   end if" & return after tOutput
   put "   // If the control is a field, then ensure that we can copy the text." & return after tOutput
   put "   set the sharedText of pControlId1 to true" & return after tOutput
   put "   // Make sure we have an index for the test" & return after tOutput
   put "   put the cDbCounter of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "into tIndex" & return after tOutput
   put "   set the cDbCounter of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "to tIndex + 1" & return after tOutput
   put "   // Copy the control to the card DB." & return after tOutput
   put "   copy pControlId1 to card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "of stack tStackName" & return after tOutput
   put "   set the name of the last control of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "to" && quote & "cCDB," & quote & " & tIndex" & return after tOutput
   put "   // Save the stack." & return after tOutput
   put "   lock messages" &  return after tOutput
   put "   // If we are not on an iOS device then save the stack." & return after tOutput
   put "   if tFileName is not empty then" & return after tOutput
   put "      save stack tStackName as tFileName" &  return after tOutput
   put "   end if" & return after tOutput
   put "   delete stack tStackName" &  return after tOutput
   put "   unlock messages" &  return after tOutput
   put "   return true" & return after tOutput
   put "end" && word 1 of pCommandSyntax & "_" & pCommandName & return after tOutput
   put tOutput & return before rDiffCode
end processWrapperForDiffStorage

----------

// Create the storage code for generic differencing, using the default operators with the current evaluation logic:
command processWrapperForGenericDiffStorage @xOutput, @rDiffCode, @rDbName, pCommandSyntax, pSourceFileName, pCommandName, pDiffDbId
   local tStackName, tOutput
   
   // Test if we already have a wrapper for this particular bit of code.
   if "command" && word 1 of pCommandSyntax & "_" & pCommandName && "pValue, pType, pTag" is among the lines of rDiffCode then exit processWrapperForGenericDiffStorage
   
   // Create the database name in which to store the data.
   set the itemDelimiter to "."
   put item 1 to -2 of pSourceFileName into tStackName
   set the itemDelimiter to slash
   put item -1 of tStackName into tStackName
   put tStackName & slash & pDiffDbId & slash into rDbName
   
   // Ensure that the relevant database path exists.
   createAllFolders the cLiveCodeTestDbFolder of stack "quality" & rDbName
   
   // Create the wrapper code for storing the diference results.
   put "command" && word 1 of pCommandSyntax & "_" & pCommandName && "pValue, pType, pTag" & return after tOutput
   put "   local tFileName, tStackName, tCPName" & return after tOutput
   // The uid in the following lines is a placeholder for the unique id of a test that is stored in the metadata and constructed as an md5 digest of the path and seconds.
   put "   if the platform is" && quote & "android" & quote && "then" & return after tOutput
   put "      put" && quote & "/sdcard/" & quote && "& the platform" && "&" && quote & "_" & quote && "&" && "the version" && "&" && quote & the cLiveCodeTestDbExtension of stack "quality" & quote && "into tFileName" & return after tOutput
   put "   else if the platform is" && quote & "iphone" & quote && "and there is no folder" && quote & the cLiveCodeTestDbFolder of stack "quality" & rDbName & quote && "then" & return after tOutput
   put "      put empty into tFileName" & return after tOutput
   put "   else" & return after tOutput
   put "      put" && quote & the cLiveCodeTestDbFolder of stack "quality" & rDbName & quote && "&" && "the platform" && "&" && quote & "_" & quote && "&" && "the version" && "&" && quote & the cLiveCodeTestDbExtension of stack "quality" & quote && "into tFileName" & return after tOutput
   put "   end if" & return after tOutput
   put "   put the platform" && "&" && quote & "_" & quote && "&" && "the version into tStackName" & return after tOutput
   put "   // Open/Create a DB stack." & return after tOutput
   put "   lock messages" & return after tOutput
   put "   if there is a stack tStackName then delete stack tStackName" & return after tOutput
   put "   if there is a file tFileName then" & return after tOutput
   put "      go invisible stack tFileName" & return after tOutput
   put "   else" & return after tOutput
   put "      create stack tStackName" & return after tOutput
   put "      go invisible stack tStackName" & return after tOutput
   put "   end if" & return after tOutput
   put "   if there is no stack tStackName then return false" & return after tOutput
   put "   unlock messages" & return after tOutput
   put "   // Make sure we know where this file has to go, if it is created on a device that does not have access to the file system." & return after tOutput
   put "   set the cDbLocation of stack tStackName to tFileName" & return after tOutput
   put "   // Create a DB card if needed." & return after tOutput
   put "   if there is no card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "then" & return after tOutput
   put "      create card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote & return after tOutput
   put "      set the cDbCounter of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "to 1" & return after tOutput
   put "   end if" & return after tOutput
   put "   // Make sure we have a tag name." & return after tOutput
   put "   if pTag is empty then" & return after tOutput
   put "      put the cDbCounter of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "into pTag" & return after tOutput
   put "      set the cDbCounter of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "to pTag+1" & return after tOutput
   put "   end if" & return after tOutput
   put "   // Copy the data to the card DB." & return after tOutput
   put "   put" && quote & "cGDB," & quote && "& pTag & comma & pType into tCPName" & return after tOutput
   put "   set the tCPName of card" && quote & word 1 of pCommandSyntax & comma & pCommandName & quote && "to pValue" & return after tOutput
   put "   // Save the stack." & return after tOutput
   put "   lock messages" &  return after tOutput
   put "   // If we are not on an iOS device then save the stack." & return after tOutput
   put "   if tFileName is not empty then" & return after tOutput
   put "      save stack tStackName as tFileName" &  return after tOutput
   put "   end if" & return after tOutput
   put "   delete stack tStackName" &  return after tOutput
   put "   unlock messages" &  return after tOutput
   put "   return true" & return after tOutput
   put "end" && word 1 of pCommandSyntax & "_" & pCommandName & return after tOutput
   put tOutput & return before rDiffCode
end processWrapperForGenericDiffStorage
