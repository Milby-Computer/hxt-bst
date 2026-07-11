Script "stack_quality_card_id_1066"

/*
# Name: card "qualityBuildStacks" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1066 of stack "quality" of stack "livecodeTestInterface"
# Hash: cFCsJxfWY8Tz1R/HfCicag==
*/


// Main Execution Level
on runGeneration @rWorkList, pWorkListID, pIndex
   local tWorkListID, tIndex, tTestIdExtension, tTestIdPairs, tTestSource, tPass
   
   put true into tPass
   
   // Test that we have a valid entry for which to generate a stack.
   if pWorkListID is not among the keys of rWorkList or \
         pIndex is not among the keys of rWorkList[pWorkListID] or \
         "StackID" is among the keys of rWorkList[pWorkListID][pIndex] or \
         "DuplicateID" is among the keys of rWorkList[pWorkListID][pIndex] then
      put false into tPass
      return tPass
   end if
   
   // Get the test id extension that indicates what type of tests can be included.
   if rWorkList[pWorkListID][pIndex]["TestID"] ends with the cLiveCodeExtension of stack "quality" then
      put the cLiveCodeExtension of stack "quality" into tTestIdExtension
      put "stack" into tTestSource
   else if rWorkList[pWorkListID][pIndex]["TestID"] ends with the cRevExtension of stack "quality" then
      put the cRevExtension of stack "quality" into tTestIdExtension
      put "stack" into tTestSource
   else if rWorkList[pWorkListID][pIndex]["TestID"] ends with the cLiveCodeTestExtension of stack "quality" then
      put the cLiveCodeTestExtension of stack "quality" into tTestIdExtension
      put "script" into tTestSource
   else
      logThis "TestID Exception - Could not create stack for test:" && quote & pWorkListID & comma & pIndex & comma & quote & return
      put false into tPass
      return tPass
   end if
   
   put pWorkListID & comma & pIndex into tTestIdPairs
   
   // Generate the work list id, index pairs that refer to all tests that are to be included in the test stack.
   repeat for each line tWorkListID in the keys of rWorkList
      
      // Ensure that work lists are not in a state of processing that could allow duplicate tests to be created.
      if rWorkList[tWorkListID]["Status"] is among the items of "worklist created,worklist duplicate test optimized,worklist removing" then
         put false into tPass
         return tPass
      end if
      
      // Check if we can add another test to the stack we are generating
      repeat for each line tIndex in the keys of rWorkList[tWorkListID]
         
         // Check if a test already has a stack built for it.
         if "StackID" is not among the keys of rWorkList[tWorkListID][tIndex] and \
               "DuplicateID" is not among the keys of rWorkList[tWorkListID][tIndex] and \
               (tWorkListID is not pWorkListID or tIndex is not pIndex) then
            
            // Check that a test can be added to a stack with tests.
            if rWorkList[pWorkListID][pIndex]["PlatformID"] is rWorkList[tWorkListID][tIndex]["PlatformID"] and \
                  rWorkList[pWorkListID][pIndex]["VersionID"] is rWorkList[tWorkListID][tIndex]["VersionID"] and \
                  rWorkList[pWorkListID][pIndex]["StandaloneSettingsSignature"] is rWorkList[tWorkListID][tIndex]["StandaloneSettingsSignature"] and \
                  rWorkList[pWorkListID][tIndex]["TestID"] ends with tTestIdExtension then
               put return & tWorkListID & comma & tIndex after tTestIdPairs
            end if
         end if
      end repeat
   end repeat
   
   // Start generating the data that is to be included in the test stack.
   if tTestSource is "script" then
      
      // Convert the text test files into a continuous script.
      // Creates the execution instructions with execution conditions:
      // - Test Number
      // - Execution Time Limit
      // - Test Case File Name
      if tPass is true then
         dispatch function "buildTestStackData" to card "qualityBuildStacksFromScripts" of stack "quality" with rWorkList, tTestIdPairs
         put the result into tPass
      end if
      
   else
      
      // Convert the stack test files into inclusion instructions for substacks.
      // Creates the execution instructions with execution conditions:
      // - Test Number
      // - Execution Time Limit
      // - Test Case File Name
      if tPass is true then
         dispatch function "buildTestStackData" to card "qualityBuildStacksFromStacks" of stack "quality" with rWorkList, tTestIdPairs
         put the result into tPass
      end if
      
   end if   
