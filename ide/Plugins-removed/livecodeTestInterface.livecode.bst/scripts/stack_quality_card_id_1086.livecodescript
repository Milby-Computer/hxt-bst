Script "stack_quality_card_id_1086"

/*
# Name: card "qualityEvalDiffTemplate" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1086 of stack "quality" of stack "livecodeTestInterface"
# Hash: x7/PI2R6lVO62j8ti3GFPQ==
*/


// The code from this template should make its way into the stack code of each main diff processing script.
// The substacks contain the results from each test platform on which tests were run.

on processNewDbs
   local tPass, tDbPath, tDbFiles, tDefaultFolder
   
   // Get a list of all the database files we have to process.
   set the itemDelimiter to slash
   put the defaultFolder into tDefaultFolder
   put item 1 to -2 of the fileName of this stack & slash into tDbPath
   set the defaultFolder to tDbPath
   put the files into tDbFiles
   filter tDbFiles with "*PLACE-HOLDER-FOR-TEST-DB-EXTENSION"
   
   // See if we can delete stale entries from the results database.
   put deleteStaleRecords (tDbFiles) into tPass
   
    // Unload the old databases.
   if tPass is true then
      put unloadOldDbs (tDbFiles) into tPass
   end if
   
   // Suck in the new databases.
   if tPass is true then
      put loadNewDbs (tDbPath, tDbFiles) into tPass
   end if
   
   // Synchronize the new data.
   if tPass is true then
      put updateResults () into tPass
   end if
   
   // Synchronize the latest data report.
   if tPass is true then
      put updateLatestResults (tDbFiles) into tPass
   end if
   
   // Delete the loaded and processed databases from the file system.
   if tPass is true then
      put deleteDatabases (tDbPath, tDbFiles) into tPass
   end if
   
   if tPass is true then
      save this stack
   end if
   
   set the defaultFolder to tDefaultFolder
end processNewDbs

// See if we can delete stale entries from the results database.
function deleteStaleRecords pDbFiles
   local tAllResults, tKey, tTestName, tDbFile
   if pDbFiles is empty then return false
   put the cAllResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" into tAllResults
   if tAllResults is an array then
      repeat for each line tKey in the keys of tAllResults
         repeat for each item tTestName in tKey
            repeat for each line tDbFile in pDbFiles
               if tDbFile begins with tTestName then
                  delete variable tAllResults[tKey]
               end if
            end repeat
         end repeat
      end repeat
   end if
   set the cAllResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" to tAllResults
   return true
end deleteStaleRecords

// Unload the old databases.
function unloadOldDbs pDbFiles
   local tDbName, tDbList, tLoadedDb
   
   // Get the list of existing test databases.
   put the substacks of stack "qualityeval" into tDbList
   
   repeat for each line tDbName in pDbFiles
      repeat for each line tLoadedDb in tDbList
         if tDbName begins with tLoadedDb then
            lock messages
            delete stack tLoadedDb
            unlock messages
         end if
      end repeat
   end repeat
   return true
end unloadOldDbs 

// Suck in the new databases.
function loadNewDbs pDbPath, pDbFiles
   local tDbName
   repeat for each line tDbName in pDbFiles
      lock messages
      go invisible stack pDbPath & tDbName
      unlock messages
      set the mainStack of stack (pDbPath & tDbName) to "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK"
   end repeat
   return true
end loadNewDbs

// Synchronize the new data.
function updateResults
   local tAllResults, tPass
   local tDbList, tDb1, tDb2
   local tUpdateEntry
   
   put true into tPass
   put the cAllResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" into tAllResults
   
   // Get the list of existing test databases.
   put the substacks of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" into tDbList
   
   // Loop through each possible diff comparison combination.
   repeat with tDb1 = 1 to the number of lines in tDbList
      repeat with tDb2 = tDb1 to the number of lines in tDbList
         
         // Check if our DB already has the results of this comparison.
         put true into tUpdateEntry
         repeat for each line tKey in the keys of tAllResults
            if (item 1 of tAllResults[tKey] is line tDb1 of tDbList and item 2 of tAllResults[tKey] is line tDb2 of tDbList) or \
                  (item 1 of tAllResults[tKey] is line tDb2 of tDbList and item 2 of tAllResults[tKey] is line tDb1 of tDbList) then
               put false into tUpdateEntry
               exit repeat
            end if
         end repeat
         
         // If this combination does not exist then evalute it and create a new entry.
         if tUpdateEntry is true then
            put handleTest (line tDb1 of tDbList, line tDb2 of tDbList) into tPass
            if tPass is false then return tPass
         end if
      end repeat
   end repeat 
   
   return tPass
