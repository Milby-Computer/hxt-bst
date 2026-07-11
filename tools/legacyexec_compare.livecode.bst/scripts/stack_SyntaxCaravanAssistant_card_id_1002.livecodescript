Script "stack_SyntaxCaravanAssistant_card_id_1002"

/*
# Name: card id 1002 of stack "SyntaxCaravanAssistant"
# ID: card id 1002 of stack "SyntaxCaravanAssistant"
# Hash: qTk6V4Id69rfATS6nK/iMQ==
*/


local sLeftBlocks
local sRightBlocks

on scrollbarDrag
   if the short name of the target is not among the items of "Left Block,Right Block" then
      exit scrollbarDrag
   end if
   get the vScroll of the target
   if the short name of the target is "Left Block" then
      set the vScroll of field "Right Block" to it
   else
      set the vScroll of field "Left Block" to it
   end if
end scrollbarDrag

function extractBlocksForFolder pFolder
   local tFiles
   put filesInFolder(pFolder) into tFiles
   
   local tBlocks
   
   local tInBlock
   put false into tInBlock
   
   local tStartRegex, tStopRegex
   put "#ifdef /\* (.*) \*/ LEGACY_EXEC"  into tStartRegex
   put empty into tStopRegex
   repeat for each line tFile in tFiles
      get url ("file:" & pFolder & slash & tFile)
      
      repeat for each line tLine in it
         local tBlockName
         if not tInBlock and matchText(tLine, tStartRegex, tBlockName) then
            if tBlockName is among the keys of tBlocks then
               log "Found duplicate block '" & tBlockName & "'"
            else
               put true into tInBlock
               put "#endif +/\* +" & tBlockName & " +\*/" into tStopRegex
               put tFile into tBlocks[tBlockName]["file"]
            end if
         else if tInBlock then
            if matchText(tLine, tStopRegex) then
               put false into tInBlock
            else
               put tLine & return after tBlocks[tBlockName]["contents"]
            end if
         end if
      end repeat
   end repeat
   
   return tBlocks
end extractBlocksForFolder

on extractBlocks
   put empty into field "Log"
   
   put extractBlocksForFolder(field "Left Folder") into sLeftBlocks
   put extractBlocksForFolder(field "Right Folder") into sRightBlocks
   
   log format("Found %d blocks in left folder", the number of elements of sLeftBlocks)
   log format("Found %d blocks in right folder", the number of elements of sRightBlocks)
end extractBlocks

on processBlocks
   local tBlockNames
   put keysAsSet(sLeftBlocks) into tBlockNames
   union tBlockNames with keysAsSet(sRightBlocks)
   
   local tDiffCount, tDifferentBlocks
   log format("Processing %d blocks", the number of elements of tBlockNames)
   repeat for each key tBlockName in tBlockNames
      if tBlockName is not among the keys of sLeftBlocks then
         log format("Block '%s' in right but not left", tBlockName)
      else if tBlockName is not among the keys of sRightBlocks then
         log format("Block '%s' in left but not right", tBlockName)
      else
         local tDiff
         put compareBlocks(sLeftBlocks[tBlockName]["contents"], sRightBlocks[tBlockName]["contents"]) into tDiff
         if tDiff then
            put tBlockName & return after tDifferentBlocks
            add 1 to tDiffCount
         end if
      end if
   end repeat
   delete the last char of tDifferentBlocks
   sort tDifferentBlocks
   put tDifferentBlocks into field "Differences"
   
   log format("Found %d differences", tDiffCount)
end processBlocks

on showDifferences pBlock
   local tLeftBlock, tRightBlock
   put sLeftBlocks[pBlock]["contents"] into tLeftBlock
   put sRightBlocks[pBlock]["contents"] into tRightBlock
   
   put formatContents(tLeftBlock) into tLeftBlock
   put formatContents(tRightBlock) into tRightBlock
   
   put tLeftBlock into url ("binfile:~/Desktop/left_block.txt")
   put tRightBlock into url ("binfile:~/Desktop/right_block.txt")
   
   local tDiff
   put shell("diff -W 512 -B --ignore-space-change --ignore-tab-expansion -y ~/Desktop/left_block.txt ~/Desktop/right_block.txt") into tDiff
   put replaceText(tDiff, "\t+", tab) into tDiff
   split tDiff by column
   lock screen
   put empty into field "Left Block"
   put empty into field "Right Block"
   repeat with i = 1 to the number of lines in tDiff[1]
      put line i of tDiff[1] & return after field "Left Block"
      if word 1 to -1 of line i of tDiff[2] is among the items of "|,<,>,/,\" then
         put line i of tDiff[3] & return after field "Right Block"
         switch word 1 to -1 of line i of tDiff[2]
            case "|"
               set the backColor of line i of field "Left Block" to "gray"
               set the backColor of line i of field "Right Block" to "gray"
               break
            case "<"
               set the backColor of line i of field "Right Block" to "Gray60"
               break
            case ">"
               set the backColor of line i of field "Left Block" to "Gray60"
               break
         end switch
      else
         put line i of tDiff[2] & return after field "Right Block"
      end if
   end repeat
   unlock screen
end showDifferences

function formatContents pText
   replace tab with "    " in pText
   return pText
end formatContents

function keysAsSet pArray
   get the keys of pArray
   split it by return as set
   return it
end keysAsSet

function compareBlocks pLeft, pRight
      -- First strip non-important whitespace from each block.
   local tStrippedLeft, tStrippedRight
   put stripIgnorableWhiteSpace(pLeft) into tStrippedLeft
   put stripIgnorableWhiteSpace(pRight) into tStrippedRight
   if tStrippedLeft is tStrippedRight then
      return false
   end if
   return true
end compareBlocks

function stripIgnorableWhiteSpace pText
   -- First strip any unnecessary returns
   get empty
   repeat for each line tLine in pText
      if tLine contains "//" then
         put tLine & return after it
      else
         put tLine & space after it
      end if
   end repeat
   
   -- Now replace all sequences of whitespace with a single space.
   get replaceText(it, "[\ \t]+", "")
   get replaceText(it, "^\ |\ $", empty)
   
   return it
end stripIgnorableWhiteSpace

on log pMessage
   put pMessage & return after field "Log"
   set the vScroll of field "Log" to 32760
end log

function filesInFolder pFolder
   local tOldFolder
   put the folder into tOldFolder
   set the folder to pFolder
   get the files
   set the folder to tOldFolder
   return it
end filesInFolder
