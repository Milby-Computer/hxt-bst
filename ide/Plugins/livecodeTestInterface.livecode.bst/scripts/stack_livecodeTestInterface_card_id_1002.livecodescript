Script "stack_livecodeTestInterface_card_id_1002"

/*
# Name: card "main" of stack "livecodeTestInterface"
# ID: card id 1002 of stack "livecodeTestInterface"
# Hash: bvkw2DGh28vtcWXXwqbulg==
*/


local sFullTestResults, sDisplayResults

on preOpenCard   
   start using stack "quality"
   insert the script of button "assertErrorBehavior" of stack "quality" into back
   
   start using stack "testInputLib"
   send "setUpValues" to stack "testInputLib"
   
   qualityInitialise
   qualityConfigure "LiveCodeInstallFolder", the cLiveCodeInstallFolder of stack "revPreferences"
   qualityConfigure "TestFolder", the cTestFolder of stack "revPreferences"
   qualityConfigure "TestCache", the cTestCache of stack "revPreferences"
   qualityConfigure "GitHub", the cGitHubPath of stack "revPreferences"
   qualityConfigure "FruitStrap", the cFruitStrap of stack "revPreferences"
   qualityConfigure "AutomationTemplate", the cAutomationTemplate of stack "revPreferences"
   qualityConfigure "ResourceStacks", the cTestIncludeFolder of stack "revPreferences"
   qualityConfigure "LiveCodeTestDbFolder", the cLiveCodeTestDbFolder of stack "revPreferences"
   
   switch the cTestMode of stack "revPreferences"
      case "run"
         qualityRunMode
         break
      case "timing"
         qualityTimingMode
         break
      default
         break 
   end switch
   
   set the behavior of control  "test list" of stack "livecodeTestInterface" to the long id of button "rTreeBehavior" of card "Engine" of stack "rTreeEngine"
   set the behavior of control  "version list" of stack "livecodeTestInterface" to the long id of button "rTreeBehavior" of card "Engine" of stack "rTreeEngine"
   set the behavior of control  "platform list" of stack "livecodeTestInterface" to the long id of button "rTreeBehavior" of card "Engine" of stack "rTreeEngine"
   clearCard
   testList
   versionList
   platformList
   set the hilitedNodeIDs of control "test list" of stack "livecodeTestInterface" to the cSelectedNodeIDs of control "test list" of stack "livecodeTestInterface"
   set the hilitedNodeIDs of control "version list" of stack "livecodeTestInterface" to the cSelectedNodeIDs of control "version list" of stack "livecodeTestInterface"
   set the hilitedNodeIDs of control "platform list" of stack "livecodeTestInterface" to the cSelectedNodeIDs of control "platform list" of stack "livecodeTestInterface"
   layoutCard
   updateDisplay
end preOpenCard

command clearCard pAll
   if pAll then
      --put empty into field "CallbackResults"
      --put empty into field "results"
      
      set the dgData of group "testResults" of card "main" of stack "livecodeTestInterface" to empty
      set the dgData of group "subtestResults" of card 1 of stack "subtestResults" to empty
      
      set the hilite of button "testSelectAll" to false
      set the hilite of button "versionSelectAll" to false
      set the hilite of button "platformSelectAll" to false
      
      put empty into field "testFilter"
      put empty into field "versionFilter"
      set the label of button "versionCondition" to "Search"
      set the label of button "platformFilter" to "All"
      hide field "resultsLog"
      
      put "0 of 0" into field "testProgressCount"
      set the thumbPosition of scrollbar "testProgress" to 0
      put empty into field "worklistID"
      put empty into field "status"
      set the label of button "testRun" to "Start"
      put "0 tests to run" into field "count"
   end if
end clearCard