end runGeneration

////////////////////////////////////////////////////////////////////////////////////////////////////
----------------------------------------------------------------------------------------
////////////////////////////////////////////////////////////////////////////////////////////////////

// ---------- Create the Test Stack ----------

// Build the LiveCode stack file.
function buildTestStack pDeviceGroup, pTestIdPair, pCode, pStandalone
   local tSaveResult, tSaveFileName, tPass, rStackCode
   
   put true into tPass
   
   if pCode is empty then
      logThis "Test Build Exception - No test data found for processing." & return
      put false into tPass
   end if
   
   if tPass is true then
      if there is a stack "__TESTS__" then delete stack "__TESTS__"
      // Create a new stack that is to hold tests for an engine.
      lock messages
      create stack "__TESTS__"
      // DO NOT USE THE FOLLOWING FORM AS IOS DOES NOT LIKE THIS ONE BIT!
      //create invisible stack "__TESTS__"
      set the defaultStack to "__TESTS__"
      unlock messages
   end if
   
   // See if we have to create cards in stack "__TESTS__" that are part of pCode
   if tPass is true then
      put insertCodeCardsIntoStack (rStackCode, pCode) into tPass
   end if
   
   if tPass is true then
      // Get the script of the stack from the engine scripts storage structure.
      set the script of stack "__TESTS__" to rStackCode
      
      // See if we have to include other stacks here.
      dispatch "includeSubStacks" to stack "__TESTS__" with "true"
      
      // Ensure that executing something on a different stack does not take the focus away.
      set the defaultStack to "quality"
   end if
   
   // Create the test specific standalone application settings that are needed to run the stack.
   if tPass is true then
      put generateStandaloneInformationUserSet (pStandalone) into tPass
   end if
   
   // Create the default standalone application settings that are needed to run the stack.
   if tPass is true then
      put generateStandaloneInformation (pDeviceGroup, pTestIdPair) into tPass
   end if
   
   // Save the new script.
   if tPass is true then
      dispatch function "getStackName" to card "qualityWorkList" of stack "quality" with item 1 of pTestIdPair, item 2 of pTestIdPair
      put the result into tSaveFileName
      lock messages
      save stack "__TESTS__" as tSaveFileName
      unlock messages
      
      // Test that there were no problems when saving the stack.
      if the result is not empty then
         put the result into tSaveResult
         logThis "Test Build Exception - Could not save LiveCode stack file for" && pTestIdPair && ":" & return & tSaveResult & return
         put false into tPass
      end if
      
      // See if we can remove any substacks.
      dispatch "includeSubStacks" to stack "__TESTS__" with "false"
   end if
   
   // Remove the created stack from memory.
   lock messages
   delete stack "__TESTS__"
   unlock messages
   
   return tPass
end buildTestStack

----------

// If we are building tests from scripts, then create appropriate cards.
function insertCodeCardsIntoStack @rStackCode, pCode
   local tLine, tScriptSection, tCardScriptName, tPass
   
   put true into tPass
   put empty into rStackCode
   put empty into tCardScriptName
   
   repeat for each line tLine in pCode
      if tLine begins with "PLACE-HOLDER-FOR-TEST-SPECIFIC-CARD-SCRIPT" then
         if tCardScriptName is empty then
            put tScriptSection & return after rStackCode
         else
            if there is a card tCardScriptName then
               logThis "Test Generation Exception - Duplicate card name detected for test" && tCardScriptName & "." & return
            end if
            new card tCardScriptName
            set the script of card tCardScriptName to tScriptSection
         end if
         put empty into tScriptSection
         put word 2 to -1 of tLine into tCardScriptName
      else
         put tLine & return after tScriptSection
      end if
   end repeat
   
   // If we did not encounter a split token then all the code goes into the stack script.
   if tCardScriptName is empty then
      put tScriptSection into rStackCode
   else
      if there is a card tCardScriptName then
         logThis "Test Generation Exception - Duplicate card name detected for test" && tCardScriptName & "." & return
      end if
      new card tCardScriptName
      set the script of card tCardScriptName to tScriptSection
   end if

return tPass
end insertCodeCardsIntoStack
   
----------