end updateResults

//Process a particular diff test set.
function handleTest pTestDb1, pTestDb2
   local xAllResults
   local tPass, tCards, tCard
   
   // Validate that each database has a matching set of cards.
   put matchLists (the cardNames of stack pTestDb1, the cardNames of stack pTestDb2, "eval_*") into tPass
   if tPass is false then return tPass
   
   put the cardNames of stack pTestDb1 into tCards
   filter tCards with "eval_*"
   
   put the cAllResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" into xAllResults
   
   repeat for each line tCard in tCards
      if item 1 of tCard is "eval_output" then
         // Now run the test on each custom property we have
         put testCustomProperties (xAllResults, tCard, pTestDb1, pTestDb2) into tPass
      else
         // Now run the test on each control we have.
         put testControls (xAllResults, tCard, pTestDb1, pTestDb2) into tPass
      end if
      if tPass is false then return tPass
   end repeat
   
   set the cAllResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" to xAllResults
   
   return tPass
end handleTest

function testControls @xAllResults, pCard, pTestDb1, pTestDb2
   local tControl, tControl1, tControl2, tScript, tDiffResult, tPass
   
   // Validate that each card has the same number of matching controls.
   put matchLists (the controlNames of card pCard of stack pTestDb1, the controlNames of card pCard of stack pTestDb2, empty) into tPass
   if tPass is false then return tPass
   
   repeat for each line tControl in the controlNames of card pCard of stack pTestDb1             
      // Build the evaluation code.
      put the long Id of control tControl of card pCard of stack pTestDb1 into tControl1
      put the long Id of control tControl of card pCard of stack pTestDb2 into tControl2
      
      put "function evaluateCondition pValue1, pValue2" & return into tScript
      put "   " & item 1 of pCard && "pValue1, pValue2" & return after tScript
      put "   return the result" & return after tScript
      put "end evaluateCondition" & return after tScript
      
      set the script of button "execEval" of card "runEvals" of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" to tScript
      
      // Execute the test condition.
      dispatch function "evaluateCondition" to button "execEval" of card "runEvals" of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" with tControl1, tControl2
      put the result into tDiffResult
      
      // Assign the results to the appropriate array entries.
      put tDiffResult into xAllResults[pTestDb1 & comma & pTestDb2][item 2 of pCard][item 1 of pCard][item 2 of tControl]      
   end repeat            
   
   return tPass
end testControls

function testCustomProperties @xAllResults, pCard, pTestDb1, pTestDb2
   local tPass, tCustomProperty, tDiffResult
   local tProperties1, tProperties2
   
   // Validate that each card has the same number of matching controls.
   put the customProperties of card pCard of stack pTestDb1 into tProperties1
   put the customProperties of card pCard of stack pTestDb2 into tProperties2
   
   put matchLists (the keys of tProperties1, the keys of tProperties2, "cGDB,*") into tPass
   if tPass is false then return tPass
   
   repeat for each line tCustomProperty in the keys of tProperties1
      if tCustomProperty begins with "cGDB," and item 2 of tCustomProperty is not empty then
         put evaluate_via_generic_differencing (tProperties1[tCustomProperty], tProperties2[tCustomProperty], item 3 of tCustomProperty) into tDiffResult
         
         // Assign the results to the appropriate array entries.
         put tDiffResult into xAllResults[pTestDb1 & comma & pTestDb2][item 2 of pCard][item 1 of pCard][item 2 of tCustomProperty]
      end if
   end repeat
   
   return tPass
end testCustomProperties

// Simple generic list matching function.
function matchLists pList1, pList2, pFilter
   if pFilter is not empty then
      filter pList1 with pFilter
      filter pList2 with pFilter
   end if
   sort lines of pList1
   sort lines of pList2
   return pList1 is pList2
end matchLists

// Synchronize the latest data report.
function updateLatestResults pDbFiles
   local tLatestResults, tKey, tPass
   
   put true into tPass
   put the cAllResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" into tLatestResults
   
   repeat for each key tKey in tLatestResults
      if item 1 of tKey & "PLACE-HOLDER-FOR-TEST-DB-EXTENSION" is not among the lines of pDbFiles or item 2 of tKey & "PLACE-HOLDER-FOR-TEST-DB-EXTENSION" is not among the lines of pDbFiles then
         delete variable tLatestResults[tKey]
      end if
   end repeat
   
   set the cLatestResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK" to tLatestResults
   
   return tPass
