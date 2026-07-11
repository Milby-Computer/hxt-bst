Script "stack_quality_card_id_1074"

/*
# Name: card "qualityRunTests" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1074 of stack "quality" of stack "livecodeTestInterface"
# Hash: iwuerKiklxQAqz1T0c0Zlg==
*/


// Main Execution Level

// MOVE THE FOLLOWING DB CODE AFTER EVALUATETEST
// Get information out of the test execution instructions database.
// THIS CODE WILL HAVE TO BE UPDATED IF WE ARE ALLOWING MULTIPLE EXECUTIONS OF A TEST.
// IN PARTICULAR WE NEED TO BE ABLE TO PAIR START AND STOPS BY VERIFYING THEIR ORDER.
function queryTest @rQueryResult, pData, pToken, pMacroToken
   local tLineIndex, tLineIndexFrom, tLineIndexTo, tLine, tProcessedLine, tPass
   
   put true into tPass
   put empty into rQueryResult
   put empty into tLineIndexFrom
   put empty into tLineIndexTo
   
   if pData is empty then put false into tPass
   if pToken is empty then put false into tPass
   
   // Add "--" to the token we are passing in.
   put "--" before pToken
   
   if tPass is true then
      switch pToken
         case "--testset"            // The name of the test set.
         case "--index"              // The unique test index.
         case "--execution-line" // The unique execution line that is to be sporned as a process.
         case "--execution-file"  // The name of the file that is used to store execution information for Android.
         case "--diff-db_file"      // The name under which the diff database file should be stored, once downloaded from the source. 
         case "--maxduration"   // The maximum duration in secods that a test should not exceed.
         case "--showtest"         // The show stack flag.
         case "--filename"         // The name of the test file that was used to create the test for execution.
         case "--test-died"        // The long internet date at which the test died.
         case "--test-expired"   // The long internet data at which the test expired.
         case "--test-start"        // The long internet data at which the test was started.
         case "--test-end"         // The long internet data at which the test was stopped.
         case "--seconds-start" // The seconds when the test was started. Used to monitor the test length.
         case "--seconds-end"  // The seconds when the test was stopped. Used to monitor the test length.
         case "--supportenv"     // Logic that specifies what environment is supported.
            
            repeat with tLineIndex = the number of lines in pData down to 1
               if word 1 of line tLineIndex of pData is pToken then put word 2 to -1 of line tLineIndex of pData into rQueryResult
            end repeat
            break
         case "--test-result"   // The information returned from the test execution.
            repeat with tLineIndex = the number of lines in pData down to 1
               if word 1 of line tLineIndex of pData is "--seconds-end" then
                  if tLineIndexFrom is not empty then
                     logThis "Test Result Parse Exception:" && quote & "--seconds-start" & quote && "encountered after" && quote & "--seconds-end" & quote && "on lines:" && tLineIndexFrom && "and" && tLineIndex & return 
                  else if tLineIndexTo is not empty then
                     logThis "Test Result Parse Exception:" && quote & "--seconds-end" & quote && "encountered twice without" && quote & "--seconds-start" & quote && "on lines:" && tLineIndex && "and" && tLineIndexTo & return
                  else
                     put tLineIndex into tLineIndexTo
                  end if
               end if
               if word 1 of line tLineIndex of pData is "--seconds-start" then
                  if tLineIndexTo is empty then
                     logThis "Test Result Parse Exception:" && quote & "--seconds-start" & quote && "encountered without a matching" && quote & "--seconds-end" & quote && "on line:" && tLineIndex & return
                  else if tLineIndexFrom is not empty then
                     logThis "Test Result Parse Exception:" && quote & "--seconds-start" & quote && " encountered twice without" && quote & "--seconds-end" & quote && " on lines:" && tLineIndex && "and" && tLineIndexFrom & return
                  else
                     put tLineIndex into tLineIndexFrom
                  end if
               end if               
               // See if we can populate the return information.
               if tLineIndexFrom is not empty and tLineIndexTo is not empty then
                  if tLineIndexFrom+1 < tLineIndexTo-1 then
                     repeat for each line tLine in line tLineIndexFrom+1 to tLineIndexTo-1 of pData
                        put tLine into tProcessedLine
                        replace quote with empty in tProcessedLine
                        if pMacroToken is empty or pMacroToken is among the words of tProcessedLine then put "  -" && tLine & return after rQueryResult 
                     end repeat
                  else
                     logThis "Test Result Parse Exception: The data range does not provide test data." & return
                  end if
                  exit repeat
               end if
            end repeat            
            break            
         default
            logThis "Test Case Database Exception: Token" && pToken && "is not defined." & return
            break
      end switch
   end if
   
   return tPass
end queryTest

----------

function closeThisProcess pProcess
   local tRepeatCount
   
   // Try to close the process in a nice way.
   repeat with tRepeatCount = 1 to 5
      close process pProcess
      if there is a process pProcess then
         wait for 1 second with messages
      else
         exit repeat
      end if
   end repeat
   
   // If the process is still there then try and kill it.
   if there is a process pProcess then
      logThis "Process Close Down Exception: Could not close process in a nice way. Trying to kill:" && pProcess & return
      repeat with tRepeatCount = 1 to 5
         kill 9 process pProcess
         if there is a process pProcess then
            wait for 1 second with messages
         else
            exit repeat
         end if
      end repeat
      // If we were still not able to kill the process then log information about that.
      if there is a process pProcess then
         logThis "Process Close Down Exception: Could not kill process in a bad way:" && pProcess & return
      end if
   end if
   return true
end closeThisProcess

----------

// Break the single line instructions into seperate lines.
function breakInstructions @rBrokenData, pInputLine
   local tWord, tFrom, tTo, tPass
   
   put empty into rBrokenData
   put true into tPass
   put 0 into tFrom
   put 0 into tTo
   
   if pInputLine is empty then
      logThis "Test Instruction Decomposition Exception: Single Line Instructions is empty but it should not be." & return
      put false into tPass
   end if
   
   if tPass is true then
      repeat with tWord = 1 to the number of words in pInputLine
         if char 1 to 2 of word tWord of pInputLine is "--" then
            
            // Add a new line to the line broken data.
            if tFrom > 0 and tTo > 0 then put word tFrom to tTo of pInputLine & return after rBrokenData
            
            // Set the new start location.
            put tWord into tFrom
            put tWord into tTo
         else
            put tWord into tTo
         end if
      end repeat
      
      // Remember to add the last line we processed.
      if tFrom > 0 then put word tFrom to tTo of pInputLine & return after rBrokenData
   end if
   
   return tPass
end breakInstructions
