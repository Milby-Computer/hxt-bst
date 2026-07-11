Script "stack_LCBenchMarks_button_id_1003"

/*
# Name: button "StartBenchMark" of card id 1002 of stack "LCBenchMarks"
# ID: button id 1003 of card id 1002 of stack "LCBenchMarks"
# Hash: u7QWfTLjLmhSHvdkie9CHg==
*/


constant kRepetitions = 100000
local sStart, sStop
local sResults, sFieldName
local sCumulativeTime = 0
local sCount = 0

on mouseUp
   local tEngineFolder, tSumFieldName
   put specialFolderPath("engine") into tEngineFolder ## just to find out if running LC or HXT
   put 0 into sCumulativeTime
   put 0 into sCount
   
   if tEngineFolder contains "Livecode" then
      put "fResLC" into sFieldName
      put empty into field sFieldName
      put "fCumulativeTimeLC" into tSumFieldName
      put empty into field tSumFieldName
   end if
   if tEngineFolder contains "HyperXTalk" then
      put "fResHXT" into sFieldName
      put empty into field sFieldName
      put "fCumulativeTimeHXT" into tSumFieldName
      put empty into field tSumFieldName
   end if
   
   BenchmarkArrayAccess 1, 2, 3, 4
   put cr after field sFieldName
   
   BenchmarkVariableFetchLocal
   put cr after field sFieldName
   
   BenchmarkVariableStoreLocal
   put cr after field sFieldName
   
   put "ArrayAccessNamed" & cr after field sFieldName
   BenchmarkArrayNameKeys
   put cr after field sFieldName
   
   put "ArrayAccessIndexKey" & cr after field sFieldName
   BenchmarkArrayIndexKeys
   put cr after field sFieldName
   
   put "ArrayAccessStringKey" & cr after field sFieldName
   BenchmarkArrayStringKeys
   
   put sCumulativeTime && "ms" && "NumTests:" && sCount into field tSumFieldName
end mouseUp

private command BenchmarkArrayAccess pOne, pTwo, pThree, pFour
   BenchmarkStartTiming "Store[]"
   repeat kRepetitions times
      put empty into tVar
      put 1 into tVar[pOne]
      put 2 into tVar[pTwo]
      put 3 into tVar[pThree]
      put 4 into tVar[pFour]
   end repeat
   BenchmarkStopTiming
   
   BenchmarkStartTiming "Fetch[]"
   repeat kRepetitions times
      get tVar[pOne]
      get tVar[pTwo]
      get tVar[pThree]
      get tVar[pFour]
   end repeat
   BenchmarkStopTiming
   
   BenchmarkStartTiming "Store[][]"
   repeat kRepetitions times
      put empty into tVar
      put 1 into tVar[pOne][pTwo]
      put 2 into tVar[pTwo][pThree]
      put 3 into tVar[pThree][pFour]
      put 4 into tVar[pFour][pOne]
   end repeat
   BenchmarkStopTiming
   
   BenchmarkStartTiming "Fetch[][]"
   repeat kRepetitions times
      get tVar[pOne][pTwo]
      get tVar[pTwo][pThree]
      get tVar[pThree][pFour]
      get tVar[pFour][pOne]
   end repeat
   BenchmarkStopTiming
end BenchmarkArrayAccess

