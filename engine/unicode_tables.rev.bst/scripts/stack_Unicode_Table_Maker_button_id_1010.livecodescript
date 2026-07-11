Script "stack_Unicode_Table_Maker_button_id_1010"

/*
# Name: button "Generate" of card "Word Break Property Table" of stack "Unicode Table Maker"
# ID: button id 1010 of card id 1002 of stack "Unicode Table Maker"
# Hash: E7rT8493B6xFSoiqqdg5ZA==
*/


on mouseUp
   local tCodepoints
   
   -- First extract the interesting information from the Unicode
   -- WordBreakProperties file.
   repeat for each line tLine in field "WordBreakProperties"
      if word 1 to -1 of tLine is empty then
         next repeat
      end if
      
      if char 1 of tLine is "#" then
         next repeat
      end if
      
      set the itemDelimiter to ";"
      
      local tRange, tClass
      put word 1 of item 1 of tLine into tRange
      put word 1 of item 2 of tLine into tClass
      
      local tFirstCodepoint, tLastCodepoint
      if tRange contains ".." then
         set the itemDelimiter to "."
         put the first item of tRange into tFirstCodepoint
         put the last item of tRange into tLastCodepoint
      else
         put tRange into tFirstCodepoint
         put tRange into tLastCodepoint
      end if
      
      switch tClass
         case "CR"
         case "LF"
         case "Newline"
            put 0 into tClass
         break
         case "Katakana"
            put 1 into tClass
         break
         case "Extend"
         case "Format"
         case "ALetter"
            put 2 into tClass
         break
         case "MidLetter"
            put 3 into tClass
         break
         case "MidNum"
            put 4 into tClass
         break
         case "MidNumLet"
            put 5 into tClass
         break
         case "Numeric"
            put 6 into tClass
         break
         case "ExtendNumLet"
            put 7 into tClass
         break
      end switch
      
      repeat with tCodepoint = baseConvert(tFirstCodepoint, 16, 10) to baseConvert(tLastCodepoint, 16, 10)
         put tClass into tCodepoints[tCodepoint]
      end repeat
   end repeat
   
   -- Assign ALetter to all surrogate codepoints
   repeat with tCodepoint = 0xD800 to 0xDFFF
      put 2 into tCodepoints[tCodepoint]
   end repeat
   
   -- Assign ALetter to all private-use area codepoints
   repeat with tCodepoint = 0xE000 to 0xF8FF
      put 2 into tCodepoints[tCodepoint]
   end repeat
   
   -- Since we are only interested in BMP characters we now iterate through up to 0xFFFF
   -- generating our list of ranges
   local tCodepointRanges, tCurrentClass, tStartCodepoint
   put empty into tCodepointRanges
   put empty into tCurrentClass
   put empty into tStartCodepoint
   repeat with tCodepoint = 0 to 0xFFFF
      get tCodepoints[tCodepoint]
      if it is empty then
         get 0
      end if
      
      if it is tCurrentClass then
         next repeat
      end if
      
      if tCurrentClass is not empty then
         --put format("%04x,%04x,%d", tStartCodepoint, tCodepoint - 1, tCurrentClass) & return after tCodepointRanges
         put tStartCodepoint, tCodepoint - 1, tCurrentClass & return after tCodepointRanges
      end if
      
      put it into tCurrentClass
      put tCodepoint into tStartCodepoint
   end repeat
   if tCurrentClass is not empty then
      --put format("%04x,%04x,%d", tStartCodepoint, tCodepoint, tCurrentClass) & return after tCodepointRanges
      put tStartCodepoint, tCodepoint, tCurrentClass & return after tCodepointRanges
   end if
   
   set the itemDelimiter to comma
   
   -- Now go through and generate our ordered encoded 32-bit words, not including any with
   -- class 0.
   local tEncodedSets
   put empty into tEncodedSets
   repeat for each line tSet in tCodepointRanges
      local tBase, tCount
      put item 1 of tSet into tBase
      put (item 2 of tSet - tBase) + 1 into tCount
      put item 3 of tSet into tClass
      if tClass is 0 then
         next repeat
      end if
      
      repeat while tCount > 0
         local tChunkCount
         put min(tCount, 2^13) into tChunkCount
         
         put format("0x%04x%04x", tBase, (tChunkCount - 1) * 8 + tClass) & return after tEncodedSets
         
         subtract tChunkCount from tCount
         add tChunkCount to tBase
      end repeat
   end repeat
   
   local tTable, tIndex
   put 0 into tIndex
   put empty into tTable
   repeat for each line tSet in tEncodedSets
      put tSet & ", " after tTable
      add 1 to tIndex
      if tIndex mod 8 is 0 then
         delete the last char of tTable
         put return after tTable
      end if
   end repeat
   
   put tTable
end mouseUp
  