end updateLatestResults

// Delete the loaded and processed databases from the file system.
function deleteDatabases pDbPath, pDbFiles
   local tDbName, tPass
   put true into tPass
   repeat for each line tDbName in pDbFiles
      if there is a file (pDbPath & tDbName) then
         delete file (pDbPath & tDbName)
      else
         put false into tPass
      end if
   end repeat
   return tPass
end deleteDatabases

// Get the latest diff results from the database.
// These are the most recent results generated.
on getLatestResults
   return the cLatestResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK"
end getLatestResults

// Get all the results that are currently stored in the database.
on getAllResults
   return the cAllResults of stack "PLACE-HOLDER-FOR-DIFF-RESULTS-STACK"
end getAllResults

// The generic evaluation code for differencing
// ------------------------------------

// Evaluate two values that have to be matched.
// boolean  - X is a boolean and Y is a boolean and X is Y and length of X is the length of Y
// integer   - X is an integer and Y is an integer and X is Y and length of X is the length of Y
// number  - X is a number and Y is a number and X is Y and length of X is the length of Y
// array      - recursive decent with X is Y and length of X is the length of Y
// string     - caseSensitive true and X is Y and length of X is the length of Y
// data        ? STILL TO BE ASSESSED FOR UNICODE
// empty     - auto detect with order of above tyes
function evaluate_via_generic_differencing pData1, pData2, pType
   local tPass, xArrayMatch, tTypeMatch1, tTypeMatch2
   
   put false into tPass
   
   // If the type is empty, then try to guess it.
   if pType is empty then
      put guessType (pData1) into tTypeMatch1
      put guessType (pData2) into tTypeMatch2
      if tTypeMatch1 is tTypeMatch2 then
         put tTypeMatch1 into pType
      end if
   end if
   if pType is empty then return false
   
   // Compare two data sets.
   switch pType
      case "bool"
      case "boolean"
         if pData1 is a boolean and pData2 is a boolean and the length of pData1 is the length of pData2 then put true into tPass
         break
      case "int"
      case "integer"
         if pData1 is an integer and pData2 is an integer and the length of pData1 is the length of pData2 then put true into tPass
         break
      case "num"
      case "number"
         if pData1 is a number and pData2 is a number and the length of pData1 is the length of pData2 then put true into tPass
         break
      case "array"
         if pData1 is an array and pData2 is an array then
            put true into xArrayMatch
            isAnArrayMatch pData1, pData2, xArrayMatch
            put xArrayMatch into tPass
         end if
         break
      case "string"
         set the caseSensitive to true
         if pData1 is pData2 and the length of pData1 is the length of pData2 then put true into tPass
         break
      case "data"
         set the caseSensitive to true
         if pData1 is pData2 and the length of pData1 is the length of pData2 then put true into tPass
         break
      case default
         break
   end switch
   
   // Return the result.
   return tPass
end evaluate_via_generic_differencing

----------

// Guess the parameter type that is being passed in.
// X is a boolean   - boolean
// X is an integer  - integer
// X is a number   - number
// X is an array     - array
// X is not empty  - string
//                          - data ? STILL TO BE ASSESSED FOR UNICODE
function guessType @pValue
   if pValue is a boolean then return "boolean"
   if pValue is an integer then return "integer"
   if pValue is a number then return "number"
   if pValue is an array then return "array"
   if pValue is not empty then return "string"
   return empty
end guessType

----------

// Match two arrays.
on isAnArrayMatch pArray1, pArray2, @xPass
   local tKey
   if pArray1 is an array and pArray2 is an array then
      if the number of lines of the keys of pArray1 is the number of lines of the keys of pArray2 then 
         repeat for each key tKey in pArray1
            if tKey is among the lines of the keys of pArray2 then
               isAnArrayMatch pArray1[tKey], pArray2[tKey], xPass
            else
               put false into xPass
               exit repeat
            end if
         end repeat
      else
         put false into xPass
      end if
   end if
   if pArray1 is an array or pArray2 is an array then put false into xPass
   if xPass is false then exit isAnArrayMatch
   set the caseSensitive to true
   if pArray1 is not pArray2 then put false into xPass
   if the length of pArray1 is not the length of pArray2 then put false into xPass   
end isAnArrayMatch

// The functions following this line should be the differencing functions, inserted from the user code.
// ---------- // ---------- // ---------- // ---------- // ---------- // ---------- //