command testList pFilter
   local tTests, tKey, tLine, tNodeID, tTestName, tTestTags, tTestTag, tKeys
   local xCacheData
   
   qualityListTests
   put the result into tTests
   
   if pFilter is empty then put the text of field "testFilter" into pFilter
   
   // Get a list of all possible tags
   // map each test to its tags
   
   //local tTiming
   //put the seconds into tTiming
   
   local tAllTagsList, tTagToTest, tTestMeta, tTestIndex, tPath, tSubTestCount, tSubTestName
   put empty into xCacheData
   put 0 into tSubTestCount
   
   --put the milliseconds into tStartTime
   if tTests is an array then
      repeat for each line tKey in the keys of tTests      
         repeat for each line tLine in tTests [tKey]
            qualityGetTestLabel tLine
            put the result into tTestName          
            
            if tTestName is not "test-template" then
               qualityGetTestTags tLine, xCacheData
               put the result into tTestMeta
               split tTestMeta by return and space
               put tTestMeta["group"] into tTestTags
               
               if tTestTags is not empty then
                  repeat for each item tTag in tTestTags
                     if tTag is not among the items of tAllTagsList then
                        put tTag & comma after tAllTagsList
                     end if
                     put the number of lines in the keys of tTagToTest["My Tests"][tTag] into tTestIndex
                     put tLine into tTagToTest["My Tests"][tTag][ tTestIndex + 1]["path"]
                  end repeat
                  
                  // Subtests
                  repeat for each line tKey in the keys of tTestMeta
                     if char 1 to 7 of tKey is "subtest" then
                        add 1 to tSubTestCount
                        put tTestMeta[tKey] into tTagToTest["My Tests"][tTag][ tTestIndex+1]["subtests"][tSubTestCount]
                     end if 
                  end repeat
               else
                  // Put in other so it doesn't get missed
                  put the number of lines in the keys of tTagToTest["My Tests"]["other"] into tTestIndex
                  put tLine into tTagToTest["My Tests"]["other"][ tTestIndex + 1]
               end if
            end if
         end repeat
      end repeat
      if "other" is not among the items of tAllTagsList then
         put "other" after tAllTagsList
      end if
   end if
   
   // Build the list with tags
   local tTestListArray, tParentID, tParentID2, tParentID3
   
   if tTagToTest is not empty then
      hide field "testMessage" of card 1 of stack "livecodeTestInterface"
      hide button "testSettings" of card 1 of stack "livecodeTestInterface"
      put 0 into tNodeID
      --dispatch "delete_nodeData" to control "test list" of card 1 of stack "livecodeTestInterface"    
      --dispatch "renderTree" to control "test list" of card 1 of stack "livecodeTestInterface"
      
      put empty into tTestListArray[0]["treeType"]
      put 99135 into tTestListArray[0]["firstIconCollapsed"]
      put 99136 into tTestListArray[0]["firstIconExpanded"]
      put 33441 into tTestListArray[0]["fileIcon"]
      put 33441 into tTestListArray[0]["secondIconCollapsed"]
      put 33441 into tTestListArray[0]["secondIconExpanded"]
      put true into tTestListArray[0]["useMultipleHilite"]
      put true into tTestListArray[0]["nonContiguousHilite"]
      put false into tTestListArray[0]["editNodeOnDoubleClick"]
      put false into tTestListArray[0]["useContextMenu"]
      put false into tTestListArray[0]["expandOnDoubleClick"]
      
      repeat for each line tKey in the keys of tTagToTest
         add 1 to tNodeID
         put tKey into tTestListArray[tNodeID]["name"]
         put tKey into tTestListArray[tNodeID]["label"]
         put 0 into tTestListArray[tNodeID]["depth"]
         put false into tTestListArray[tNodeID]["useSecondIcon"]
         put true into tTestListArray[tNodeID]["expanded"]
         if tTestListArray[0]["children"]  is empty then 
            put tNodeID into tTestListArray[0]["children"] 
         else 
            put cr & tNodeID after tTestListArray[0]["children"] 
         end if 
         put tNodeID into tParentID
         
         repeat for each line tTag in the keys of tTagToTest[tKey]
            add 1 to tNodeID
            put tTag into tTestListArray[tNodeID]["name"]
            put tTag into tTestListArray[tNodeID]["label"]
            put 1 into tTestListArray[tNodeID]["depth"]
            put false into tTestListArray[tNodeID]["useSecondIcon"]
            put true into tTestListArray[tNodeID]["expanded"]
            if tTestListArray[tParentID]["children"]  is empty then 
               put tNodeID into tTestListArray[tParentID]["children"] 
            else 
               put cr & tNodeID after tTestListArray[tParentID]["children"] 
            end if 
            
            put the keys of tTagToTest[tKey][tTag] into tKeys
            sort lines of tKeys ascending numeric
            
            put tNodeID into tParentID2
            repeat for each line tTagIndex in tKeys
               put tTagToTest[tKey][tTag][tTagIndex]["path"] into tPath
               qualityGetTestLabel tPath
               put the result into tTestName    
               
               --               if pFilter is not empty then
               --                  if tTestName contains pFilter then
               --                     add 1 to tNodeID
               --                     dispatch "new_node" to control "test list" of card 1 of stack "livecodeTestInterface"
               --                     set the name_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to tTestName
               --                     set the depth_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to 2
               --                     set the useFirstIcon_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to true
               --                     set the useSecondIcon_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to false
               --                     set the filepath_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to tPath
               --                     set the expanded_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to false
               
               --                     repeat for each line tSubTest in the keys of tTagToTest[tKey][tTag][tTagIndex]["subtests"]
               --                        add 1 to tNodeID
               --                        dispatch "new_node" to control "test list" of card 1 of stack "livecodeTestInterface"
               --                        set the name_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to tTagToTest[tKey][tTag][tTagIndex]["subtests"][tSubTest]
               --                        set the depth_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to 3
               --                        set the useFirstIcon_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to false
               --                        set the useSecondIcon_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to true
               --                        set the filepath_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to tPath
               --                        set the nodeType_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to "file"
               --                     end repeat
               --                  end if
               --               else
               add 1 to tNodeID
               
               put tTestName into tTestListArray[tNodeID]["name"]
               put 2 into tTestListArray[tNodeID]["depth"]
               put true into tTestListArray[tNodeID]["useFirstIcon"]
               put false into tTestListArray[tNodeID]["useSecondIcon"]
               put tPath into tTestListArray[tNodeID]["filepath"]
               set the filepath_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to tPath
               put false into tTestListArray[tNodeID]["expanded"]
               if tTestListArray[tParentID2]["children"]  is empty then 
                  put tNodeID into tTestListArray[tParentID2]["children"] 
               else 
                  put cr & tNodeID after tTestListArray[tParentID2]["children"] 
               end if 
               
               if the number of lines in the keys of tTagToTest[tKey][tTag][tTagIndex]["subtests"] <= 1 then
                  put false into tTestListArray[tNodeID]["useFirstIcon"]
                  put true into tTestListArray[tNodeID]["useSecondIcon"]
                  put "file" into tTestListArray[tNodeID]["nodeType"]
               end if
               
               put tNodeID into tParentID3
               repeat for each line tSubTest in the keys of tTagToTest[tKey][tTag][tTagIndex]["subtests"]
                  add 1 to tNodeID
                  
                  put tTagToTest[tKey][tTag][tTagIndex]["subtests"][tSubTest] into tTestListArray[tNodeID]["name"]
                  put tTagToTest[tKey][tTag][tTagIndex]["subtests"][tSubTest] into tTestListArray[tNodeID]["label"]
                  put 3 into tTestListArray[tNodeID]["depth"]
                  put false into tTestListArray[tNodeID]["useFirstIcon"]
                  put true into tTestListArray[tNodeID]["useSecondIcon"]
                  put tPath into tTestListArray[tNodeID]["filepath"]
                  set the filepath_of_node_ID_[tNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" to tPath
                  put "file" into tTestListArray[tNodeID]["expanded"]
                  put cr & tTestName after tTestListArray[tParentID2]["nodeType"] 
                  if tTestListArray[tParentID3]["children"]  is empty then 
                     put tNodeID into tTestListArray[tParentID3]["children"] 
                  else 
                     put cr & tNodeID after tTestListArray[tParentID3]["children"] 
                  end if 
                  
               end repeat                  
               --            end if
            end repeat
         end repeat
      end repeat
      dispatch "nodeData" to  group "test list" of card 1 of stack "livecodeTestInterface" with tTestListArray 
      dispatch "renderTree" to group "test list" of card 1 of stack "livecodeTestInterface"
      
      if the hilite of button "testSelectAll" of card 1 of stack "livecodeTestInterface" then
         testSelectAll true
      end if
   else
      set the text of field "testMessage" of card 1 of stack "livecodeTestInterface" to "This is where your tests will show. It is empty at the moment which may mean you do not have any tests set up or that your settings are not correct."
      show field "testMessage" of card 1 of stack "livecodeTestInterface"
      show button "testSettings" of card 1 of stack "livecodeTestInterface"
   end if   
   --put the milliseconds - tStartTime into msg
end testList

command testSelectAll pValue
   local tList
   if pValue then
      repeat for each line tID in the nodeIDs of control "test list"
         --if the depth_of_node_ID_[tID] of control "test list" is 3 then
         put tID & return after tList
         --end if
      end repeat
      delete the last char of tList
      set the hilitedNodeIDs of control "test list" to tList
      set the cSelectedNodeIDs of control "test list" to tList
   else
      set the hilitedNodeIDs of control "test list" to empty
      set the cSelectedNodeIDs of control "test list" to empty
   end if
   updateDisplay
end testSelectAll

command testSelectChildren pNodeID
   local tCurrentSelection, tChildren, tGrandChildren, tSelectedList, tScroll
   
   if the commandKey is down then
      put the cSelectedNodeIDs of control "test list" of card 1 of stack "livecodeTestInterface" into tCurrentSelection
   end if
   
   put the thumbPosition of scrollbar "verticalScrollbar" of control "test list" of card 1 of stack "livecodeTestInterface" into tScroll
   
   lock screen
   
   if the depth_of_node_ID_[pNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" is 0 then
      put the children_of_node_ID_[pNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" into tChildren
      replace comma with return in tChildren
      put tChildren into tSelectedList
      
      repeat for each line tChild in tChildren         
         put return & the children_of_node_ID_[tChild] of control "test list" of card 1 of stack "livecodeTestInterface" after tSelectedList
         replace comma with return in tSelectedList
         
         put the children_of_node_ID_[tChild] of control "test list" of card 1 of stack "livecodeTestInterface" into tGrandChildren
         replace comma with return in tGrandChildren
         
         repeat for each line tGrandChild in tGrandChildren
            put return & the children_of_node_ID_[tGrandChild] of control "test list" of card 1 of stack "livecodeTestInterface" after tSelectedList
            replace comma with return in tSelectedList
         end repeat
      end repeat
   else if the depth_of_node_ID_[pNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" is 1 then
      put the children_of_node_ID_[pNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" into tChildren
      replace comma with return in tChildren
      
      put tChildren into tSelectedList
      
      repeat for each line tChild in tChildren         
         put return & the children_of_node_ID_[tChild] of control "test list" of card 1 of stack "livecodeTestInterface" after tSelectedList
         replace comma with return in tSelectedList
      end repeat
   else if the depth_of_node_ID_[pNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" is 2 then 
      put the children_of_node_ID_[pNodeID] of control "test list" of card 1 of stack "livecodeTestInterface" into tChildren
      replace comma with return in tChildren
      put tChildren into tSelectedList
   end if
   
   put pNodeID & return before tSelectedList
   repeat for each line tChild in tSelectedList
      if tChild is not among the lines of tCurrentSelection then
         put return & tChild after tCurrentSelection
      end if
   end repeat 
   
   set the cSelectedNodeIDs of control "test list" of card 1 of stack "livecodeTestInterface" to tCurrentSelection
   set the hilitedNodeIDs of control "test list" of card 1 of stack "livecodeTestInterface" to tCurrentSelection
   
   set the thumbPosition of scrollbar "verticalScrollbar" of control "test list" of card 1 of stack "livecodeTestInterface" to tScroll
   unlock screen
end testSelectChildren

function testSelected
   local tNodes, tTestList, tTestArray, tParentNode,tParent
   
   put the cSelectedNodeIDs of group "test list" of stack "livecodeTestInterface" into tNodes
   repeat for each line tNode in tNodes
      
      if the depth_of_node_ID_[tNode] of group "test list" stack "livecodeTestInterface" is 3 then
         // Subtest         
         put the parent_of_node_ID_[tNode] of group "test list" of stack "livecodeTestInterface" into tParentNode
         put the filepath_of_node_ID_[tParentNode] of group "test list" of stack "livecodeTestInterface" into tParent
         put the name_of_node_ID_[tNode] of group "test list" of stack "livecodeTestInterface" & comma after tTestArray[tParent]
      end if
   end repeat
   
   
   repeat for each line tTest in the keys of tTestArray
      put tTest & comma & char 1 to -2 of tTestArray[tTest] & return after tTestList      
   end repeat
   return tTestList
end testSelected

command testAdd pType
   local tTestName, tExtension
   set the itemDel to slash
   switch pType
      case "stack"
         ask file "Please choose a filename for the new test." with the cTestFolder of stack "revPreferences"
         if the result is not "cancel" then
            put it into tTestName
            clone stack "test-template"
            set the name of it to item -1 of tTestName
            save stack (item -1 of tTestName) as (tTestName & ".livecode")
         end if
         break
      case "script"
         ask file "Please choose a filename for the new test." with the cTestFolder of stack "revPreferences"
         if the result is not "cancel" then
            put it into tTestName
            
            qualityGetTestExtension
            put the result into tExtension            
            
            put the cTestScriptTemplate of stack "livecodeTestInterface" into  url ("file:" & tTestName & tExtension) 
            launch document (tTestName & tExtension)
         end if
         break
   end switch
   testList
   //Temp fix as qualityGetTestTags closes stacks
   if pType is "stack" then
      open stack (tTestName & ".livecode")
      set the topLeft of stack (tTestName & ".livecode") to the topRight of stack "livecodeTestInterface"
   end if
end testAdd

command testOpen pNodeID
   local tTestPath, tTestExtension
   if pNodeID is a number then
      if the depth_of_node_ID_[pNodeID] of control "test list" stack "livecodeTestInterface" is 2 then
         put the filepath_of_node_ID_[pNodeID] of control "test list" stack "livecodeTestInterface"into tTestPath
      end if
   else
      put pNodeID into tTestPath
   end if
   
   set the itemDel to "."
   qualityGetTestExtension
   put the result into tTestExtension
   if the last item of tTestPath is "livecode" then
      open stack tTestPath
      edit the script of stack tTestPath
   else if the last item of tTestPath is (char 2 to -1 of tTestExtension) then
      launch document tTestPath
   end if
end testOpen

command versionList pFilter
   local tVersions, tLine, tPaths, tVersionLabel, tLocalGitHubPath
   local tVersionNumber, tCondition, tOperator
   local tVersionArray, tVersionIndex, tNodeID, tOrderedVersionList, tLicenseType
   
   put revLicenseType() into tLicenseType
   
   if pFilter is empty then put field "versionFilter" of card 1 of stack "livecodeTestInterface" into pFilter
   put the label of button "versionCondition" of card 1 of stack "livecodeTestInterface"  into tCondition
   
   dispatch "delete_nodeData" to control "version list" of card 1 of stack "livecodeTestInterface"    
   dispatch "renderTree" to control "version list" of card 1 of stack "livecodeTestInterface"
   
   qualityListVersions
   put the result into tVersions
   sort lines of tVersions descending
   
   qualityGetGitHubPath
   put the result into tLocalGitHubPath
   
   repeat for each line tVersion in tVersions      
      qualityGetVersionLabel tVersion
      put the result into tVersionLabel
      
      if tLicenseType is "community" then
         if word 2 of tVersionLabel is "community" or (tLocalGitHubPath is not empty and tVersion begins with tLocalGitHubPath) then
            put word 3 of tVersionLabel into tVersionNumber
            put the number of lines in the keys of tVersionArray[tVersionNumber] into tVersionIndex
            put tVersionLabel into tVersionArray[tVersionNumber][tVersionIndex +1]["label"]
            put tVersion into tVersionArray[tVersionNumber][tVersionIndex +1]["path"]
         end if
      else if tLicenseType is "commercial" then
         if word 2 of tVersionLabel is "community" or (tLocalGitHubPath is not empty and tVersion begins with tLocalGitHubPath) then
            
         else
            put word 2 of tVersionLabel into tVersionNumber
            put the number of lines in the keys of tVersionArray[tVersionNumber] into tVersionIndex
            put tVersionLabel into tVersionArray[tVersionNumber][tVersionIndex +1]["label"]
            put tVersion into tVersionArray[tVersionNumber][tVersionIndex +1]["path"]
         end if         
      end if     
   end repeat
   
   if tVersionArray is not empty then
      hide field "versionMessage" of card 1 of stack "livecodeTestInterface"
      hide button "versionSettings" of card 1 of stack "livecodeTestInterface"
      put 0 into tNodeID
      dispatch "delete_nodeData" to control "version list" of card 1 of stack "livecodeTestInterface"
      set the treeType of control "version list" of card 1 of stack "livecodeTestInterface" to empty
      set the firstIconCollapsed of control "version list" of card 1 of stack "livecodeTestInterface" to 99135
      set the firstIconExpanded of control "version list" of card 1 of stack "livecodeTestInterface" to 99136
      set the secondIconExpanded of control "version list" of card 1 of stack "livecodeTestInterface" to 33636
      set the secondIconCollapsed of control "version list" of card 1 of stack "livecodeTestInterface" to 33636
      set the useMultipleHilite of control "version list" of card 1 of stack "livecodeTestInterface" to true
      set the nonContiguousHilite of control "version list" of card 1 of stack "livecodeTestInterface" to true
      set the editNodeOnDoubleClick of control "version list" of card 1 of stack "livecodeTestInterface" to false
      set the useContextMenu of control "version list" of card 1 of stack "livecodeTestInterface" to false
      
      put the keys of tVersionArray into tOrderedVersionList
      sort lines of tOrderedVersionList descending
      if pFilter is empty then
         repeat for each line tVersionNumber in tOrderedVersionList
            add 1 to tNodeID
            dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
            set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 0
            set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
            
            if the number of elements in tVersionArray[tVersionNumber] <= 1 then
               set the useFirstIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
               set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to true
               set the nodeType_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "file"
               set the expanded_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "false"
               
               repeat for each line tVersionIndex in the keys of tVersionArray[tVersionNumber]
                  set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["label"]
                  set the filepath_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["path"]
                  
                  add 1 to tNodeID
                  dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                  set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["label"]
                  set the filepath_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["path"]
                  set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 1
                  set the useFirstIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
                  set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to true
                  set the nodeType_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "file"
               end repeat
            else               
               set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionNumber
               repeat for each line tVersionIndex in the keys of tVersionArray[tVersionNumber]
                  add 1 to tNodeID
                  dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                  set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["label"]
                  set the filepath_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["path"]
                  set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 1
                  set the useFirstIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
                  set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to true
                  set the nodeType_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "file"
               end repeat
            end if
         end repeat
      else
         ## Filtering required
         if tCondition is "search" then
            repeat for each line tVersionNumber in tOrderedVersionList
               if pFilter is empty or tVersionNumber contains pFilter then
                  add 1 to tNodeID
                  dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                  set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionNumber
                  set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 0
                  set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
                  
                  repeat for each line tVersionIndex in the keys of tVersionArray[tVersionNumber]
                     add 1 to tNodeID
                     dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                     set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["label"]
                     set the filepath_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["path"]
                     set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 1
                     set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to true
                     set the nodeType_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "file"
                  end repeat
               end if
            end repeat
         else if tCondition is "match" then
            repeat for each line tVersionNumber in tOrderedVersionList
               if tVersionNumber is pFilter then
                  add 1 to tNodeID
                  dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                  set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionNumber
                  set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 0
                  set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
                  
                  repeat for each line tVersionIndex in the keys of tVersionArray[tVersionNumber]
                     add 1 to tNodeID
                     dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                     set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["label"]
                     set the filepath_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["path"]
                     set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 1
                     set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to true
                     set the nodeType_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "file"
                  end repeat
               end if
            end repeat
         else if tCondition is "older than" or tCondition is "newer than" then
            if tCondition is "older than" then put "<" into tOperator
            if tCondition is "newer than" then put ">" into tOperator
            
            repeat for each line tVersionNumber in tOrderedVersionList
               if versionCompare(tVersionNumber,pFilter,tOperator) then
                  add 1 to tNodeID
                  dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                  set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionNumber
                  set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 0
                  set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
                  
                  repeat for each line tVersionIndex in the keys of tVersionArray[tVersionNumber]
                     add 1 to tNodeID
                     dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                     set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["label"]
                     set the filepath_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["path"]
                     set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 1
                     set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to true
                     set the nodeType_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "file"
                  end repeat
               end if
            end repeat
         else if tCondition is "stable" then
            repeat for each line tVersionNumber in tOrderedVersionList
               if tVersionNumber contains pFilter then
                  add 1 to tNodeID
                  dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                  set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionNumber
                  set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 0
                  set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to false
                  
                  repeat for each line tVersionIndex in the keys of tVersionArray[tVersionNumber]
                     put versionFormat(tVersionArray[tVersionNumber][tVersionIndex]["label"]) 
                     if  char -3 of versionFormat(tVersionArray[tVersionNumber][tVersionIndex]["label"]) is 3 and tVersionNumber contains pFilter then
                        add 1 to tNodeID
                        dispatch "new_node" to control "version list" of card 1 of stack "livecodeTestInterface"
                        set the name_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["label"]
                        set the filepath_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to tVersionArray[tVersionNumber][tVersionIndex]["path"]
                        set the depth_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to 1
                        set the useSecondIcon_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to true
                        set the nodeType_of_node_ID_[tNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" to "file"
                     end if
                  end repeat
               end if
            end repeat
         end if 
      end if
      dispatch "renderTree" to control "version list" of card 1 of stack "livecodeTestInterface"
   else
      set the text of field "versionMessage" of card 1 of stack "livecodeTestInterface" to "This is where your versions will show. It is empty at the moment which may mean you do not have any versions of LiveCode installed or that your settings are not correct."
      show field "versionMessage" of card 1 of stack "livecodeTestInterface"
      show button "versionSettings" of card 1 of stack "livecodeTestInterface"
   end if   
end versionList
command versionSelectAll pValue
   local tList
   if pValue then
      repeat for each line tID in the nodeIDs of control "version list"
         put tID & return after tList
      end repeat
      delete the last char of tList
      set the hilitedNodeIDs of control "version list" to tList
      set the cSelectedNodeIDs of control "version list" to tList
   else
      set the hilitedNodeIDs of control "version list" to empty
      set the cSelectedNodeIDs of control "version list" to empty
   end if
   updateDisplay
end versionSelectAll

command versionSelectChildren pNodeID
   local tCurrentSelection, tChildren
   if the commandKey is down then
      put the cSelectedNodeIDs of control "version list" of card 1 of stack "livecodeTestInterface" into tCurrentSelection
   end if
   
   if the depth_of_node_ID_[pNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" is 0 then
      put the children_of_node_ID_[pNodeID] of control "version list" of card 1 of stack "livecodeTestInterface" into tChildren
      replace comma with return in tChildren
   end if
   put pNodeID & return before tChildren
   
   repeat for each line tChild in tChildren
      if tChild is not among the lines of tCurrentSelection then
         put return & tChildren after tCurrentSelection
      end if
   end repeat   
   set the cSelectedNodeIDs of control "version list" of stack "livecodeTestInterface" to tCurrentSelection
   set the hilitedNodeIDs of control "version list" of card 1 of stack "livecodeTestInterface" to tCurrentSelection
end versionSelectChildren

function versionSelected
   local tNodes, tVersionList
   put the cSelectedNodeIDs of control "version list" of card 1 of stack "livecodeTestInterface" into tNodes
   repeat for each line tNode in tNodes
      if the depth_of_node_ID_[tNode] of control "version list" stack "livecodeTestInterface" is 1 then
         if the filepath_of_node_ID_[tNode] of control "version list" stack "livecodeTestInterface" is not among the lines of tVersionList then
            put the filepath_of_node_ID_[tNode] of control "version list" stack "livecodeTestInterface" & return after tVersionList
         end if
      end if
   end repeat
   if the last char of tVersionList is return then delete the last char of tVersionList
   return tVersionList 
end versionSelected

command platformList pFilter
   local tPlatforms, tKey, tLine, tNodeID
   qualityListPlatforms
   put the result into tPlatforms
   
   if pFilter is empty then put the label of button "platformFilter" of card 1 of stack "livecodeTestInterface"  into pFilter
   if pFilter is "mobile" then put "Android,iPhone,iPad" into pFilter
   if pFilter is "iOS" then put "iPhone,iPad" into pFilter
   
   if tPlatforms is not empty then
      hide field "platformMessage" of card 1 of stack "livecodeTestInterface"
      hide button "platformSettings" of card 1 of stack "livecodeTestInterface"
      put 0 into tNodeID
      dispatch "delete_nodeData" to control "platform list" of card 1 of stack "livecodeTestInterface"
      set the treeType of control "platform list" of card 1 of stack "livecodeTestInterface" to empty
      set the firstIconCollapsed of control "platform list" of card 1 of stack "livecodeTestInterface" to 99135
      set the firstIconExpanded of control "platform list" of card 1 of stack "livecodeTestInterface" to 99136
      --      set the fileIcon of control "platform list" of card 1 of stack "livecodeTestInterface" to 33644
      set the secondIconCollapsed of control "platform list" of card 1 of stack "livecodeTestInterface" to 33644
      set the secondIconExpanded of control "platform list" of card 1 of stack "livecodeTestInterface" to 33644
      set the useMultipleHilite of control "platform list" of card 1 of stack "livecodeTestInterface" to true
      set the nonContiguousHilite of control "platform list" of card 1 of stack "livecodeTestInterface" to true
      set the editNodeOnDoubleClick of control "platform list" of card 1 of stack "livecodeTestInterface" to false
      set the useContextMenu of control "platform list" of card 1 of stack "livecodeTestInterface" to false
      
      repeat for each line tPlatform in the keys of tPlatforms
         if pFilter is "all" or pFilter is empty or tPlatform is among the items of pFilter then
            add 1 to tNodeID
            dispatch "new_node" to control "platform list" of card 1 of stack "livecodeTestInterface"
            set the name_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to tPlatform
            set the depth_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to 0
            set the useSecondIcon_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to false
            
            repeat for each line tTarget in tPlatforms [tPlatform]
               add 1 to tNodeID
               dispatch "new_node" to control "platform list" of card 1 of stack "livecodeTestInterface"
               set the name_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to tTarget
               set the depth_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to 1
               set the useFirstIcon_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to false
               set the useSecondIcon_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to true
               set the nodeType_of_node_ID_[tNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" to "file"
            end repeat
         end if
      end repeat
      dispatch "renderTree" to control "platform list" of card 1 of stack "livecodeTestInterface"   
      
      if the hilite of button "platformSelectAll" of card 1 of stack "livecodeTestInterface"  then
         platformSelectAll true
      end if
   else
      set the text of field "platformMessage" of card 1 of stack "livecodeTestInterface" to "This is where your available target platforms will show. It is empty at the moment which may mean that you are not set up for deployment or that your settings are not correct."
      show field "platformMessage" of card 1 of stack "livecodeTestInterface"
      show button "platformSettings" of card 1 of stack "livecodeTestInterface"
   end if
end platformList

command platformSelectAll pValue
   local tList
   if pValue then
      repeat for each line tID in the nodeIDs of control "platform list"
         put tID & return after tList
      end repeat
      delete the last char of tList
      set the hilitedNodeIDs of control "platform list" to tList
      set the cSelectedNodeIDs of control "platform list" to tList
   else
      set the hilitedNodeIDs of control "platform list" to empty
      set the cSelectedNodeIDs of control "platform list" to empty
   end if
   updateDisplay
end platformSelectAll

command platformSelectChildren pNodeID
   local tCurrentSelection, tChildren
   if the commandKey is down then
      put the cSelectedNodeIDs of control "platform list" of card 1 of stack "livecodeTestInterface" into tCurrentSelection
   end if
   
   if the depth_of_node_ID_[pNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" is 0 then
      put the children_of_node_ID_[pNodeID] of control "platform list" of card 1 of stack "livecodeTestInterface" into tChildren
      replace comma with return in tChildren
   end if
   put pNodeID & return before tChildren
   repeat for each line tChild in tChildren
      if tChild is not among the lines of tCurrentSelection then
         put return & tChildren after tCurrentSelection
      end if
   end repeat       
   set the cSelectedNodeIDs of control "platform list" of card 1 of stack "livecodeTestInterface" to tCurrentSelection
   set the hilitedNodeIDs of control "platform list" of card 1 of stack "livecodeTestInterface" to tCurrentSelection
end platformSelectChildren

function platformSelected
   local tNodes, tPlatformList
   put the cSelectedNodeIDs of control "platform list" of stack "livecodeTestInterface" into tNodes
   repeat for each line tNode in tNodes
      if the depth_of_node_ID_[tNode] of control "platform list" of stack "livecodeTestInterface" is 1 then
         if the name_of_node_ID_[tNode] of control "platform list" of stack "livecodeTestInterface" is not among the lines of tPlatformList then
            put the name_of_node_ID_[tNode] of control "platform list" of stack "livecodeTestInterface" & return after tPlatformList
         end if
      end if
   end repeat
   if the last char of tPlatformList is return then delete the last char of tPlatformList
   return tPlatformList   
end platformSelected

command workListStart
   local tTestCount, tTests, tVersions, tPlatforms
   ## Check the output folder exists
   if the cTestCache of stack "revPreferences" is empty then
      answer "Please select an output folder for your tests"
      go to card "settings"
      exit workListStart
   else 
      
   end if
   
   put empty into sFullTestResults
   set the dgData of group "testResults" of card "main" of stack "livecodeTestInterface" to empty
   set the dgData of group "subtestResults" of card 1 of stack "subtestResults" to empty
   
   put testSelected() into tTests
   put versionSelected() into tVersions
   put platformSelected() into tPlatforms
   qualityReset
   
   qualityWorklistCreate tTests, tVersions, tPlatforms, the long id of this card
   set the text of field "WorkListID" of stack "livecodeTestInterface" to the result
   
   qualityWorkListGetCount field "WorkListID" of stack "livecodeTestInterface"
   put the result into tTestCount
   
   put "0 of" && tTestCount into field "testProgressCount" of stack "livecodeTestInterface"
   set the endValue of scrollbar "testProgress" of stack "livecodeTestInterface" to tTestCount
   set the label of button "testRun" of stack "livecodeTestInterface" to "Stop"
   
   // set global that we are running in the test system
   revSetTestEnvironment "true"
   revSetOverrideRuntimePath empty
   qualityWorklistStart the text of field "WorkListID" of stack "livecodeTestInterface"
end workListStart

on qualityHandleWorkListMessage pMessage
   local tChangeDetails, tCompleted
   put pMessage into field "status" of card "main" of stack "livecodeTestInterface"
   
   updateProgress 
   if item 1 of pMessage is "worklist Changed" then
      qualityWorkListGetItemDetails item 2 of pMessage, item 3 of pMessage
      put the result into tChangeDetails
      displayResults tChangeDetails, item 2 of pMessage, item 3 of pMessage, item 4 to -1 of pMessage
   else if item 1 of pMessage is "worklist finished" then
      set the label of button "testRun" of card "main" of stack "livecodeTestInterface" to "Start"  
      --updateDisplay
      --showFailsOnly the hilite of button "showFails" of card "main" of stack "livecodeTestInterface"
      set the thumbPosition of scrollbar "testProgress" of card "main" of stack "livecodeTestInterface" to 0
      revSetTestEnvironment "false"
   end if
end qualityHandleWorkListMessage

/*on displayResults pDetails, pWorkListID,pTestNumber, pTestIndex   
local tCount,tTestCount, tCurrentData, tTestName, tTestID, tSortColumn
local tResultsArray, tVersion, tReport, tComment, tReportArray
local tStartTime, tCurrentTime, tTestStart, tTestEnd

put the dgData of group "callbackResults" into tCurrentData

put the dgProps["sort by column"] of group "callbackResults" into tSortColumn

put 0 into tCount
put 0 into tTestCount
add 1 to tCount
put item 2 of pTestIndex into tTestName

put pDetails[pWorkListID][pTestNumber]["platformid"] into tResultsArray[tCount]["platform"]
put pDetails[pWorkListID][pTestNumber]["versionid"] into tVersion
qualityGetTestLabel pDetails[pWorkListID][pTestNumber]["testID"]
put the result into tTestName
put the result into tResultsArray[tCount]["Test Name"]
qualityGetVersionLabel tVersion
put the result into tResultsArray[tCount]["version"]

put the date && the time into tResultsArray[tCount]["Date"]

put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["status"] into tResultsArray[tCount]["status"]
put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["report"] into tReport
put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["SetupComment"] into tComment

put pWorkListID into tResultsArray[tCount]["worklist"]

// HSC changed the following two lines
--put pTestNumber into tResultsArray[tCount]["test"]
put (lineOffset(pTestIndex,the keys of pDetails[pWorkListID][pTestNumber]["TestResults"]) * pTestNumber) into tResultsArray[tCount]["test"]
put item 1 of pTestIndex into tResultsArray[tCount]["subtest"]
put  tComment into tResultsArray[tCount]["description"]

replace "--" with empty in tReport
local tLogCount, tPass, tLog
put empty into tPass

repeat for each line tLine in tReport
   if word 1 of tLine is not "log" then
      put word 2 to -1 of tLine into tReportArray[word 1 of tLine]
   else
      add 1 to tLogCount
      if tPass is not "fail" then
         if tLine contains "fail" then
            put "fail" into tPass
         else if tLine contains "pass" then
            put "pass" into tPass
         end if
      end if
      
      if word 2 of tLine contains "test-begin" then 
         put word -1 of tLine into tTestStart
      else if word 2 of tLine contains "test-end" then
         put word -1 of tLine into tTestEnd
      end if 
      
      if word 2 of tLine contains "event-begin" then 
         if tStartTime is empty or word -1 of tLine < tStartTime then
            put word -1 of tLine into tStartTime
         end if
      end if
      
      if word 2 of tLine contains "event-end" then
         if tCurrentTime is empty or word -1 of tLine > tCurrentTime then
            put word -1 of tLine into tCurrentTime
         end if
      end if 
      put word 2 to -1 of tLine & return after tLog
   end if
end repeat
put tPass into tResultsArray[tCount]["pass"]

put tLog into tResultsArray[tCount]["log"]
replace quote with empty in tStartTime
replace quote with empty in tCurrentTime   
replace quote with empty in tTestStart
replace quote with empty in tTestEnd  

if tCurrentTime is not empty and tStartTime is not empty then
   put tCurrentTime - tStartTime into tResultsArray[tCount]["time"]
else
   put tTestEnd - tTestStart into tResultsArray[tCount]["time"]
end if

local tLastLine
repeat for each line tDGIndex in the keys of tCurrentData
   if tCurrentData[tDGIndex]["Test Name"] is tTestName and tCurrentData[tDGIndex]["subtest"] is item 1 of pTestIndex  and tCurrentData[tDGIndex]["version"]  is tResultsArray[tCount]["version"]  and tCurrentData[tDGIndex]["platform"] is tResultsArray[tCount]["platform"] then
      -- and tCurrentData[tDGIndex]["test"] is pTestNumber then
      --and tCurrentData[tDGIndex]["worklist"] is pWorkListID  then
      put tDGIndex into tLastLine
      exit repeat
   end if
end repeat   

if tLastLine is not empty and tLastLine is not 0 then
   set the dgDataOfIndex[ tLastLine ] of group "callbackResults" to tResultsArray[1]
else
   put the dgNumberOfLines of group "callbackResults" into tLastLine
   repeat with x = 1 to the number of elements of tResultsArray
      dispatch "AddData" to group "callbackResults" with tResultsArray[x], tLastLine + 1
   end repeat
end if

set the dgProps["sort by column"] of group "callbackResults" to tSortColumn

end displayResults*/

on displayResults pDetails, pWorkListID,pTestNumber, pTestIndex   
   local tTopLevelResults, tTestID, tTestName, tResult, tDescription, tLineNumber, tReport
   local tSubTestLabel, tPass
   
   --put the dgData of group "testResults" of card "main" of stack "livecodeTestInterface" into tTopLevelResults
   put getDisplayResults()  into tTopLevelResults
   
   //Test Name
   put pDetails[pWorkListID][pTestNumber]["testID"] into tTestID
   qualityGetTestLabel tTestID
   put the result into tTestName   
   
   put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["SetupComment"] into tDescription
   
   ## Find the line number to update
   put 0 into tLineNumber
   repeat for each line tKey in the keys of tTopLevelResults
      if tTopLevelResults[tKey]["test_id"] is tTestID and tTopLevelResults[tKey]["description"] is tDescription then
         put tKey into tLineNumber
         exit repeat
      end if
   end repeat
   if tLineNumber is empty or tLineNumber is 0 then
      put the number of lines in the keys of tTopLevelResults + 1 into tLineNumber
   end if
   
   // Result may be set already
   put tTopLevelResults[tLineNumber]["result"] into tResult
   
   put tTestName into tTopLevelResults[tLineNumber]["Name"]
   put tTestID into tTopLevelResults[tLineNumber]["test_id"]
   put item 1 of pTestIndex into tTopLevelResults[tLineNumber]["subtest name"]
   put item 1 of pTestIndex into tTopLevelResults[tLineNumber]["subtest_id"]
   
   // Description
   put tDescription into tTopLevelResults[tLineNumber]["description"]
   
   // Status
   put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["status"] into tTopLevelResults[tLineNumber]["Status"]
   
   // Result
   put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["Report"] into tReport
   repeat for each line tLine in tReport
      if tResult is not "fail" then
         if tLine contains "fail" then
            put "fail" into tResult
         else if tLine contains "pass" then
            put "pass" into tResult
         end if
      end if
   end repeat
   put tResult into tTopLevelResults[tLineNumber]["result"]
   
   --put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["SetupComment"] into tSubTestLabel
   put item 1 of pTestIndex into tSubTestLabel
   ## Also update the sFullTestResults array
   put item 1 of pTestIndex into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["Name"]
   put pDetails[pWorkListID][pTestNumber]["platformID"]
   put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["status"] into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["Status"]
   put tTestID into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["test_id"]
   put tDescription into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["description"]
   
   qualityGetVersionLabel pDetails[pWorkListID][pTestNumber]["versionID"]
   put the result into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["version"]
   
   if pDetails[pWorkListID][pTestNumber]["DiffIDs"]  is not empty then
      put pDetails[pWorkListID][pTestNumber]["DiffIDs"] into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["sub_test_id"]
   else
      put pTestIndex into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["sub_test_id"]
   end if
   
   // Result
   local tTestStart, tTestEnd, tStartTime, tCurrentTime
   
   if pDetails[pWorkListID][pTestNumber]["DataType"] is not "diffs" then
      put "absolute" into sFullTestResults [tTestName][tSubTestLabel]["test type"]
      put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["Report"] into tReport
      replace quote with empty in tReport
      put "pass" into tPass
      repeat for each line tLine in tReport
         if tPass is not "fail" then
            if tLine contains "fail" then
               put "fail" into tPass
            else if tLine contains "pass" then
               put "pass" into tPass
            end if
         end if
         
         if word 2 of tLine contains "test-begin" then 
            put word -1 of tLine into tTestStart
         else if word 2 of tLine contains "test-end" then
            put word -1 of tLine into tTestEnd
         end if 
         
         if word 2 of tLine contains "event-begin" then 
            if tStartTime is empty or word -1 of tLine < tStartTime then
               put word -1 of tLine into tStartTime
            end if
         end if
         
         if word 2 of tLine contains "event-end" then
            if tCurrentTime is empty or word -1 of tLine > tCurrentTime then
               put word -1 of tLine into tCurrentTime
            end if
         end if 
         --put word 2 to -1 of tLine & return after tLog
         --end if
      end repeat
      
      if "failed" is among the items of pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["status"] then
         put "fail" into tPass
      end if
      put tPass into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["result"]
      if tCurrentTime is not empty and tStartTime is not empty then
         put tCurrentTime - tStartTime into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["time"]
      else
         put tTestEnd - tTestStart into sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["time"]
      end if
      
      // Work out the maximum time
      if sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["time"] > tTopLevelResults[tLineNumber]["time"] then
         put sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["time"] into tTopLevelResults[tLineNumber]["Time"]
      end if
      
      //Work out time difference level
      if sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["time"] < tTopLevelResults[tLineNumber]["min_time"] or tTopLevelResults[tLineNumber]["min_time"] is empty  then
         put sFullTestResults[tTestName][tSubTestLabel][pTestNumber]["time"] into tTopLevelResults[tLineNumber]["min_time"]
      end if
      
      if abs(tTopLevelResults[tLineNumber]["Time"] - tTopLevelResults[tLineNumber]["min_time"]) < 100 then
         
      else if abs(tTopLevelResults[tLineNumber]["Time"] - tTopLevelResults[tLineNumber]["min_time"]) < 500 then
         
      else
         
      end if
   else
      // Difference Test
      local tCurrentData, tResultIndex, tCurrentKeys
      
      put pDetails[pWorkListID][pTestNumber]["TestResults"][pTestIndex]["Report"] into tReport
      
      // Only care about comparison
      local tSubTestName, tVersionList, tVersion, tVersion1, tVersion2
      put item 1 of pTestIndex into tSubTestName
      put item 2 of pTestIndex into tTestName
      
      put the keys of sFullTestResults[tTestName][tSubTestName] into tCurrentKeys
      sort lines of tCurrentKeys
      
      put sFullTestResults[tTestName][tSubTestName][line 1 of tCurrentKeys] into tCurrentData
      put "comparison" into sFullTestResults [tTestName][tSubTestLabel]["test type"]
      
      put the keys of tReport into tVersionList
      put 0 into tResultIndex
      repeat for each line tVersion in tVersionList
         add 1 to tResultIndex
         put item 1 of tVersion into tVersion1
         put item 2 of tVersion into tVersion2
         set the itemDel to "_"
         put item 1 of tVersion1 into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["Platform 1"]
         put item 2 of tVersion1 into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["Version 1"]
         put item 1 of tVersion2 into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["Platform 2"]
         put item 2 of tVersion2 into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["Version 2"]
         set the itemDel to comma
         
         put tCurrentData["description"] into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["description"]
         put tCurrentData["status"] into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["status"]
         put tCurrentData["time"] into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["time"]
         put tCurrentData["result"] into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["result"]
         --put tTestName into sFullTestResults [tTestName][tSubTestLabel][tResultIndex]["name"]
         put tSubTestName into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["name"]
         put tCurrentData["test_id"] into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["test_id"]
         put "diff" into  sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["type"]
         
         if tReport[tVersion]["eval_output"][1] is true then
            put "pass" into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["result"]
         else if tReport[tVersion]["eval_output"][1] is false then
            put "fail" into sFullTestResults [tTestName][tSubTestLabel][pTestNumber + tResultIndex]["result"]
         end if
      end repeat
   end if
   
   // Result
   --set the dgData of group "testResults" of card "main" of stack "livecodeTestInterface" to tTopLevelResults
   displayResultsFromArray
end displayResults

command displaySubTestResults pTestID, pSubTestID
   local tSubTestResults, tDisplay, tIndex, tTestType
   
   put sFullTestResults[pTestID][pSubTestID] into tSubTestResults
   put tSubTestResults["test type"] into tTestType
   
   put 0 into tIndex
   repeat for each line tSubTest in the keys of tSubTestResults
      if tTestType is not "comparison" then
         add 1 to tIndex
         put tSubTestResults[tSubTest] into tDisplay[tIndex]
      else if tTestType is "comparison" AND tSubTestResults[tSubTest]["type"] is "diff" then
         add 1 to tIndex
         put tSubTestResults[tSubTest] into tDisplay[tIndex]         
      end if
   end repeat
   
   if tTestType is "absolute" then
      put pTestID & ":" && tSubTestResults[tSubTest]["description"] into field "title" of card 1 of stack "subtestResults"
      set the dgData of group "subtestResults" of card 1 of stack "subtestResults" to tDisplay
      --lock messages
      lock screen
      set the width of stack "subtestResults" to the width of this stack - 200
      set the height of stack "subtestResults" to the height of this stack - 300
      set the loc of stack "subtestResults" to the loc of this stack
      unlock screen
      modeless stack "subtestResults"
   else
      put pTestID & ":" && tSubTestResults[tSubTest]["description"] into field "title" of card 1 of stack "comparisonSubtestResults"
      set the dgData of group "subtestResults" of card 1 of stack "comparisonSubtestResults" to tDisplay
      --lock messages
      lock screen
      set the width of stack "comparisonSubtestResults" to the width of this stack - 200
      set the height of stack "comparisonSubtestResults" to the height of this stack - 300
      set the loc of stack "comparisonSubtestResults" to the loc of this stack
      unlock screen
      modeless stack "comparisonSubtestResults"
   end if
   --unlock messages
end displaySubTestResults

command updateProgress
   local tCompleted, tTestCount
   
   qualityWorkListGetProgress field "WorkListID" of card "Main" of stack "livecodeTestInterface"  
   put the result into tCompleted
   
   qualityWorkListGetCount field "WorkListID" of card "Main" of stack "livecodeTestInterface"  
   put the result into tTestCount
   put tCompleted && "of" && tTestCount into field "testProgressCount" of card "Main" of stack "livecodeTestInterface"  
   
   set the thumbPosition of scrollbar "testProgress" of card "Main" of stack "livecodeTestInterface" to tCompleted
end updateProgress

on updateDisplay
   local tTestCount, tTests, tVersions, tPlatforms, tMessage
   put testSelected() into tTests
   put versionSelected() into tVersions
   put platformSelected() into tPlatforms
   
   qualityGetCount tTests, tVersions, tPlatforms
   put the result into tTestCount
   
   if tTestCount is "0" then
      set the textColor of field "count" of stack "livecodeTestInterface" to 255,128,0
      set the backgroundColor of button "testRun" of stack "livecodeTestInterface" to 255,128,0
      disable button "testRun" of stack "livecodeTestInterface"
      put "You have" into tMessage
      if tTests is empty then put " no tests selected," after tMessage
      if tVersions is empty then put " no versions selected," after tMessage
      if tPlatforms is empty then put " no target platforms selected" after tMessage
      if the last char of tMessage is comma then delete the last char of tMessage
      put "." after tMessage
      put tMessage into field "count" of stack "livecodeTestInterface"
   else
      set the textColor of field "count" of stack "livecodeTestInterface" to 0,128,64
      set the backgroundColor of button "testRun" of stack "livecodeTestInterface" to 0,128,64
      enable button "testRun" of stack "livecodeTestInterface"
      put "0 of" && tTestCount into field "testProgressCount" of stack "livecodeTestInterface"
      put tTestCount && "tests to run" into field "count" of stack "livecodeTestInterface"
   end if
end updateDisplay

on resizeStack
 send "layoutCard" to me in 0 milliseconds
end resizeStack

command layoutCard
   local tStackWidth, tStackHeight, tTopHeight, tBottomHeight
   
   put the width of stack "livecodeTestInterface" into tStackWidth
   put the height of stack "livecodeTestInterface" into tStackHeight
   put round(min(tStackHeight/2,400)) into tTopHeight
   put tStackHeight - tTopHeight into tBottomHeight
   
   set the topLeft of field "title" of card "main" of stack "livecodeTestInterface"  to 5,5
   set the topRight of button "settings" of card "main" of stack "livecodeTestInterface" to tStackWidth-5,5
   set the topRight of button "testAdd" of card "main" of stack "livecodeTestInterface"  to the Left of button "settings" of card "main" of stack "livecodeTestInterface"  - 5, 5
   --set the topRight of button "refresh" of card "main" of stack "livecodeTestInterface" to the left of button "testAdd" of card "main" of stack "livecodeTestInterface"  - 5,5
   
   set the width of group "test list" of card "main" of stack "livecodeTestInterface"  to round(tStackWidth/3)
   set the width of group "version list" of card "main" of stack "livecodeTestInterface"  to round(tStackWidth/3)
   set the width of group "platform list" of card "main" of stack "livecodeTestInterface"  to round(tStackWidth/3)
   set the height of group "test list" of card "main" of stack "livecodeTestInterface"  to tTopHeight-150
   set the height of group "version list" of card "main" of stack "livecodeTestInterface"  to tTopHeight-150
   set the height of group "platform list" of card "main" of stack "livecodeTestInterface"  to tTopHeight-150
   
   set the topLeft of group "test list" of card "main" of stack "livecodeTestInterface"  to 0,90
   set the topLeft of group "version list" of card "main" of stack "livecodeTestInterface"  to the topRight of group "test list" of card "main" of stack "livecodeTestInterface" 
   set the topLeft of group "platform list" of card "main" of stack "livecodeTestInterface"  to the topRight of group "version list" of card "main" of stack "livecodeTestInterface" 
   
   set the width of field "testMessage" of card "main" of stack "livecodeTestInterface" to round(tStackWidth/3)
   set the width of field "versionMessage" of card "main" of stack "livecodeTestInterface"  to round(tStackWidth/3)
   set the width of field "platformMessage" of card "main" of stack "livecodeTestInterface"  to round(tStackWidth/3)
   set the height of field "testMessage" of card "main" of stack "livecodeTestInterface"  to tTopHeight-150
   set the height of field "versionMessage" of card "main" of stack "livecodeTestInterface"  to tTopHeight-150
   set the height of field "platformMessage" of card "main" of stack "livecodeTestInterface"  to tTopHeight-150
   set the topLeft of field "testMessage" of card "main" of stack "livecodeTestInterface"  to 0,90
   set the topLeft of field "versionMessage" of card "main" of stack "livecodeTestInterface"  to the topRight of group "test list" of card "main" of stack "livecodeTestInterface" 
   set the topLeft of field "platformMessage"of card "main" of stack "livecodeTestInterface"   to the topRight of group "version list" of card "main" of stack "livecodeTestInterface" 
   set the bottomRight of button "testSettings" of card "main" of stack "livecodeTestInterface"  to the right of group "test list" of card "main" of stack "livecodeTestInterface"  - 20, the bottom of group "test list" of card "main" of stack "livecodeTestInterface"  - 20
   set the bottomRight of button "versionSettings" of card "main" of stack "livecodeTestInterface"  to the right of group "version list" of card "main" of stack "livecodeTestInterface"  - 20, the bottom of group "version list" of card "main" of stack "livecodeTestInterface"  - 20
   set the bottomRight of button "platformSettings" of card "main" of stack "livecodeTestInterface"  to the right of group "platform list" of card "main" of stack "livecodeTestInterface"  - 20, the bottom of group "platform list" of card "main" of stack "livecodeTestInterface"  - 20
   
   set the bottomRight of field "testFilter" of card "main" of stack "livecodeTestInterface"  to the Right of group "test list" of card "main" of stack "livecodeTestInterface"  - 5, the top of group "test list" of card "main" of stack "livecodeTestInterface"  - 3
   set the bottomRight of field "versionFilter" of card "main" of stack "livecodeTestInterface"  to the Right of group "version list" of card "main" of stack "livecodeTestInterface"  - 5, the top of group "version list" of card "main" of stack "livecodeTestInterface"  - 3
   set the bottomRight of button "versionCondition" of card "main" of stack "livecodeTestInterface"  to the left of field "versionFilter" of card "main" of stack "livecodeTestInterface"  - 5, the top of group "version list" of card "main" of stack "livecodeTestInterface"  - 3
   set the bottomRight of button "platformFilter" of card "main" of stack "livecodeTestInterface"  to the right of group "platform list" of card "main" of stack "livecodeTestInterface"  - 5, the top of group "platform list" of card "main" of stack "livecodeTestInterface"  - 3
   
   set the topLeft of field "test label" of card "main" of stack "livecodeTestInterface"  to 10,35
   set the topLeft of field "version label" of card "main" of stack "livecodeTestInterface"  to the left of group "version list" of card "main" of stack "livecodeTestInterface",35
   set the topLeft of field "platform label" of card "main" of stack "livecodeTestInterface"  to the left of group "platform list" of card "main" of stack "livecodeTestInterface" ,35
   
   set the topRight of button "refreshTests" of card "main" of stack "livecodeTestInterface" to the right of group "test list" of card "main" of stack "livecodeTestInterface",35
   set the topRight of button "refreshVersions" of card "main" of stack "livecodeTestInterface" to the right of group "version list" of card "main" of stack "livecodeTestInterface",35
   set the topRight of button "refreshPlatforms" of card "main" of stack "livecodeTestInterface" to the right of group "platform list" of card "main" of stack "livecodeTestInterface",35
   set the topRight of button "testAdd" of card "main" of stack "livecodeTestInterface" to the topLeft of button "refreshTests" of card "main" of stack "livecodeTestInterface"
   
   set the topLeft of button "testSelectAll" of card "main" of stack "livecodeTestInterface"  to 10,62
   set the topLeft of button "versionSelectAll" of card "main" of stack "livecodeTestInterface" to the left of field "version label" of card "main" of stack "livecodeTestInterface"  + 5,62
   set the topLeft of button "platformSelectAll" of card "main" of stack "livecodeTestInterface"  to the left of field "platform label" of card "main" of stack "livecodeTestInterface"  + 5,62
   
   set the width of graphic "v1" of card "main" of stack "livecodeTestInterface"  to tStackWidth
   set the topLeft of graphic "v1" of card "main" of stack "livecodeTestInterface"  to 0,30
   set the width of graphic "v2" of card "main" of stack "livecodeTestInterface"  to tStackWidth
   set the topLeft of graphic "v2" of card "main" of stack "livecodeTestInterface"  to 0,60
   set the left of graphic "h1" of card "main" of stack "livecodeTestInterface"  to the left of group "version list" of card "main" of stack "livecodeTestInterface" 
   set the left of graphic "h2" of card "main" of stack "livecodeTestInterface"  to the left of group "platform list" of card "main" of stack "livecodeTestInterface" 
   
   set the topLeft of field "testProgressCount" of card "main" of stack "livecodeTestInterface"  to 5,the bottom of group "test list" of card "main" of stack "livecodeTestInterface"  +10
   set the topLeft of scrollbar "testProgress" of card "main" of stack "livecodeTestInterface"  to the right of field "testProgressCount" of card "main" of stack "livecodeTestInterface" ,the bottom of group "test list" of card "main" of stack "livecodeTestInterface"  + 13
   set the topRight of button "testRun" of card "main" of stack "livecodeTestInterface"  to tStackWidth-5, the bottom of group "test list" of card "main" of stack "livecodeTestInterface"  + 5
   set the topRight of field "count" of card "main" of stack "livecodeTestInterface"  to the topLeft of button "testRun" of card "main" of stack "livecodeTestInterface" 
   
   set the width of group "testResults" of card "main" of stack "livecodeTestInterface"  to tStackWidth
   set the height of group "testResults" of card "main" of stack "livecodeTestInterface"  to tBottomHeight
   set the topLeft of group "testResults" of card "main" of stack "livecodeTestInterface"  to 0,tTopHeight
   set the bottomLeft of button "showFailsOnly" of card "main" of stack "livecodeTestInterface" to the topLeft of group "testResults" of card "main" of stack "livecodeTestInterface"
   
   --set the bottomLeft of field "worklistID" of card "main" of stack "livecodeTestInterface"  to 5,(tStackHeight - 5)/2
   --set the topLeft of field "status" of card "main" of stack "livecodeTestInterface"  to the right of field "workListID" of card "main" of stack "livecodeTestInterface"  + 5, the top of field "worklistID" of card "main" of stack "livecodeTestInterface" 
end layoutCard

function versionCompare pVersion1,pVersion2,pCondition  
   put versionFormat(pVersion1) into pVersion1
   put versionFormat(pVersion2) into pVersion2
   return value(pVersion1 && pCondition && pVersion2)
end versionCompare

function versionFormat pVersion
   local tNumber, tType, tFormattedNumber
   if word 1 of pVersion is "LiveCode" then
      delete word 1 of pVersion
   end if
   
   if word 1 of pVersion is "Community" then
      delete word 1 of pVersion
   end if
   
   put word 1 pVersion into tNumber
   put word 2 of pVersion into tType
   
   ##Format number into a 9 digit number
   set the itemDel to "."
   put format("%02s",item 1 of tNumber) into tFormattedNumber
   put format("%02s",item 2 of tNumber) after tFormattedNumber
   put format("%02s",item 3 of tNumber) after tFormattedNumber
   
   replace "(" with empty in tType
   replace ")" with empty in tType
   if tType is empty then
      ## Assume gm
      put "301" after tFormattedNumber
   else
      if word 1 of tType is "dp" then
         put "2" after tFormattedNumber
      else if word 1 of tType is "rc" then
         put "1" after tFormattedNumber
      end if
      put format("%02s",word 2 of tType) after tFormattedNumber
   end if
   return tFormattedNumber
end versionFormat

on displayResultsFromArray
   local tTestResults, tIndex, tDisplayData, tSubTestIndex
   
   put sFullTestResults into tTestResults
   
   set the dgData of group "testResults" of card "Main" of stack "livecodeTestInterface" to empty
   
   put 0 into tIndex
   repeat for each line tTest in the keys of  tTestResults
      if tTest is not empty then
         repeat for each line tSubTest in the keys of tTestResults[tTest]
            put line 1 of the keys of tTestResults[tTest][tSubtest] into tSubTestIndex
            if tSubTestIndex is not a number then put line 2 of the keys of tTestResults[tTest][tSubtest] into tSubTestIndex
            if not the hilite of button "showFailsOnly" OR (the hilite of button "showFailsOnly" and tTestResults[tTest][tSubtest][tSubTestIndex]["result"] is not "pass") then
               add 1 to tIndex
               put tTest into tDisplayData[tIndex]["name"]
               put tTestResults[tTest][tSubtest][tSubTestIndex]["description"] into tDisplayData[tIndex]["description"]
               put tTestResults[tTest][tSubtest][tSubTestIndex]["status"] into tDisplayData[tIndex]["status"]
               put tTestResults[tTest][tSubtest][tSubTestIndex]["time"] into tDisplayData[tIndex]["time"]
               put tTestResults[tTest][tSubtest][tSubTestIndex]["result"] into tDisplayData[tIndex]["result"]
               put tTestResults[tTest][tSubtest][tSubTestIndex]["test_id"] into tDisplayData[tIndex]["test_id"]
               put tTestResults[tTest][tSubtest][tSubTestIndex]["name"] into tDisplayData[tIndex]["subtest name"]
            end if
         end repeat
      end if
   end repeat
   
   put tDisplayData into sDisplayResults
   set the dgData of group "testResults" of card "Main" of stack "livecodeTestInterface" to tDisplayData
end displayResultsFromArray

function getDisplayResults
   return sDisplayResults
end getDisplayResults