on BenchmarkVariableFetchLocal
   local tVar

   local tName1, tName2, tName3, tName4
   put "one" into tName1
   put "two" into tName1
   put "three" into tName1
   put "four" into tName1

   local tNumber1, tNumber2, tNumber3, tNumber4
   put 1 + 0 into tNumber1
   put 2 + 0 into tNumber2
   put 3 + 0 into tNumber3
   put 4 + 0 into tNumber4

   local tString1, tString2, tString3, tString4
   put "on" & "e" into tString1
   put "tw" & "o" into tString2
   put "thre" & "e" into tString3
   put "fou" & "r" into tString4

   local tSeq1_1, tSeq1_2, tSeq1_3, tSeq1_4
   put tName1 into tSeq1_1[1]
   put tName2 into tSeq1_2[1]
   put tName3 into tSeq1_3[1]
   put tName4 into tSeq1_4[1]

   local tSeq2_1, tSeq2_2, tSeq2_3, tSeq2_4
   put tName1 into tSeq2_1[1]
   put tName1 into tSeq2_1[2]
   put tName2 into tSeq2_2[1]
   put tName2 into tSeq2_2[2]
   put tName3 into tSeq2_3[1]
   put tName3 into tSeq2_3[2]
   put tName4 into tSeq2_4[1]
   put tName4 into tSeq2_4[2]

   put empty into tVar
   put 100 into tVar
   BenchmarkStartTiming "Get Base"
   repeat kRepetitions times
      get tVar
      get tVar
      get tVar
      get tVar
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tName1]
   put 100 into tVar[tName2]
   put 100 into tVar[tName3]
   put 100 into tVar[tName4]
   BenchmarkStartTiming "Get Base[<name>]"
   repeat kRepetitions times
      get tVar[tName1]
      get tVar[tName2]
      get tVar[tName3]
      get tVar[tName4]
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tNumber1]
   put 100 into tVar[tNumber2]
   put 100 into tVar[tNumber3]
   put 100 into tVar[tNumber4]
   BenchmarkStartTiming "Get Base[<number>]"
   repeat kRepetitions times
      get tVar[tNumber1]
      get tVar[tNumber2]
      get tVar[tNumber3]
      get tVar[tNumber4]
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tString1]
   put 100 into tVar[tString2]
   put 100 into tVar[tString3]
   put 100 into tVar[tString4]
   BenchmarkStartTiming "Get Base[<string>]"
   repeat kRepetitions times
      get tVar[tString1]
      get tVar[tString2]
      get tVar[tString3]
      get tVar[tString4]
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tSeq1_1]
   put 100 into tVar[tSeq1_2]
   put 100 into tVar[tSeq1_3]
   put 100 into tVar[tSeq1_4]
   BenchmarkStartTiming "Get Base[<seq-1>]"
   repeat kRepetitions times
      get tVar[tSeq1_1]
      get tVar[tSeq1_2]
      get tVar[tSeq1_3]
      get tVar[tSeq1_4]
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tName1][tName1]
   put 100 into tVar[tName2][tName2]
   put 100 into tVar[tName3][tName3]
   put 100 into tVar[tName4][tName4]
   BenchmarkStartTiming "Get Base[<name>][<name>]"
   repeat kRepetitions times
      get tVar[tName1][tName1]
      get tVar[tName2][tName2]
      get tVar[tName3][tName3]
      get tVar[tName4][tName4]
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tNumber1][tNumber1]
   put 100 into tVar[tNumber2][tNumber2]
   put 100 into tVar[tNumber3][tNumber3]
   put 100 into tVar[tNumber4][tNumber4]
   BenchmarkStartTiming "Get Base[<number>][<number>]"
   repeat kRepetitions times
      get tVar[tNumber1][tNumber1]
      get tVar[tNumber2][tNumber2]
      get tVar[tNumber3][tNumber3]
      get tVar[tNumber4][tNumber4]
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tString1][tString1]
   put 100 into tVar[tString2][tString2]
   put 100 into tVar[tString3][tString3]
   put 100 into tVar[tString4][tString4]
   BenchmarkStartTiming "Get Base[<string>][<string>]"
   repeat kRepetitions times
      get tVar[tString1][tString1]
      get tVar[tString2][tString2]
      get tVar[tString3][tString3]
      get tVar[tString4][tString4]
   end repeat
   BenchmarkStopTiming

   put empty into tVar
   put 100 into tVar[tSeq2_1]
   put 100 into tVar[tSeq2_2]
   put 100 into tVar[tSeq2_3]
   put 100 into tVar[tSeq2_4]
   BenchmarkStartTiming "Get Base[<seq-2>]"
   repeat kRepetitions times
      get tVar[tSeq2_1]
      get tVar[tSeq2_2]
      get tVar[tSeq2_3]
      get tVar[tSeq2_4]
   end repeat
   BenchmarkStopTiming
end BenchmarkVariableFetchLocal

on BenchmarkVariableStoreLocal
   local tVar, tName, tNumber, tString, tSeq1, tSeq2
   put "one" into tName
   put 1 + 0 into tNumber
   put "on" & "e" into tString
   put tName into tSeq1[1]
   put tName into tSeq2[1]
   put tName into tSeq2[2]
   
   put empty into tVar
   put 100 into tVar
   BenchmarkStartTiming "Replace Into Base"
   repeat kRepetitions times
      put 100 into tVar
      put 100 into tVar
      put 100 into tVar
      put 100 into tVar
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tName]
   BenchmarkStartTiming "Replace Into Base[<name>]"
   repeat kRepetitions times
      put 100 into tVar[tName]
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tNumber]
   BenchmarkStartTiming "Replace Into Base[<number>]"
   repeat kRepetitions times
      put 100 into tVar[tNumber]
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tString]
   BenchmarkStartTiming "Replace Into Base[<string>]"
   repeat kRepetitions times
      put 100 into tVar[tString]
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tSeq1]
   BenchmarkStartTiming "Replace Into Base[<seq-1>]"
   repeat kRepetitions times
      put 100 into tVar[tSeq1]
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tName][tName]
   BenchmarkStartTiming "Replace Into Base[<name>][<name>]"
   repeat kRepetitions times
      put 100 into tVar[tName][tName]
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tNumber][tNumber]
   BenchmarkStartTiming "Replace Into Base[<number>][<number>]"
   repeat kRepetitions times
      put 100 into tVar[tNumber][tNumber]
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tString][tString]
   BenchmarkStartTiming "Replace Into Base[<string>][<string>]"
   repeat kRepetitions times
      put 100 into tVar[tString][tString]
   end repeat
   BenchmarkStopTiming
   
   put empty into tVar
   put 100 into tVar[tSeq2]
   BenchmarkStartTiming "Replace Into Base[<seq-2>]"
   repeat kRepetitions times
      put 100 into tVar[tSeq2]
   end repeat
   BenchmarkStopTiming
end BenchmarkVariableStoreLocal

on BenchmarkArrayNameKeys
   BenchmarkArrayAccess "one", "two", "three", "four"
end BenchmarkArrayNameKeys

on BenchmarkArrayIndexKeys
   BenchmarkArrayAccess 1+0, 2+0, 3+0, 4+0
end BenchmarkArrayIndexKeys

on BenchmarkArrayStringKeys
   BenchmarkArrayAccess "on" & "e", "tw" & "o", "thre" & "e", "fou" & "r"
end BenchmarkArrayStringKeys


on BenchmarkStartTiming pWhat
   put empty into sResults
   put pWhat & tab after sResults
   put the milliseconds into sStart
end BenchmarkStartTiming

on BenchmarkStopTiming
   put the milliseconds - sStart into tTime
   put tTime && "ms" & return after sResults
   put sResults after field sFieldName
   add tTime to sCumulativeTime
   add 1 to sCount
end BenchmarkStopTiming