function generateStandaloneInformationUserSet pStandaloneCode
   local tDefaultStack, tLine
   local tStandaloneSettings         
   
   set the itemdelimiter to quote
   
   put the defaultStack into tDefaultStack
   set the defaultStack to "__TESTS__"
   set the cRevTargetStack of stack "revStandaloneSettings" to "__TESTS__"
   put the customProperties["cRevStandaloneSettings"] of stack "__TESTS__" into tStandaloneSettings
   
   repeat for each line tLIne in pStandaloneCode
      if the number of items in tLine < 6 then
         put item 4 of tLine into tStandaloneSettings[item 2 of tLine]
      else
         put item 6 of tLine into tStandaloneSettings[item 2 of tLine][item 4 of tLine]
      end if
   end repeat
   
   set the customProperties["cRevStandaloneSettings"] of stack "__TESTS__" to tStandaloneSettings  
   set the defaultStack to tDefaultStack
   
   return true
end generateStandaloneInformationUserSet

----------

function generateStandaloneInformation pPlatform, pTestInstance
   local tDefaultStack, tProfiles, tElement, tArray
   local tStandaloneSettings         
   
   put the defaultStack into tDefaultStack
   set the defaultStack to "__TESTS__"
   switch pPlatform
      case "Android"
         set the cRevTargetStack of stack "revStandaloneSettings" to "__TESTS__"
         dispatch "revDefaultStandaloneSettings" to stack "revStandaloneSettings" with "__TESTS__" 
         dispatch "buildForEnabled" to stack "revStandaloneSettings" with pPlatform
         
         // Make sure that we can write to the external storage device.
         put the customProperties["cRevStandaloneSettings"] of stack "__TESTS__" into tStandaloneSettings
         put true into tStandaloneSettings["android,application permissions"]["WRITE_EXTERNAL_STORAGE"]
         set the customProperties["cRevStandaloneSettings"] of stack "__TESTS__" to tStandaloneSettings
         
         break
      case "iOS"
         set the cRevTargetStack of stack "revStandaloneSettings" to "__TESTS__"
         dispatch "revDefaultStandaloneSettings" to stack "revStandaloneSettings" with "__TESTS__" 
         dispatch "buildForEnabled" to stack "revStandaloneSettings" with pPlatform
         
         // Get the appropriate build profile.
         dispatch "updateProfiles" to card "iOS" of stack "revStandaloneSettings"
         dispatch function "getProfiles" to card "iOS" of stack "revStandaloneSettings"
         put the result into tProfiles
         
         repeat for each element tElement in tProfiles
            if tElement["name"] contains "*" then
               dispatch "storeSetting" to card "iOS" of stack "revStandaloneSettings" with "profile", tElement["id"]
               exit repeat
            end if
         end repeat
         
         // Set the bundle id of the ios device. Needed for multiple test instance on a device.
         dispatch "storeSetting" to card "iOS" of stack "revStandaloneSettings" with "bundle id", "com.runrev.test" & pTestInstance
         
         // Set the build type to Arm v7 for iOS devices.
         dispatch "storeSetting" to card "iOS" of stack "revStandaloneSettings" with "build type", "Arm v7"
                  
         break
      default
         break
   end switch
   set the defaultStack to tDefaultStack
   
   return true
end generateStandaloneInformation

----------

function buildExecutionInstructions pDeviceGroup, pTestIdPair, pInstructions
   local tResultText, tInstructionsFileName, tExecutionInstructions
   
   dispatch function "getInstructionsName" to card "qualityWorkList" of stack "quality" with item 1 of pTestIdPair, item 2 of pTestIdPair
   put the result into tInstructionsFileName
   
   if pInstructions is empty then
      logThis "Test Build Exception - No execution instrucions data found for processing for target" && pTestIdPair & ":" & return
      return false
   end if
   
   // Open the test instructions file for writing.
   open file (tInstructionsFileName) for text write
   
   // See if we can write to the test instructions file.
   write pInstructions to file (tInstructionsFileName)
   if the result is not empty then
      put the result into tResultText
      logThis "Test Instructions Exception - Could not write test instructions file for" && pTestIdPair & ":" & return & tResultText & return
      return false
   end if
   
   // See if we can close the Test Results File.
   close file (tInstructionsFileName)
   if the result is not empty then
      put the result into tResultText
      logThis "Test Instructions Exception - Could not close test instructions file for" && pTestIdPair & ":" & return & tResultText & return
      return false      
   end if
   
   return true
end buildExecutionInstructions
