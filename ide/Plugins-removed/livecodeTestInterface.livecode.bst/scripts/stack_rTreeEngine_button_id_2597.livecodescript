Script "stack_rTreeEngine_button_id_2597"

/*
# Name: button "rTreeBehaviorOLD" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2597 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: k5l6T0thjyWs8+7y0A9TNw==
*/


global gSerialSet , gNumOfRenders , gRandomRenders

local tClickedNodeNumber, tVscroll, sHilitedLines, tLastNodeIDEntered, \
       tBetweenNodes, tPreviousShiftClickLine, tSelectionStartLine, tHandlerBusy, tTwoMouseUp, \
       tTwoMouseUpTime, tLassClickedLineNumber, tSelectedChunk, \
       tFromBelowBetweenNodes, tAboveNodeID, tBelowNodeID, \
       tMouseDown, tHandlerDownBusy, tHandlerUpdateBusy, tMouse, tBetweenNodeIDs, \
       tMouseNodeID, tSetParentHandler, tLineHeight, tLineChangeMouseV, tBelowLineNum, \
       tAboveLineNum, tDropBelow, tMouseUpLine, tMouseUpNodeID, tDragDropped, tSetIDHandler, \
       tReturnNode, tDroppedNodeNewNumber, tPropertyNames, tChunk, tProcessingNewNode, \
       tSetByEngine , tClickedNodeFamily , tSetFromMoveSomeNodes , tSetFromScanNode
local sCollapsedSet
local sClickedLineNum
local sClickedNodeID
local sVscroll
local sLastClickLineNum
local sMouseDownCharNum
local sNodeDataChanged
local tSerials
local sClickMouseLoc
local sLineLocs
local sTopLineNum
local sNodeDataA
local sRootNodeIDs
local sSetNumberHandlerBusy
local sMoveSomeNodesHandlerBusy
local sStartMouseH
local sStartMouseV
local sLeftDelta
local sTopDelta
local sRightDelta
local sBottomDelta
local sPreviousMouse
local sStartRectangle
local sLockLocation
local sMouseWithin
local sPreviousTarget
local sDragEnter
local tNodeIDsToDelete
local sScrollOnDrag
local sNewNodeIDs
local sDepthA
local sChildrenA
local tRootNodeIDs

on focusIn
   -- beep
   pass focusIn
end focusIn
       
on mouseEnter
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   put true into tHandlerBusy
   put true into sMouseWithin
   -- put "XUKPYVTAOEWRTKEMZMDOZSRY,MUUWILIJOXKOFIMPHTJOZEHH,JKLZWAIXLVWWJBGHTRFTGBVG,WQTMTBKDLQBTNHZTKGNYDHUT,RPYMLUBGUXDHFBYMCMMPSLJU,IGESYICNCXXLVOKDAUJRAKAZ,UWLVAQLHURVQAODLLPKABAIW,UMYQZAUFCZLMGEPUYYUGTWTN,FYTBNKYIEVZARFUCLPFFLQGU,MQWRYJPYORGVOOFCKCYAUMDE,XECQBZHVHCEWYMOGXNSSYEYY,RHDYBMWDZIYQOMTPWVCSTJIF,LEKNQJIAEABJTBWRXEOAFWEN,NRRGBGGEAUJDOTEWKYVEWIFY,MTTTISTKXELEJVPJVHMABBEJ,AXDIORUAIXLWGPYEENPNDPMF,MSLKBVXNANUOXSDWWTSAANHG,UAVNPOJGSZCUUJJTSMBSVKPM,DWUDVPIRIHWFKNIAZLUYGMCU,MRRRAKDCDFSOKHKHWJPVEVOZ,QQOMDVFBIOABMZBVUEQJEPTK,KRRQZJXFKKDOISBBKWQHFCFK,SWVCKDUDPKRZENASQPBIZCUE,FNBUWXVOWMDRVUQREEOYERJY,CWLWNPYKHILOEIWVWXHILJWC,UJVPAISLHAFZFLDMQZVZWUDM,IFTHIUILCEXTLGTXNDJWQNGN,LQJTTEOJFMUEJTSDOGOZQTLY,XEABJNJJGEPWVLWXZYHELAEV,VAUXRLLRIJICZKULFXHREEXA,UPKSAFYUAVCJUBHCQOVHUHAW,TJAIAFYPSXHPHZVMALXYGKSL,KVQYPEKXLAZDQLBDRDZYKRMP,JGNSCRMBVELGFWBPAOHSFPEZ,JJZHVINUAAGNIPKZVDVWHSLY,WQKGGHOHPGJODUAKVDHMDRYI,QJYRMBCJWZKBOTYTRLEWIVZL,KXWCILADUNNQFKCVNZMEXBVN,YIMIHRNCWKOEKGTRAROGVEWF,CKMPVFYEXHQGPAWVBBIKRBXW,SBOQKXNJJUBDAAIAUYHZHUBN,ITHVJYKGLIMBLPUOJCPBCXRL,TBZSROJWYWVLRXUOKGQAYDMF,QGYCRWNELRILCMPYHWVJGUVK,RGNWABMFQQEOXRJFVLSKSDCF,LOYHKZZQVSPBDLPMZFDDHEXW,YLMKVSXBFJIMISYNPTAYIIZR,DIAKOYCQDGIRHCCDJKPGMKQU,STDIBBMCPBFLWXZYHHMEMJLX,SBTBZRGZKNGWHKCKZLCUKFQR,ODTOXVNHPHZXCTFENKQXNUYM,NSMCZNEJQDHUYZDGGAAAAJAT,FZJYEWHEHMYGJVQITIROPTWF,CRAEXRUHOGIPPEPNGPDTUPAW,GZTYTZLGCRUOECFBEBCFMTCP,IHHLHXIRTUKLBVSXPCYBJSMX,YCFGBBYVHNHLIVAGJQBQCUDC,PCUANECCGMMWTYVXIEXQCNCA,PVHELXBWFTXTMEZAAJPOMYNL,VKPCHQIGRROUFKWDNOGOHHPI,MBMTGWMNEKGXQNWWVNBZJXMS,UTWRMOFYNJJRKBTXMEERECIE,ODMXFFBQXGGJNIXQMWMXCZIC,IVVHUBLGWNQPNBHRAIGKXTTR,NUGLTZSUPJTXDWSUDORLSMXI,COORKBXUOMTVYWGQNXFIBYGG,ULPIGSZIODCAKYLSEIZOTIKO,QCUNLTGNSHNKYCIPJHNTOLQX,MEHABFKDPOQNTAXLTQBCKLHU,BLNKCHLWYNWRCXTICZXSYOGV,ABXPRFICOEFCJHRBPJDOUSVR,XKSFAAEVDBPMOPBXKOFRWAQO,ENWMHFKEYKLBVCCZIDVTYFRS,UNCSMGTLKEABASLRGRMNENZY,PNTRDVONUTLOUVZCGZOTZPZB,HEIKGSICQWEABBKKQHESETEH,KFYOFWVEFPOGMYVYCXRAREDZ,QFLGPSAZCHHBJFOIKZAJVGRJ,TUEIZUJNXICPYKJOLFKAHLGC,LAJHUVOYCMRXQGXDTHYWSLSW,ENPSVHKQDTNZMQUCBHKGLKFK,MAUQUMPGCTBZECVCWPSTRIAH,XYMQWPVNLWFFRDNPDQJWMNAW,BOGBBSKKTVOIOUINVEKYOEEC,OIGMHUGXKIYTXCEYSSCUHNRY,QNFFRGFXBVBJNEMZHFSAWNAO,MSRCSGLOCFASGLPOSMHSJBRH,TRHCSZSQCHDODFFSFXQKFOJW,GIJAKJTYLJCIKCAHTWXQWJHK,FMFBNTISOPUCVCVWTWFEFMEZ,FSRMHPGEFMJHRXVQGHDHZYMT,AGQQQZVQIKEXPBZHGPAZCDKU,RZMSGWGLPQEXOASYUGFLHXHI,HPUACBCPKCSWGXVZTCGFDNLW,KVPCTKJVTVWXIVSRLKTOIPEC,FHQUNISKKZVSCLHPZEJAPMWP,AMHUFUVZJFKPWCDFNRDGGLLT,DTCMVUQRYJFBXXANCQWRYMIY,IKHLKAKMPCABBFRYDBFIKYSY,GFBUMBRAJKCFDWXIGFJXZTIN" into gSerialSet
   if "rTreeEngine" is not among the lines of the openStacks
   then
      -- open invisible stack "rTreeEngine" # Messes with mobiles!
   end if
   -- set the behavior of scrollbar "VerticalScrollbar" of me to the long ID of button "verticalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
   -- set the behavior of scrollbar "HorizontalScrollbar" of me to the long ID of button "horizontalScrollbarBehavior" of card "Engine" of stack "rTreeEngine"
   # Set Tree properties.
   repeat for each line sProperty in the TreeProperties of stack "rTreeEngine"
      if the sProperty of me is empty then set the sProperty of me to empty
   end repeat
   if the showInvisibleNodes of me is empty then set the showInvisibleNodes of me to false
   if the betweenNodesDelta of me is empty then set the betweenNodesDelta of me to 4
   if the autoScrollbar of me is empty then set the autoScrollbar of me to true
   if the newNodeOnReturn of me is empty then set the newNodeOnReturn of me to true
   -- if the nodeHeight of me is empty then set the nodeHeight of me to "21"
   if the mouseNode of me is not empty then dispatch "nodeEnter" with the mouseNode of me  , the ID of me
   if the nodeIDs of me is empty # Create Nodes from text put into the rTree with the put command.
   then
     dispatch "renderTree" to me
  end if
  -- put "sPreviousTarget" && sPreviousTarget ###
  if sPreviousTarget is empty # First time mouseEnter after opening stack.
  then
     dispatch "renderTree" to me
  end if
  -- dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of me with  the thumbposition of scrollbar "VerticalScrollbar" of me
  put false into tHandlerBusy
  catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass mouseEnter
end mouseEnter

on mouseDown theButton theNodeID theTreeID
   -- put the long ID of me & cr & the long ID of the target ###
   if the long ID of me is in the long ID of the target
   then
   try
   put the millisec into ms ###
   dispatch "startCalculateTree" to me with the ID of me
   -- lock screen
   -- put the target ###
   put true into tHandlerBusy
   set the recentNodeID of me to the clickNode of me
   if the ID of the target is among the lines of the badgeContainerIDs of me
   then
      set the clickNode of me to the nodeID of the target
      set the clickBadge of me to the ID of the target
   else
      set the clickBadge of me to empty
   end if
   -- put the clickBadge of me ###
   if word 1 of the short name of the target is "nodeContainer"
   then 
      -- focus the target
      focus field "backgroundField" of me
      -- set the clickContainer of me to the ID of the target
      set the clickNode of me to the nodeID of the target
      -- put the name of control ID the clickNode of me ###
      -- put the clickNode of me ###
      put round(the depth_of_node_ID_[the nodeID of the target] of me) into tClickedNodeDepth
      put the nodeLine_of_node_ID_[the nodeID of the target] of me into sClickedLineNum
      -- if there is a field "BenchMarkInfo" then put empty into field "BenchMarkInfo"
      -- put "sClickedLineNum" && sClickedLineNum ###
      if word 2 of the mouseCharChunk is not empty
      then
         put the imageSource of the mouseCharChunk into tIconID
      else
         put empty into tIconID
      end if
      set the clickIcon of me to tIconID
      -- put word 1 of the short name of the target ###
      -- put the ctrlKey ###
      put the hilitedNodeIDs of me into tHilitedNodeIDs
      if the ctrlKey is "down"
      then
         if the nodeID of the target is among the lines of the hilitedNodeIDs of me
         then
            set the wholematches to true
            delete line lineOffset(the nodeID of the target , tHilitedNodeIDs) of tHilitedNodeIDs
            sort tHilitedNodeIDs numeric 
            set the hilitedNodeIDs of me to tHilitedNodeIDs
         else
            put tHilitedNodeIDs & cr & the nodeID of the target into tHilitedNodeIDs
            sort tHilitedNodeIDs numeric 
            set the hilitedNodeIDs of me to tHilitedNodeIDs
         end if
      else
         if the shiftKey is not down then set the hilitedNodeIDs of me to the nodeID of the target
      end if
      if the shiftKey is "down"
      then
         put line 1 of the hilitedNodeIDs of me into tFirstHilitedID
         put the nodeLine_of_node_ID_[tFirstHilitedID] of me into tFirstHilitedLine
         put line - 1 of the hilitedNodeIDs of me into tLastHilitedID
         put the nodeLine_of_node_ID_[tLastHilitedID] of me into tLastHilitedLine
            if sClickedLineNum < tFirstHilitedLine
            then
               put line sClickedLineNum to tLastHilitedLine of the visibleNodeIDs of me into tHilitedLinesChunk
               put empty into tHilitedNodeIDs
               repeat for each line tHilitedID in tHilitedLinesChunk
                  put tHilitedID & cr after tHilitedNodeIDs
               end repeat
               if character - 1 of tHilitedNodeIDs is cr then delete character - 1 of tHilitedNodeIDs
               set the hilitedNodeIDs of me to tHilitedNodeIDs
            end if
            if sClickedLineNum > tLastHilitedLine
            then
               put line tFirstHilitedLine to sClickedLineNum of the visibleNodeIDs of me into tHilitedLinesChunk
               put empty into tHilitedNodeIDs
               repeat for each line tHilitedID in tHilitedLinesChunk
                  put tHilitedID & cr after tHilitedNodeIDs
               end repeat
               if character - 1 of tHilitedNodeIDs is cr then delete character - 1 of tHilitedNodeIDs
               set the hilitedNodeIDs of me to tHilitedNodeIDs
            end if
            if sClickedLineNum < tLastHilitedLine and sClickedLineNum > tFirstHilitedLine
            then
               put the nodeLine_of_node_ID_[the recentNodeID of me] of me into tRecentHilitedLine
               if tRecentHilitedLine is empty then put tFirstHilitedLine into tRecentHilitedLine
               if sClickedLineNum < tRecentHilitedLine
               then
                  put line sClickedLineNum to tRecentHilitedLine of the visibleNodeIDs of me into tHilitedLinesChunk
               else
                  put line tRecentHilitedLine to sClickedLineNum of the visibleNodeIDs of me into tHilitedLinesChunk
               end if
               put empty into tHilitedNodeIDs
               repeat for each line tHilitedID in tHilitedLinesChunk
                  put tHilitedID & cr after tHilitedNodeIDs
               end repeat
               if character - 1 of tHilitedNodeIDs is cr then delete character - 1 of tHilitedNodeIDs
               set the hilitedNodeIDs of me to tHilitedNodeIDs
            end if
      else
      
      end if
      put the visibleNodeIDs of me into tVisibleNodeIDs
      put the nodeID of the target into sClickedNodeID
      put the number_of_node_ID_[the nodeID of the target ] of me into tClickedNodeNumber
      put line sClickedLineNum + 1 to - 1 of tVisibleNodeIDs into tVisibleNodeIDsChunk
      put the firstIconCollapsed_of_node_ID_[sClickedNodeID] of me into tFirstIconCollapsed
      -- put the recentCards ###
      if the short name of this stack is not "rTreeEngine"
      then
         set the LongStackID of stack "rTreeEngine" to the long id of this stack
         set the LongCardID of stack "rTreeEngine" to the long id of this card
         set the LongTreeID of stack "rTreeEngine" to the long id of me
         set the clickNode of stack "rTreeEngine" to the nodeID of the target
      end if
      put the name_of_node_ID_[the nodeID of the target ] of me into tNodeName
      switch
         case the ActiveCard of stack "rTreeEngine" is the long ID of card "SetIcons" of stack "rTreeEngine"
            dispatch "preOpenCard" to card "SetIcons" of stack "rTreeEngine"
            -- set the label of stack "rTreeEngine" to "Node" && quote & tNodeName & quote && comma && "ID" && the nodeID of the target
            break
         -- case the ActiveCard of stack "rTreeEngine" is the long ID of card "NodeProperties" of stack "rTreeEngine"
            -- dispatch "preOpenCard" to card "NodeProperties" of stack "rTreeEngine"
            -- set the label of stack "rTreeEngine" to "Node" && quote & tNodeName & quote && comma && "ID" && the nodeID of the target
            -- break
         -- case the ActiveCard of stack "rTreeEngine" is the long ID of card "TreeProperties" of stack "rTreeEngine"
            -- dispatch "preOpenCard" to card "TreeProperties" of stack "rTreeEngine"
            -- set the label of stack "rTreeEngine" to "Tree" && quote & the short name of me & quote && comma && "ID" && the ID of me
            -- break
         -- case the ActiveCard of stack "rTreeEngine" is the long ID of card "SetNodeControl" of stack "rTreeEngine"
            -- dispatch "preOpenCard" to card "SetNodeControl" of stack "rTreeEngine"
            -- set the label of stack "rTreeEngine" to "Node" && quote & tNodeName & quote && comma && "ID" && the nodeID of the target
            -- break
      end switch
      if tFirstIconCollapsed is empty then put the firstIconCollapsed of me into tFirstIconCollapsed
      put the firstIconExpanded_of_node_ID_[sClickedNodeID] of me into tFirstIconExpanded
      if tFirstIconExpanded is empty then put the firstIconExpanded of me into tFirstIconExpanded
      if the expanded_of_node_ID_[sClickedNodeID] of me is empty and the sourcePath_of_node_ID_[sClickedNodeID] of me is not empty
      then
         -- set  the expanded_of_node_ID_[sClickedNodeID] of me to false
      end if
      -- if the expanded_of_node_ID_[sClickedNodeID] of me is empty then set  the expanded_of_node_ID_[sClickedNodeID] of me to true
      if tIconID is an integer and (tIconID is tFirstIconCollapsed or tIconID is tFirstIconExpanded)
      then
         if the expanded_of_node_ID_[sClickedNodeID] of me is not false
         then
            dispatch "nodeCollapsed" with sClickedNodeID , the ID of me
            put "0" into tLineNum
            repeat for each line tNodeID in tVisibleNodeIDsChunk
               if round(the depth_of_node_ID_[tNodeID] of me) <= tClickedNodeDepth then exit repeat
               add 1 to tLineNum
            end repeat
            if tLineNum > 0 then delete line sClickedLineNum + 1 to sClickedLineNum + tLineNum of tVisibleNodeIDs
            set the expanded_of_node_ID_[sClickedNodeID] of me to false
            set the visibleNodeIDs of me to tVisibleNodeIDs
         else
            dispatch "nodeExpanded" with sClickedNodeID , the ID of me
            put line tClickedNodeNumber + 1 to - 1 of the nodeIDs of me into tNodeIDsChunk
            set the customPropertySet of me to "expanded_of_node_ID_"
            put the customProperties of me into sExpandedA
            set the customPropertySet of me to "depth_of_node_ID_"
            put the customProperties of me into sDepthA
            set the customPropertySet of me to "visible_of_node_ID_"
            put the customProperties of me into sVisibleA
            set the customPropertySet of me to empty
            put empty into tVisibleNodeIDsChunk
            repeat for each line sLine in tNodeIDsChunk
               # Find visible nodes
               if sDepthA[sLine] <= tClickedNodeDepth then exit repeat
               if sSkip is true and sDepthA[sLine] > sCollapsedNodeDepth then next repeat else put false into sSkip
               if sVisibleA[sLine] is false and the showInvisibleNodes of me is not true
               then
                  put sDepthA[sLine] into sCollapsedNodeDepth
                  put true into sSkip
                  next repeat
               end if
               put sLine & cr after tVisibleNodeIDsChunk
               if sExpandedA[sLine] is false then
                  put true into sSkip
                  put sDepthA[sLine] into sCollapsedNodeDepth
               end if
            end repeat
            if character - 1 of tVisibleNodeIDsChunk is cr then delete character - 1 of tVisibleNodeIDsChunk
            set the expanded_of_node_ID_[sClickedNodeID] of me to true
            if tVisibleNodeIDsChunk is not empty then put cr & tVisibleNodeIDsChunk after line sClickedLineNum of tVisibleNodeIDs
            set the visibleNodeIDs of me to tVisibleNodeIDs
            -- if there is a field "BenchMarkInfo"
            -- then
            -- put "Node expanded in" && the millisec - ms && "ms" & cr after field "BenchMarkInfo" ###
            -- end if
         end if
      end if
      if the sourcePath_of_node_ID_[sClickedNodeID] of me is not empty
      then
         put the cached_of_node_ID_[sClickedNodeID] of me into tCached
         if the useCache of me is not false and tCached is not true
         then
            set the cached_of_node_ID_[sClickedNodeID] of me to true
            -- set the expanded_of_node_ID_[sClickedNodeID] of me to false
            put true into sScanNow
         end if
      end if
      if there is a card ID the cardID_of_node_ID_[sClickedNodeID] of me
      then
         go to card ID the cardID_of_node_ID_[sClickedNodeID] of me
      end if
      dispatch "nodeDown" with theButton , the nodeID of the target , the ID of me
      if sScanNow is true
      then
         dispatch "scanNode"
         -- dispatch "renderTree"
      end if
      -- dispatch "updateTree" to scrollbar "VerticalScrollbar" of me
   end if
   if word 1 of the short name of the target is not "nodeContainer"
   then
      set the clickNode of me to empty
   end if
   put false into tHandlerBusy
   -- unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass mouseDown
end mouseDown

on mouseDoubleDown theButton
   if the long ID of me is in the long ID of the target
   then
   try
   put the millisec into ms ###
   lock screen
   put true into tHandlerBusy
   if the ctrlKey is down
   then
      pass mouseDoubleDown
   end if
   if the shiftKey is down
   then
      pass mouseDoubleDown
   end if
   lock screen
   put false into tTwoMouseUp
   put the nodeID of the target into sClickedNodeID
   put the number_of_node_ID_[the nodeID of the target ] of me into tClickedNodeNumber
   set the clickNode of me to the nodeID of the target
   put round(the depth_of_node_ID_[the nodeID of the target] of me) into tClickedNodeDepth
   put the nodeLine_of_node_ID_[the nodeID of the target] of me into sClickedLineNum
   if word 2 of the mouseCharChunk is not empty
   then
      put the imageSource of the mouseCharChunk into tIconID
   else
      put empty into tIconID
   end if
   set the clickIcon of me to tIconID
   put the firstIconCollapsed_of_node_ID_[sClickedNodeID] of me into tFirstIconCollapsed
   if tFirstIconCollapsed is empty then put the firstIconCollapsed of me into tFirstIconCollapsed
   put the firstIconExpanded_of_node_ID_[sClickedNodeID] of me into tFirstIconExpanded
   if tFirstIconExpanded is empty then put the firstIconExpanded of me into tFirstIconExpanded
   if tIconID is an integer and (tIconID is tFirstIconCollapsed or tIconID is tFirstIconExpanded)
   then
      exit mouseDoubleDown
   end if
   put the visibleNodeIDs of me into tVisibleNodeIDs
   put line sClickedLineNum + 1 to - 1 of tVisibleNodeIDs into tVisibleNodeIDsChunk
   if the label_of_node_ID_[sClickedNodeID] of me is empty
   then
      put the number of characters of the name_of_node_ID_[sClickedNodeID] of me into numOfNameChars
   else
      put the number of characters of the label_of_node_ID_[sClickedNodeID] of me into numOfNameChars
   end if
   -- put the number of characters of line 1 to sClickedLineNum of me into nameEndCharNum
   -- put nameEndCharNum - numOfNameChars + 1 into nameStartCharNum
   if the editNodeOnDoubleClick of me is not true and the mouseCharChunk is not empty or the mouseCharChunk is empty
   then
      if the expanded_of_node_ID_[sClickedNodeID] of me is not false
      then
         put "0" into tLineNum
         repeat for each line tNodeID in tVisibleNodeIDsChunk
            if round(the depth_of_node_ID_[tNodeID] of me) <= tClickedNodeDepth then exit repeat
            add 1 to tLineNum
         end repeat
         if tLineNum > 0 then delete line sClickedLineNum + 1 to sClickedLineNum + tLineNum of tVisibleNodeIDs
         set the expanded_of_node_ID_[sClickedNodeID] of me to false
         set the visibleNodeIDs of me to tVisibleNodeIDs
         -- if there is a field "BenchMarkInfo"
         -- then
            -- put "Node collapsed in" && the millisec - ms && "ms" & cr after field "BenchMarkInfo" ###
         -- end if
      else
         put line tClickedNodeNumber + 1 to - 1 of the nodeIDs of me into tNodeIDsChunk
         set the customPropertySet of me to "expanded_of_node_ID_"
         put the customProperties of me into sExpandedA
         set the customPropertySet of me to "depth_of_node_ID_"
         put the customProperties of me into sDepthA
         set the customPropertySet of me to "visible_of_node_ID_"
         put the customProperties of me into sVisibleA
         set the customPropertySet of me to empty
         put empty into tVisibleNodeIDsChunk
         repeat for each line sLine in tNodeIDsChunk
            # Find visible nodes
            if sDepthA[sLine] <= tClickedNodeDepth then exit repeat
            if sSkip is true and sDepthA[sLine] > sCollapsedNodeDepth then next repeat else put false into sSkip
            if sVisibleA[sLine] is false and the showInvisibleNodes of me is not true
            then
               put sDepthA[sLine] into sCollapsedNodeDepth
               put true into sSkip
               next repeat
            end if
            put sLine & cr after tVisibleNodeIDsChunk
            if sExpandedA[sLine] is false then
               put true into sSkip
               put sDepthA[sLine] into sCollapsedNodeDepth
            end if
         end repeat
         if character - 1 of tVisibleNodeIDsChunk is cr then delete character - 1 of tVisibleNodeIDsChunk
         set the expanded_of_node_ID_[sClickedNodeID] of me to true
         if tVisibleNodeIDsChunk is not empty then put cr & tVisibleNodeIDsChunk after line sClickedLineNum of tVisibleNodeIDs
         set the visibleNodeIDs of me to tVisibleNodeIDs
         -- if there is a field "BenchMarkInfo"
         -- then
            -- put "Node expanded in" && the millisec - ms && "ms" & cr after field "BenchMarkInfo" ###
         -- end if
      end if
         /*
      if the sourcePath_of_node_ID_[the clickNode of me] of me is not empty then if the expanded_of_node_ID_[the clickNode of me] of me is empty then set the expanded_of_node_ID_[the clickNode of me] of me to false
      if tIconID is not empty and (tIconID is the firstIconExpanded of me or tIconID is the firstIconCollapsed of me or tIconID is the checkedIcon of me or tIconID is the uncheckedIcon of me) or the nodeType_of_node_ID_[the clickNode of me] of me is "file" or the cantExpand_of_node_ID_[the clickNode of me] of me is true
      then
         dispatch "nodeDoubleDown" with theButton, the nodeID of the target , the ID of me
         exit mouseDoubleDown
      end if
      if the sourcePath_of_node_ID_[the clickNode of me] of me is not empty and the cached_of_node_ID_[the clickNode of me] of me is not true
      then
         put true into sScanNow
      else
         put true into tRenderExpand
      end if
      */
      
   end if
   dispatch "nodeDoubleDown" with theButton, the nodeID of the target , the ID of me
   if sScanNow is true
   then
      dispatch "scanNode"
      dispatch "renderTree"
   end if
   put false into tHandlerBusy
   -- put the millisec - ms ###
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass mouseDoubleDown theButton
end mouseDoubleDown

on selectionChanged
   put the long ID of me & cr & the long ID of the target ###
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   -- beep ###
   if tReturnNode is true
   then
      # click at 0,0 # Needed to make field receive "mouseMove" BUG?
      put false into tReturnNode
   end if
   if word 2 of the selectedLine is not sLastClickLineNum
   then
      put true into tLineChanged
   else
      put false into tLineChanged
   end if
   put the nodeID of the target into tNodeID
   -- put "tNodeID" && tNodeID ###
   put word 2 of the selectedLine into sLastClickLineNum
   put word 4 of the selectedChunk into tSelectionChar
   put the name_of_node_ID_[tNodeID] of me into tName
   put the label_of_node_ID_[tNodeID] of me into tLabel
   if tLabel is not empty then put tLabel into tName
   put the number of characters of tName into tNumOfNameChars
   -- put the number of characters of line 1 to (word 2 of the selectedLine) of me into tEndCharNum
   -- put tEndCharNum - tNumOfNameChars into tNameStartCharNum
   -- if the lockText of me is false and (tSelectionChar < tNameStartCharNum or tLineChanged is true or the mouseChar is empty)
   -- then
      -- set the lockText of me to true # Takes 40 ms to set lockText!
      -- if the listBehavior of me is false then set the listBehavior of me to true
      -- if sNodeDataChanged is true then dispatch "renderTree"
   -- end if
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass selectionChanged
end selectionChanged

on rawKeyDown theKey
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   if theKey is 65293 # Return Key.
   then
      dispatch "returnInField" to me
      exit rawKeyDown
   end if
   if theKey is 65505 then exit rawKeyDown
   if there is a scrollbar "VerticalScrollbar" of me
   then
      put the thumbPosition of scrollbar "VerticalScrollbar" of me into tThumbPos
      put the pageInc of scrollbar "VerticalScrollbar" of me into tPageInc
   end if
   repeat for each line tContainerID in the nodeContainerIDs of me
      add 1 to tLineNum
      if line 1 of the hilitedNodeIDs of me is the nodeID of control ID tContainerID of me then exit repeat
   end repeat
   if theKey is 65361 or theKey is 65362 or theKey is 65363 or theKey is 65364
   then
   switch # Workaround to force arrowkey navigation when going to another card.
      case theKey is 65363 or theKey is 65364 and tLineNum is the number of lines of the visibleNodeIDs of me - the thumbPosition of scrollbar "VerticalScrollbar" of me + 1
         set the hilitedNodeIDs of me to the nodeID of control ID line tLineNum of the nodeContainerIDs of me
         break
      case theKey is 65361 or theKey is 65362 -- and tLineNum is not 1
         -- put "theKey" && theKey ###
         if tLineNum = 1
         then
            set the thumbPosition of scrollbar "VerticalScrollbar" of me to tThumbPos - 1
            set the hilitedNodeIDs of me to the nodeID of control ID line tLineNum of the nodeContainerIDs of me
         else
            set the hilitedNodeIDs of me to the nodeID of control ID line tLineNum - 1 of the nodeContainerIDs of me
         end if
         break
      case theKey is 65363 or theKey is 65364 and tLineNum is not the number of lines of the visibleNodeIDs of me
         if the bottom of control ID line tLineNum + 1 of the nodeContainerIDs of me > the bottom of me - the height of scrollbar "HorizontalScrollbar" of me
         then
            set the thumbPosition of scrollbar "VerticalScrollbar" of me to tThumbPos + 1
            set the hilitedNodeIDs of me to the nodeID of control ID line tLineNum of the nodeContainerIDs of me
         else
            set the hilitedNodeIDs of me to the nodeID of control ID line tLineNum + 1 of the nodeContainerIDs of me
         end if
         break
   end switch
    lock messages
end if

   switch
      case theKey is 65308 # mouse wheel down
         set the thumbPosition of scrollbar "VerticalScrollbar" of me to tThumbPos + tPageInc
         break
      case theKey is 65309 # mouse wheel up
         set the thumbPosition of scrollbar "VerticalScrollbar" of me to tThumbPos - tPageInc
         break
   end switch
 
   put line sClickedLineNum of the visibleNodeIDs of me into sSelectedNodeID
   if the label_of_node_ID_[sSelectedNodeID] of me is not empty
   then
      put the label_of_node_ID_[sSelectedNodeID] of me into sShownLabel
   else
      put the name_of_node_ID_[sSelectedNodeID] of me into sShownLabel
   end if
   if theKey is not 65507 and theKey is not 65505 and theKey is not 65293 # ctrlKey and shiftKey and returnKey
   then
      put the number of characters of sShownLabel into numberOfNameChars
      put word 4 of the selectedChunk into sSelectedCharNum
      if theKey is 65288 # backspaceKey
      then
         if sNofCharsToSelection is sSelectedCharNum
         then
            exit rawKeyDown
         end if
      end if
      if theKey is 65535 # deleteKey
      then
         if the tool is not "pointer tool"
         then
         if the lockText of the target is true
         then
            set the wholeMatches to true
            put lineOffset(line 1 of the hilitedNodeIDs of me , the visibleNodeIDs of me) into tNodeLine
            dispatch "delete_node_ID" with the hilitedNodeIDs of me
            dispatch "renderTree"
            put the hilitedNodeIDs of me into tHilitedNodeIDs
            put line tNodeLine of the visibleNodeIDs of me into tHilitedNodeIDs
            set the hilitedNodeIDs of me to tHilitedNodeIDs
            -- dispatch "renderTree"
         end if
         end if
      end if
   end if
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass rawKeyDown theKey
end rawKeyDown

on arrowKey theKey
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   -- put the nodeID of the target ###
   put the nodeID of the target into sSelectedNodeID
   if the short name of this stack is not "rTreeEngine"
   then
      set the clickNode of stack "rTreeEngine" to sSelectedNodeID
      set the LongTreeID of stack "rTreeEngine" to the long ID of me
      set the LongStackID of stack "rTreeEngine" to the long ID of this stack
      set the LongCardID of stack "rTreeEngine" to the long ID of this card
   end if
   
   if there is a card ID the cardID_of_node_ID_[sSelectedNodeID] of me
   then
      go to card ID the cardID_of_node_ID_[sSelectedNodeID] of me
   end if
   if the ID of the target is among the lines of the nodeContainerIDs of me and the lockText of the target is false
   then
      try
      put the number of characters of the name_of_node_ID_[sSelectedNodeID] of the target into numberOfNameChars
      put the number of characters of line 1 to sClickedLineNum of the target - numberOfNameChars  into sNofCharsToSelection
      put word 4 of the selectedChunk into sSelectedCharNum
      switch
         case theKey is "up"
            select after character sNofCharsToSelection of the target
            exit arrowKey
            break
         case theKey is "down"
            select after line sClickedLineNum of the target
            exit arrowKey
            break
         case theKey is "right"
            if sNofCharsToSelection + numberOfNameChars is sSelectedCharNum then exit arrowKey
            break
         case theKey is "left"
            if sNofCharsToSelection is sSelectedCharNum then exit arrowKey
            break
      end switch
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
      pass arrowKey theKey
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
end arrowKey

on rawKeyUp theKey
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   if theKey is 65505 then exit rawKeyUp
   if the customBehavior of me is not true \
          and theKey is not 65507 \ # ctrlKey 
          and theKey is not 65505 \ # shiftKey
          and theKey is not 65361 \ # arrowLeft
          and theKey is not 65362 \ # arrowUp
          and theKey is not 65363 \ # arrowRight
          and theKey is not 65364 \ # arrowDown
          and theKey is not 65293 \ # returnKey
          and the ctrlKey is not down
    then
       put the target into sNodeID
       put round(the depth_of_node_ID_[sNodeID] of me) into tNumOfCharsNotName
       add the indent_of_node_ID_[sNodeID] of me to tNumOfCharsNotName
       switch the expanded_of_node_ID_[sNodeID] of me
          case true
             if the useFirstIcon_of_node_ID_[sNodeID] of me is not false and the firstIconExpanded_of_node_ID_[sNodeID] of me is not empty then add 2 to tNumOfCharsNotName
             if the useSecondIcon_of_node_ID_[sNodeID] of me is not false and the secondIconExpanded_of_node_ID_[sNodeID] of me is not empty then add 2 to tNumOfCharsNotName
             if the useThirdIcon_of_node_ID_[sNodeID] of me is not false and the thirdIconExpanded_of_node_ID_[sNodeID] of me is not empty then add 2 to tNumOfCharsNotName
             break
          case false
             if the useFirstIcon_of_node_ID_[sNodeID] of me is not false and the firstIconCollapsed_of_node_ID_[sNodeID] of me is not empty then add 2 to tNumOfCharsNotName
             if the useSecondIcon_of_node_ID_[sNodeID] of me is not false and the secondIconCollapsed_of_node_ID_[sNodeID] of me is not empty then add 2 to tNumOfCharsNotName
             if the useThirdIcon_of_node_ID_[sNodeID] of me is not false and the thirdIconCollapsed_of_node_ID_[sNodeID] of me is not empty then add 2 to tNumOfCharsNotName
       end switch
       add 1 to tNumOfCharsNotName
       put character tNumOfCharsNotName to - 1 of line 1 of the target into sName ###
       if the language of me is not empty
       then
          put the language of me into sLanguage
          put sLanguage & "Label_of_node_ID_" & "[" & sNodeID & "]" into sLabelA
          set the sLabelA of me to sName
          set the label_of_node_ID_[sNodeID] of me to sName
       else
          set the name_of_node_ID_[sNodeID] of me to sName
       end if
       put true into sNodeDataChanged
    end if
    unlock screen
    catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass rawKeyUp theKey
end rawKeyUp

# on returnKey
   if the long ID of me is in the long ID of the target
   then
      dispatch "returnInField" to me
   end if
end returnKey

on returnInField
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   put true into tHandlerBusy
   if the newNodeOnReturn of me is empty and the environment is not "development" then set the newNodeOnReturn of me to false
   if the customBehavior of me is not true and the newNodeOnReturn of me is false -- and the lockText of the target is false
   then
      -- set the lockText of me to true
      -- set the listBehavior of me to true
      -- select line sClickedLineNum of me
   end if
   if the newNodeOnReturn of me is not false
   then
      -- if me is empty then put 1 into sClickedLineNum
      put line 1 of the hilitedNodeIDs of me into sClickedNodeID
      if me is empty then put 1 into sClickedNodeID
      put the nodeIDs of me into sNodeIDs
      if the lastNodeID of me is empty
      then
         put the number of lines of the nodeIDs of me into sNewNodeID
      else
         put the lastNodeID of me into sNewNodeID
      end if
      put the lastNodeID of me + 1 into sNewNodeID
      set the lastNodeID of me to sNewNodeID
      put the nodeIDs of me into sNodeIDs
      put cr & sNewNodeID after sNodeIDs
      if character 1 of sNodeIDs is cr then delete character 1 of sNodeIDs
      set the nodeIDs of me to sNodeIDs
      if the number of lines of the nodeIDs of me is 1
      then
         # Set Tree properties.
         repeat for each line sProperty in the TreeProperties of stack "rTreeEngine"
            if the sProperty of me is empty then set the sProperty of me to empty
         end repeat
         if the expanded_of_node_ID_[sNewNodeID] of me is empty and the sourcePath_of_node_ID_[sNewNodeID] of me is not empty then set the expanded_of_node_ID_[sNewNodeID] of me to false
         if the nodeType_of_node_ID_[sNewNodeID] of me is empty then set the nodeType_of_node_ID_[sNewNodeID] of me to empty
         if the secondIconCollapsed_of_node_ID_[sNewNodeID] of me is empty then set the secondIconCollapsed_of_node_ID_[sNewNodeID] of me to empty
         if the secondIconExpanded_of_node_ID_[sNewNodeID] of me is empty then set the secondIconExpanded_of_node_ID_[sNewNodeID] of me to empty
      end if
      if the depth_of_node_ID_[sNewNodeID] of me is empty then set the depth_of_node_ID_[sNewNodeID] of me to 0
      if the expanded_of_node_ID_[sNewNodeID] of me is empty then set the expanded_of_node_ID_[sNewNodeID] of me to true
      if the parent_of_node_ID_[sNewNodeID] of me is empty then set the parent_of_node_ID_[sNewNodeID] of me to 0
      put the nodeIDs of me into sNodeIDs
      put the number_of_node_ID_[sClickedNodeID] of me into sClickedNodeNum
      if me is empty then put 1 into sClickedNodeNum
      put the number of lines of the family_of_node_ID_[sClickedNodeID] of me into sNumOfNodesInFamily
      if sNumOfNodesInFamily > 0
      then
         switch
            case the expanded_of_node_ID_[sClickedNodeID] of me is true
               put cr & line - 1 of sNodeIDs after line sClickedNodeNum of sNodeIDs
               set the depth_of_node_ID_[sNewNodeID] of me to round(the depth_of_node_ID_[sClickedNodeID] of me) + 1
               break
            case the expanded_of_node_ID_[sClickedNodeID] of me is false
               put cr & line - 1 of sNodeIDs after line sClickedNodeNum + sNumOfNodesInFamily - 1 of sNodeIDs
               set the depth_of_node_ID_[sNewNodeID] of me to round(the depth_of_node_ID_[sClickedNodeID] of me)
               break
            default
         end switch
         delete line - 1 of sNodeIDs
      end if
      set the nodeIDs of me to sNodeIDs
      put round(the depth_of_node_ID_[sClickedNodeID] of me) into sDepth
      switch
         case the sourcePath_of_node_ID_[sNewNodeID] of me is not empty
            set the cached_of_node_ID_[sNewNodeID] of me to true
            set the expanded_of_node_ID_[sNewNodeID] of me to false
            -- set the firstIconCollapsed_of_node_ID_[sNewNodeID] of me to the firstIconCollapsed of me
            -- set the firstIconExpanded_of_node_ID_[sNewNodeID] of me to the firstIconExpanded of me
            -- set the secondIconCollapsed_of_node_ID_[sNewNodeID] of me to the secondIconCollapsed of me
            -- set the secondIconExpanded_of_node_ID_[sNewNodeID] of me to the secondIconExpanded of me
            break
         default
            -- set the firstIconCollapsed_of_node_ID_[sNewNodeID] of me to the firstIconCollapsed of me
            -- set the firstIconExpanded_of_node_ID_[sNewNodeID] of me to the firstIconExpanded of me
            -- set the secondIconCollapsed_of_node_ID_[sNewNodeID] of me to the secondIconCollapsed of me
            -- set the secondIconExpanded_of_node_ID_[sNewNodeID] of me to the secondIconExpanded of me
      end switch
      put the path_of_node_ID_[sClickedNodeID] of me into sTempPath
      if character - 1 of sTempPath is "/" then delete character - 1 of sTempPath
      set the path_of_node_ID_[sNewNodeID] of me to sTempPath & "/" & the name_of_node_ID_[sNewNodeID] of me
      dispatch "renderTree"
      
      /*
      if the number of lines of the target is 1
      then
         set the lockText of the target to false
         set the listbehavior of the target to false
      end if
      if the lockText of the target is true
      then
         if the number of lines of the target is 1
         then
            set the hilitedLines of the target to sClickedLineNum
         else
            set the hilitedLines of the target to sClickedLineNum + 1
         end if
      else
         if the label_of_node_ID_[sNewNodeID] of me is empty
         then
            put the number of characters of the name_of_node_ID_[sNewNodeID] of me into sNumOfNameChars
         else
            put the number of characters of the label_of_node_ID_[sNewNodeID] of me into sNumOfNameChars
         end if
         if the number of lines of the target is 1
         then
            select character - sNumOfNameChars to - 1 of line sClickedLineNum of the target
         else
            select character - sNumOfNameChars to - 1 of line sClickedLineNum + 1 of the target
         end if
      end if
      if the number of lines of the target is not 1 then add 1 to sClickedLineNum
      */
      
      dispatch "newNode" with sNewNodeID, the ID of me
      put true into tReturnNode
      return sNewNodeID
   end if
   unlock screen
   put false into tHandlerBusy
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass returnInField
end returnInField

on tabKey
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   if the customBehavior of me is not true and the lockText of me is false
   then
      if sClickedLineNum is the number of lines of me then exit tabKey
      put line sClickedLineNum + 1 of the visibleNodeIDs of me into sSelectedNodeID
      put the number of characters of line 1 to sClickedLineNum + 1 of me into sNofCharsToSelection
      if the label_of_node_ID_[sNewNodeID] of me is empty
      then
         put the number of characters of the name_of_node_ID_[sSelectedNodeID] of me into numberOfNameChars
         put sNofCharsToSelection - numberOfNameChars + 1 into nameStartCharNum
      else
         put the number of characters of the label_of_node_ID_[sSelectedNodeID] of me into numberOfNameChars
         put sNofCharsToSelection - numberOfNameChars + 1 into nameStartCharNum
      end if
      select character nameStartCharNum to sNofCharsToSelection of me
      add 1 to sClickedLineNum
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  if the customBehavior of me is true then pass tabKey
  end if
end tabKey

on commandKeyDown theKey
   if the long ID of me is in the long ID of the target
   then
   try
   if theKey is "v" and the clipBoard is "text"
   then
      set the lockText of the target to true
   if the short name of the target is not "backgroundField" then set the listBehavior of the target to true
   put the nodeID of the target into tDropNodeID
   repeat for each line tPath in the clipboardData["text"]
      put tPath & cr before tSourcePathsReversed
   end repeat
   if character 1 of tSourcePathsReversed is cr then delete character 1 of tSourcePathsReversed
   if character - 1 of tSourcePathsReversed is cr then delete character - 1 of tSourcePathsReversed
   put 0 into tNumberAdd
   repeat for each line tSourcePath in tSourcePathsReversed
      -- add 1 to tNumberAdd
      dispatch "new_node" to me
      put the ID_of_the_last_node of me into tNewNodeID
      set the sourcePath_of_node_ID_[tNewNodeID] of me to tSourcePath
      -- put "tDropNodeID" && tDropNodeID  ###
      if tDropNodeID is not empty
      then
         put the number_of_node_ID_[tDropNodeID] of me + 1 into tNewNumber
         put round(the depth_of_node_ID_[tDropNodeID] of me) + 1 into tNewDepth
      end if
      -- put "tNewDepth" && tNewDepth  ###
      switch
         case tDropNodeID is empty and the mouseV < the top of me + the topMargin of me - the borderWidth of me - 2
            -- set the number_of_node_ID_[tNewNodeID] of me to 1 + tNumberAdd
            set the number_of_node_ID_[tNewNodeID] of me to 1
            break
         case tDropNodeID is empty and the mouseV > the top of me + the formattedHeight of me
            -- set the number_of_node_ID_[tNewNodeID] of me to the number_of_node_ID_[line - 1 of the visibleNodeIDs of me] of me + 1 + tNumberAdd
            set the number_of_node_ID_[tNewNodeID] of me to the number_of_node_ID_[line - 1 of the visibleNodeIDs of me] of me + 1
            break
         default
            if the expandOnDrop of me is true then set the expanded_of_node_ID_[tDropNodeID] of me to true
            if tNewNumber is empty then put 1 into tNewNumber
            set the number_of_node_ID_[tNewNodeID] of me to tNewNumber + tNumberAdd
            set the depth_of_node_ID_[tNewNodeID] of me to tNewDepth
      end switch
      set the itemDelimiter to slash
      put item - 1 of tSourcePath into tNameTemp
      set the itemDelimiter to comma
      put 0 into sCharNum
      repeat for each character sCharacter in tNameTemp
         if sCharacter is not tab then exit repeat
         add 1 to sCharNum
      end repeat
      put character sCharNum + 1 to - 1 of tNameTemp into tName
      set the name_of_node_ID_[tNewNodeID] of me to tName
      -- if tNewNumber is 0 then put 0 into sCharNum
      put sCharNum into sDepth
      -- put "sDepth" && sDepth ###
      -- put the depth_of_node_ID_[tNewNodeID] of me ###
      set the depth_of_node_ID_[tNewNodeID] of me to round(the depth_of_node_ID_[tNewNodeID] of me) + sDepth
   end repeat
   dispatch "render_tree" to me
end if
catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
end commandKeyDown

on mouseUp theButton
   -- beep
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   put true into tHandlerBusy
   -- put the target ###
   if word 2 of the mouseLine is not an integer then put empty into tMouseUpLine
    if the ctrlKey is down
   then
      pass mouseUp
   end if
   if the shiftKey is down
   then
      pass mouseUp
   end if
   put the customProperties of me into sCustomProperties
   repeat for each key tKey in sCustomProperties
      replace cr with comma in sCustomProperties[tKey]
   end repeat
   combine sCustomProperties using cr and tab
   -- put sCustomProperties
   -- put sCustomProperties into field "TreeProperties" of card "TreeProperties" of stack "rTreeEngine"
   switch
      case theButton is 3 and the short name of this stack is not "rTreeEngine"
         if the useContextMenu of me is not false and the useContextMenu_of_node_ID_[the nodeID of the target] of me is not false
         then
            set the visible of stack "rTreeEngine" to false
            put the visible of stack "rTreeEngine" into tVisible
            put the recentCards of stack "rTreeEngine" into tRecentCards
            -- put "mouseV" &&  the mouseV && "the top of me" && the top of me
            /*
            -- set the rectangle of stack "rTreeEngine" to the ResizedRectangle of stack "rTreeEngine"  
            -- dispatch "stackID" to button "NodeMenu" of card "Engine" of stack "rTreeEngine" with the long ID of this stack
            set the LongStackID of button "NodeMenu" of card "Engine" of stack "rTreeEngine" to the long ID of this stack
            set the LongCardID of button "NodeMenu" of card "Engine" of stack "rTreeEngine" to the long ID of this card
            set the clickNode of stack "rTreeEngine" to the clickNode of me
            set the LongTreeID of stack "rTreeEngine" to the long ID of me
            set the LongStackID of stack "rTreeEngine" to the long ID of this stack
            set the LongCardID of stack "rTreeEngine" to the long ID of this card
            */
            
            switch
               case the name of the target is the name of control "backgroundField"  -- + the topMargin of me - the borderWidth of me - 2
               dispatch "treeID" to button "TreeMenu" of card "Engine" of stack "rTreeEngine" with the long ID of me , the long ID of the target
               set the visible of stack "rTreeEngine" to false
               set the decorations of stack "rTreeEngine" to "default"
               palette stack "rTreeEngine"
               open card "Engine" of stack "rTreeEngine"
               popup button "TreeMenu" of card "Engine" of stack "rTreeEngine"
               -- open card "TreeProperties" of stack "rTreeEngine"
               set the rectangle of stack "rTreeEngine" to the ResizedRectangle of stack "rTreeEngine" 
               break
            case word 1 of the short name of the target is "NodeContainer" and the lockText of the target is true
               lock screen
               dispatch "treeID" to button "NodeMenu" of card "Engine" of stack "rTreeEngine" with the long ID of me , the long ID of the target
               -- set the visible of stack "rTreeEngine" to false
               set the decorations of stack "rTreeEngine" to "default"
               palette stack "rTreeEngine"
               open card "Engine" of stack "rTreeEngine"
               popup button "NodeMenu" of card "Engine" of stack "rTreeEngine"
               -- open card "NodeProperties" of stack "rTreeEngine"
               set the rectangle of stack "rTreeEngine" to the ResizedRectangle of stack "rTreeEngine" 
                --set the visible of stack "rTreeEngine" to true
               unlock screen
               break
            case the ID of the target is among the lines of the badgeContainerIDs of me
               dispatch "treeID" to button "BadgeMenu" of card "Engine" of stack "rTreeEngine" with the long ID of me , the long ID of the target
               set the decorations of stack "rTreeEngine" to "default"
               palette stack "rTreeEngine"
               open card "Engine" of stack "rTreeEngine"
               popup button "BadgeMenu" of card "Engine" of stack "rTreeEngine"
               set the rectangle of stack "rTreeEngine" to the ResizedRectangle of stack "rTreeEngine" 
               break
         end switch
         -- go to card line 3 of tRecentCards
         -- put tRecentCards ###
         -- set the visible of stack "rTreeEngine" to tVisible
         end if
   end switch
   -- set the hilitedLines of me to tMouseUpLine
   -- put the mouseLine into sMouseLine
   -- put the mouseNode of me into tMouseUpNodeID
   put the nodeID of the target into tMouseUpNodeID
   -- put the number_of_node_ID_[tMouseUpNodeID] of me into sDropNodeNumber
   -- put "tDrag" && tDrag && "tMouseUpLine" && tMouseUpLine && "the mouseLine" && the mouseLine ###
   -- set the hilitedNodeIDs of me to tMouseUpNodeID
   if word 1 of the short name of the target is "nodeContainer" then set the hilitedNodeIDs of me to the nodeID of the target
   -- put false into tDrag
   set the tDrag of stack "rTreeEngine" to false
   -- send "calibrateScrollbar" to scrollbar "VerticalScrollbar" of me in 1 millisec
   put false into tHandlerBusy
   dispatch "nodeUp" with theButton , the nodeID of the target , the ID of me
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  pass mouseUp theButton
  end if
end mouseUp

on copy_node theNodeIDs
   try
   set the customPropertySet of me to "number_of_node_ID_"
   put the customProperties of me into sNumberA
   set the customPropertySet of me to empty
   replace cr with comma in theNodeIDs
   repeat for each item sNodeID in theNodeIDs
      if sNumberA[sNodeID] is not empty then put sNumberA[sNodeID] & comma & sNodeID & cr after sNumIDList
   end repeat
   delete character - 1 of sNumIDList
   sort sNumIDList numeric
   put item 2 of line 1 of sNumIDList into sIDsToCopy
   put the number of lines of the family_of_node_ID_[sIDsToCopy] of me into sNumOfFamilyLines
   repeat for each line sNumID in sNumIDList
      if sNumID is line 1 of sNumIDList or sNumberA[line - 1 of sIDsToCopy] + sNumOfFamilyLines > item 1 of sNumID then next repeat
      put cr & item 2 of sNumID after sIDsToCopy
      put the number of lines of the family_of_node_ID_[item 2 of sNumID] of me into sNumOfFamilyLines
   end repeat
   if character 1 of sIDsToCopy is cr then delete character 1 of sIDsToCopy
   if character - 1 of sIDsToCopy is cr then delete character - 1 of sIDsToCopy
   set the treeClipBoard of me to sIDsToCopy
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end copy_node

on move_node_ID tID tExpression
   put the children_of_node_ID_[the parent_of_node_ID_[tID] of me] of me into tChildren
   put the number_of_node_ID_[line - 1 of tChildren] of me into tLastChildNum
   put the number_of_node_ID_[tID] of me into sFirstLN
   switch word 1 of tExpression
      case "down"
         if sFirstLN + (word - 1 of tExpression) > tLastChildNum then put "last" into tExpression
         break
      case "up"
         if sFirstLN - (word - 1 of tExpression) <= the number_of_node_ID_[the parent_of_node_ID_[tID] of me] of me then put "first" into tExpression
         break
   end switch
   put the family_of_node_ID_[tID] of me into sFamily
   put the family_of_node_ID_[the parent_of_node_ID_[tID] of me] of me into sParentFamily
   put the nodeIDs of me into sTempnodeIDs
   put the number of lines of sFamily + the number_of_node_ID_[tID] of me into sLastLN
   switch word 1 of tExpression
      case "down"
         put cr & sFamily after line (the number_of_node_ID_[tID] of me + (word - 1 of tExpression)) of sTempnodeIDs
         delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
         break
      case "up"
         delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
         put cr & sFamily after line (the number_of_node_ID_[tID] of me - 1- (word - 1 of tExpression)) of sTempnodeIDs
         break
      case "last"
         put cr & sFamily after line (the number_of_node_ID_[line - 1 of sParentFamily] of me) of sTempnodeIDs
         delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
         break
      case "first"
         delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
         put cr & sFamily after line the number_of_node_ID_[the parent_of_node_ID_[tID] of me] of me of sTempnodeIDs
         break
   end switch
   set the nodeIDs of me to sTempnodeIDs
end move_node_ID

on moveSomeNodes
   lock screen
   try
   put the millisec into moveSomeNodes ###
   put true into tHandlerBusy
   -- put true into sSetNumberHandlerBusy
   # Drag & Drop Nodes.
   -- put the nodeID of the target into tMouseUpNodeID
   put the number_of_node_ID_[tMouseUpNodeID] of me into sDropNodeNumber
   -- put line word 2 of the mouseLine + the thumbPosition of scrollbar ID the scrollbarID of me - 1 of the visibleNodeIDs of me into sDropNodeID
   put tMouseUpNodeID into sDropNodeID
   put the nodeIDs of me into sTempnodeIDs
   
   put the family_of_node_ID_[sClickedNodeID] of me into sFamily
   
   if sDropNodeID is among the lines of sFamily or (the nodeType_of_node_ID_[sDropNodeID] of me is "file" and tBetweenNodes is not true)
   then # Drop not allowed
      put false into tHandlerBusy
      put false into sSetNumberHandlerBusy
      pass moveSomeNodes
      exit moveSomeNodes
   end if
   
   set the customPropertySet of me to "depth_of_node_ID_"
   put the customProperties of me into sDepthA
   set the customPropertySet of me to "parent_of_node_ID_"
   put the customProperties of me into sParentA
   set the customPropertySet of me to empty
   
   put sDepthA[sClickedNodeID] into sOldDepth
   put sDepthA[tMouseUpNodeID] into sDropLineDepth
   
   if tClickedNodeNumber is not sDropNodeNumber and tBetweenNodes is not true -- and tDrag is true
   then
      if the expandOnDrop of me is not false then set the expanded_of_node_ID_[tMouseUpNodeID] of me to true
      put sDropLineDepth - sOldDepth into tDepthDiff
      put tMouseUpNodeID into sParentA[sClickedNodeID]
      repeat for each line sLine in sFamily
         put tDepthDiff + 1 + sDepthA[sLine] into sNewDepth
         put sNewDepth into sDepthA[sLine]
      end repeat
      put tClickedNodeNumber into sFirstLN
      put the number of lines of sFamily + tClickedNodeNumber into sLastLN
      switch
         case sDropNodeNumber > tClickedNodeNumber
            put cr & sFamily after line sDropNodeNumber of sTempnodeIDs
            delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
            break
         case (sDropNodeNumber < tClickedNodeNumber) and sDropNodeNumber is not 0
            delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
            put cr & sFamily after line sDropNodeNumber of sTempnodeIDs
            break
         default
      end switch
      put true into tDragDropped
   end if
   
   if tClickedNodeNumber is not sDropNodeNumber and tBetweenNodes is true # Drop between nodes.
   then
      switch
         case  tAboveNodeID is empty # Node is dropped at the top of tree.
            put 0 into sParentA[sClickedNodeID]
            put 0 - sOldDepth into tDepthDiff
            put 0 into sDropNodeNumber
            break
         case tBelowNodeID is empty # Node is dropped at the bottom of tree.
            put 0 into sParentA[sClickedNodeID]
            put sDepthA[tAboveNodeID] - sOldDepth into tDepthDiff
            put the number of lines of the nodeIDs of me into sDropNodeNumber
            break
         case sDepthA[tAboveNodeID] = sDepthA[tBelowNodeID] # Node is dropped between nodes with the same depth.
            put sParent[tAboveNodeID] into sParent[sClickedNodeID]
            put sDepthA[tAboveNodeID] - sOldDepth into tDepthDiff
            put the number_of_node_ID_[tBelowNodeID] of me - 1 into sDropNodeNumber
            break
         case sDepthA[tAboveNodeID] < sDepthA[tBelowNodeID] # Node is dropped under expanded node with children.
            put sParent[tBelowNodeID] into sParent[sClickedNodeID]
            put sDepthA[tAboveNodeID] - sOldDepth + 1 into tDepthDiff
            put the number_of_node_ID_[tAboveNodeID] of me into sDropNodeNumber
            break
         case sDepthA[tAboveNodeID] > sDepthA[tBelowNodeID] # Node is dropped between higher depth above and lower below.
            put sParent[tAboveNodeID] into sParent[sClickedNodeID]
            put sDepthA[tAboveNodeID] - sOldDepth into tDepthDiff
            put the number_of_node_ID_[tBelowNodeID] of me - 1 into sDropNodeNumber
            break
         default
      end switch
      
      repeat for each line sLine in sFamily
         put tDepthDiff + sDepthA[sLine] into sNewDepth
         put sNewDepth into sDepthA[sLine]
      end repeat
      
      put tClickedNodeNumber into sFirstLN
      put the number of lines of sFamily + tClickedNodeNumber into sLastLN
      switch
         case sDropNodeNumber > tClickedNodeNumber
            put cr & sFamily after line sDropNodeNumber of sTempnodeIDs
            delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
            break
         case (sDropNodeNumber < tClickedNodeNumber) and sDropNodeNumber is not 0
            delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
            put cr & sFamily after line sDropNodeNumber of sTempnodeIDs
            break
         case sDropNodeNumber is 0
            delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
            put sFamily & cr before line sDropNodeNumber of sTempnodeIDs
            break
         default
      end switch
      put true into tDragDropped
   end if
   
   if tDragDropped is true
   then
      if the autoSourcePath of me is true # Sets the sourcePath of the nodeFamily on drop.
      then
         put sFamily into tClickedNodeFamily
         put the sourcePath_of_node_ID_[tMouseUpNodeID] of me into sDropNodeSourcePath
         set the itemDelimiter to slash
         put item - 1 of the sourcePath_of_node_ID_[sClickedNodeID] of me into sSourceName
         set the itemDelimiter to comma
         put true into tSetFromMoveSomeNodes
         set the sourcePath_of_node_ID_[sClickedNodeID] of me to sDropNodeSourcePath & slash & sSourceName
         put false into tSetFromMoveSomeNodes
      end if
   end if
   ### 390 ms
   set the customPropertySet of me to "depth_of_node_ID_"
   set the customProperties of me to sDepthA
   set the customPropertySet of me to "parent_of_node_ID_"
   set the customProperties of me to sParentA
   set the customPropertySet of me to empty
   ### 900 ms
    set the nodeIDs of me to sTempnodeIDs
   ### 2600 ms
    
   ### Vet ej om detta ska med!?
   # if the expandOnDrop of me is not false and tBetweenNodes is not true
   # then
      # set the expanded_of_node_ID_[tMouseUpNodeID] of me to true
      # if the cached_of_node_ID_[tMouseUpNodeID] of me is not true then dispatch "scanNode" with tMouseUpNodeID
   # end if
   ###
   
   dispatch "renderTree"
   set the hilitedNodeIDs of me to sDropNodeID
   set the defaultFolder to $HOMEDRIVE & slash # Needed to free the nodes from being locked by process.
   dispatch "dragNodeEnd" with the clickNode of me , tMouseUpNodeID , the ID of me
   put false into tDragDropped
   put false into tHandlerBusy
   -- dispatch "calibrateScrollbar" to scrollbar ID the scrollbarID of me with the visibleNodeIDs of me
   unlock screen 
   ### 2800 ms
   -- put "moveSomeNodes" && the millisec - moveSomeNodes ###
   put false into sSetNumberHandlerBusy
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  pass moveSomeNodes
end moveSomeNodes

on mouseRelease
   if the long ID of me is in the long ID of the target
   then
      -- lock screen
      -- put "the clickNode" && the clickNode of me && the mouseControl ### WORKS!
   end if
   pass mouseRelease
end mouseRelease

on mouseDoubleUp theButton
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   /*
   if the mouseCharChunk is not empty
   then
      put the imageSource of the mouseCharChunk into tIconID
   else
      put empty into tIconID
   end if
   if tIconID is not empty and (tIconID is the firstIconCollapsed_of_node_ID_[the clickNode of me] of me or tIconID is the firstIconExpanded_of_node_ID_[the clickNode of me] of me)
   then
      pass mouseDoubleUp
   end if
   if tIconID is not empty and (tIconID is the checkedIcon of me or tIconID is the uncheckedIcon of me)
   then
      pass mouseDoubleUp
   end if
   if the ctrlKey is down
   then
      pass mouseDoubleUp
   end if
   if the shiftKey is down
   then
      pass mouseDoubleUp
   end if
   put false into tDrag # Prevents drag when mouse moves after mouseDoubleUp.
   put false into tTwoMouseUp
   put word 2 of the mouseCharChunk into tSelectionChar
   put the name_of_node_ID_[the clickNode of me] of me into tName
   put the label_of_node_ID_[the clickNode of me] of me into tLabel
   if tLabel is not empty then put tLabel into tName
   put the number of characters of tName into tNumOfNameChars
   put the number of characters of line 1 to word 2 of the mouseLine of me into tEndCharNum
   put tEndCharNum - tNumOfNameChars into tNameStartCharNum
   if the editNodeOnDoubleClick of me is not false and tSelectionChar > tNameStartCharNum # 
   then
      set the lockText of me to false # Takes 40 ms to set lockText!
      if the listBehavior of me is true then set the listBehavior of me to false
      select character tNameStartCharNum + 1 to tEndCharNum of me
   end if
   */
   
   dispatch "nodeDoubleUp" with theButton, the nodeID of the target , the ID of me
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end if
pass mouseDoubleUp
end mouseDoubleUp

on scanNode theNodeID
   lock screen
   try
   dispatch "startScanNode" with theNodeID , the ID of me
   put true into tHandlerBusy
   put the clickNode of me into sClickNode
   if theNodeID is not empty then put theNodeID into sClickNode
   set the customPropertySet of me to "name_of_node_ID_"
   put the customProperties of me into sNameA
   set the customPropertySet of me to "depth_of_node_ID_"
   put the customProperties of me into sDepthA
   set the customPropertySet of me to "expanded_of_node_ID_"
   put the customProperties of me into sExpandedA
   set the customPropertySet of me to "sourcePath_of_node_ID_"
   put the customProperties of me into sSourcePathA
   set the customPropertySet of me to "nodeType_of_node_ID_"
   put the customProperties of me into sNodeTypeA
   set the customPropertySet of me to empty
   if the useCache of me is true or the useCache of me is empty then set the cached_of_node_ID_[sClickNode] of me to true #
   put the sourcePath_of_node_ID_[sClickNode] of me into sSourcePath
   if character - 1 of sSourcePath is slash then delete character - 1 of sSourcePath
   -- put sSourcePath & "/" into sPath # OLD
   put the shortFilePath of sSourcePath into sPath # NEW
   set the defaultFolder to sPath
   if sSourcePath is empty or the result is "can't open directory"
   then
      set the cached_of_node_ID_[sClickNode] of me to false
      -- dispatch "renderTree"
      exit scanNode
   end if
   if character - 1 of sPath is slash then delete character - 1 of sPath # Removes slash after drive letter e.g. C:/
   put round(the depth_of_node_ID_[sClickNode] of me) + 1 into sNewDepth
   put the lastNodeID of me into sNodeID
   put empty into sNewVisibleNodeIDs
   repeat for each line sLine in the folders
      if item 1 of sLine is ".." then next repeat
      add 1 to sNodeID
      put sNodeID & cr after sNewVisibleNodeIDs
      put sLine into sNameA[sNodeID]
      put sNewDepth into sDepthA[sNodeID]
      put false into sExpandedA[sNodeID]
      put sPath & "/" & sLine into sSourcePathA[sNodeID]
      put "folder" into sNodeTypeA[sNodeID]
   end repeat
   repeat for each line sLine in the files
      add 1 to sNodeID
      put sNodeID & cr after sNewVisibleNodeIDs
      put sLine into sNameA[sNodeID]
      put sNewDepth into sDepthA[sNodeID]
      put sPath & "/" & sLine into sSourcePathA[sNodeID]
      put "file" into sNodeTypeA[sNodeID]
   end repeat
   delete character - 1 of sNewVisibleNodeIDs
   put the NodeIDs of me into sNodeIDs
   if sNewVisibleNodeIDs is not empty then
      put cr & sNewVisibleNodeIDs after line tClickedNodeNumber of sNodeIDs
   end if
   set the lastNodeID of me to sNodeID
   
   put true into tSetFromScanNode
   set the customPropertySet of me to "name_of_node_ID_"
   set the customProperties of me to sNameA
   set the customPropertySet of me to "depth_of_node_ID_"
   set the customProperties of me to sDepthA
   set the customPropertySet of me to "expanded_of_node_ID_"
   set the customProperties of me to sExpandedA
   set the customPropertySet of me to "sourcePath_of_node_ID_"
   set the customProperties of me to sSourcePathA
   set the customPropertySet of me to "nodeType_of_node_ID_"
   set the customProperties of me to sNodeTypeA
   set the customPropertySet of me to empty
   put false into tSetFromScanNode
   -- set the itemDelimiter to comma
   -- set the customPropertySet of me to empty
   set the NodeIDs of me to sNodeIDs
   dispatch "finnishedScanNode" with theNodeID, the number of lines of sNewVisibleNodeIDs, the ID of me
   dispatch "renderTree" to me
   unlock screen
   put false into tHandlerBusy
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
   pass scanNode theNodeID
end scanNode

on update_tree
   lock screen
   dispatch "renderTree"
end update_tree

on render_tree
   lock screen
   dispatch "renderTree"
end render_tree

on draw_tree
   lock screen
   dispatch "renderTree"
end draw_tree

on redraw_tree
   lock screen
   dispatch "renderTree"
end redraw_tree

on repaint_tree
   lock screen
   dispatch "renderTree"
end repaint_tree

on paint_tree
   lock screen
   dispatch "renderTree"
end paint_tree

on redraw_tree
   lock screen
   dispatch "renderTree"
end redraw_tree

on refresh_tree
   lock screen
   dispatch "renderTree"
end refresh_tree

on updateTree
   lock screen
   dispatch "renderTree"
end updateTree

on drawTree
   lock screen
   dispatch "renderTree"
end drawTree

on redrawTree
   lock screen
   dispatch "renderTree"
end redrawTree

on repaintTree
   lock screen
   dispatch "renderTree"
end repaintTree

on paintTree
   lock screen
   dispatch "renderTree"
end paintTree

on redrawTree
   lock screen
   dispatch renderTree
end redrawTree

on refreshTree
   lock screen
   dispatch "renderTree"
end refreshTree

on renderTree
   dispatch "startCalculateTree" to me with the ID of me
   lock screen
   try
   put the millisec into ms ###
   unlock messages
   put true into tHandlerBusy
   
   /*
   # Nag
   -- put the effective textFont of card "Images" of stack "rTreeEngine" ###
   if the serial of card "Images" of stack "rTreeEngine" is not among the items of gSerialSet
   then
      if gRandomRenders is empty then put 20 into gRandomRenders
      if gNumOfRenders is not gRandomRenders
      then
         add 1 to gNumOfRenders
      else
         beep
         send "nagTheUser" to button "Continue Trial" of card "Engine" of stack "rTreeEngine"
         put 0 into gNumOfRenders
         put random ( 40 ) into gRandomRenders
      end if
   end if # End nag
   */
   
   set the defaultFolder to $HOMEDRIVE & slash # Needed to free the nodes from being locked by process. # 0 ms from start
   # Set Tree properties.
   repeat for each line sProperty in the TreeProperties of stack "rTreeEngine"
      if the sProperty of me is empty then set the sProperty of me to empty
   end repeat
   if the betweenNodesDelta of me is empty then set the betweenNodesDelta of me to 4
   if the showInvisibleNodes of me is empty then set the showInvisibleNodes of me to false
   -- if the nodeHeight of me is empty then set the nodeHeight of me to "21"
   if the autoScrollbar of me is empty then set the autoScrollbar of me to true # 0 ms from start
   if sNewNodeIDs is not empty
   then
      set the customPropertySet of me to "depth_of_node_ID_"
      set the customProperties of me to sDepthA
      -- set the customPropertySet of me to "children_of_node_ID_"
      -- set the customProperties of me to sChildrenA
      set the customPropertySet of me to empty
      set the nodeIDs of me to sNewNodeIDs
      put empty into sDepthA
      -- put empty into sChildrenA
      put empty into sNewNodeIDs
   end if
   # Build rTree native format array.
   if the keys of sNodeDataA is not empty and sRootNodeIDs is empty
   then
      lock messages
      repeat for each key tNodeID in sNodeDataA
         put cr & tNodeID after tNodeIDs
         put sNodeDataA[tNodeID] into tPropertiesA
         repeat for each key tProperty in tPropertiesA
            put tProperty & "_of_node_ID_" into tPropset
            put "[" & tNodeID & "]" after tPropset
            set the tPropset of me to tPropertiesA[tProperty]
         end repeat
      end repeat
      delete character 1 of tNodeIDs
      sort tNodeIDs numeric
      unlock messages
      set the nodeIDs of me to tNodeIDs
   end if
   # Build relations format array.
   put the millisec into ms ###
   if the keys of sNodeDataA is not empty and sRootNodeIDs is not empty
   then
      lock messages
      replace comma with cr in sRootNodeIDs
      if character 1 of sRootNodeIDs is cr then delete character 1 of sRootNodeIDs
      if character - 1 of sRootNodeIDs is cr then delete character - 1 of sRootNodeIDs
      put sRootNodeIDs into tNodeIDs
      put sRootNodeIDs & cr & the keys of sNodeDataA after tNodeIDsUnsorted
      repeat for each line tRootNodeID in sRootNodeIDs
         put 0 into tDepthA[tRootNodeID]
      end repeat
      put 0 into tLineNum
      repeat until tNodeIDs is empty
         put line 1 of tNodeIDs into tNodeID
         delete line 1 of tNodeIDs
         put cr & tNodeID after tSortedNodeIDs
         put sNodeDataA[tNodeID] into tPropertiesA
         repeat for each key tProperty in tPropertiesA
            put tProperty & "_of_node_ID_" into tPropset
            put "[" & tNodeID & "]" after tPropset
            set the tPropset of me to tPropertiesA[tProperty]
         end repeat
         put sNodeDataA[tNodeID]["children"] into tChildren
         replace comma with cr in tChildren
         if character 1 of tChildren is cr then delete character 1 of tChildren
         if character - 1 of tChildren is cr then delete character - 1 of tChildren
         if tChildren is not empty
         then
            repeat for each line tChildNodeID in tChildren
               put tDepthA[tNodeID] + 1 into tDepthA[tChildNodeID]
            end repeat
            put tChildren & cr before tNodeIDs
         end if
      end repeat
      unlock messages
      set the customPropertySet of me to "depth_of_node_ID_"
      set the customProperties of me to tDepthA
      set the customPropertySet of me to empty
      if character 1 of tSortedNodeIDs is cr then delete character 1 of tSortedNodeIDs
      if character - 1 of tSortedNodeIDs is cr then delete character - 1 of tSortedNodeIDs
      -- put the millisec - ms ###
      set the nodeIDs of me to tSortedNodeIDs
   end if
   
   put empty into sNodeDataA
   put empty into sRootNodeIDs
   put empty into tLineNum
   put the selectedChunk into sSelectedChunk ###
   if tNodeIDsToCopy is not empty then dispatch "applyCopyNode" with tNodeIDsToCopy
   if tNodeIDsToDelete is not empty then dispatch "applyDeleteNode" with tNodeIDsToDelete
   put the effective textColor of me into sEffectiveTextColorOfMe # Makes Nodes inherit textColor if it is set.
   put the language of me into sLanguage
   put the treeType of me into tTreeType
   put the dontChangeHiliteText of me into tDontChangeHiliteText
   put the firstIconCollapsed of me into sFirstIconCollapsedOfMe
   put the firstIconExpanded of me into sFirstIconExpandedOfMe
   put the secondIconCollapsed of me into sSecondIconCollapsedOfMe
   put the secondIconExpanded of me into sSecondIconExpandedOfMe
   put the fileIcon of me into sFileIconOfMe # 1 ms from start
   set the customPropertySet of me to "expanded_of_node_ID_"
   put the customProperties of me into sExpandedA
   set the customPropertySet of me to "depth_of_node_ID_"
   put the customProperties of me into sDepthA
   set the customPropertySet of me to "visible_of_node_ID_"
   put the customProperties of me into sVisibleA
   set the customPropertySet of me to empty
   repeat for each line sLine in the nodeIDs of me
      if tProcessingNewNode is true
      then
         add 1 to tNumber
         put tNumber into tNumberA[sLine]
         set the itemDelimiter to slash
         put sLine into item sDepthA[sLine] + 1 of tIDpath
         delete item sDepthA[sLine] + 2 to - 1 of tIDpath
         put tIDpath into tIDpathA[sLine]
         put item - 2 of tIDpath into tParentA[sLine]
         set the itemDelimiter to comma
      end if
      # Find visible nodes
      if sSkip is true and sDepthA[sLine] > sCollapsedNodeDepth then next repeat else put false into sSkip
      if sVisibleA[sLine] is false and the showInvisibleNodes of me is not true
      then
         put sDepthA[sLine] into sCollapsedNodeDepth
         put true into sSkip
         next repeat
      end if
      put sLine & cr after tVisibleNodeIDs
      if sExpandedA[sLine] is false then
         put true into sSkip
         put sDepthA[sLine] into sCollapsedNodeDepth
      end if
   end repeat
   if tProcessingNewNode is true
   then
      set the customPropertySet of me to "number_of_node_ID_"
      set the customProperties of me to tNumberA
      set the customPropertySet of me to "IDpath_of_node_ID_"
      set the customProperties of me to tIDpathA
      set the customPropertySet of me to "parent_of_node_ID_"
      set the customProperties of me to tParentA
      set the customPropertySet of me to empty
   end if
   dispatch "finishedCalculateTree" with the ID of me
   -- dispatch "startRenderTree" with the ID of me
   -- put character - 1 of tVisibleNodeIDs into field "BenchMarkInfo" ###
   if character - 1 of tVisibleNodeIDs is cr
   then
      delete character - 1 of tVisibleNodeIDs
   end if
   set the visibleNodeIDs of me to tVisibleNodeIDs
   -- if tVisibleNodeIDs is empty then dispatch "calibrateScrollbar" to scrollbar "VerticalScrollbar" of me
   put false into tProcessingNewNode
   put false into tHandlerBusy
   -- if there is a field "BenchMarkInfo"
   -- then
      -- put "Calculated" && the number of lines of the nodeIDs of me && " nodes in" && the millisec - ms && "ms" & cr after field "BenchMarkInfo" ###
      -- set the vScroll of field "BenchMarkInfo" to the formattedHeight of field "BenchMarkInfo"
   -- end if
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end renderTree

on scrollbarDrag
   if the long ID of me is in the long ID of the target
   then
   try
   if sLineLocs is not true and tHandlerBusy is not true
   then
      -- dispatch "lineLocs" to me
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass scrollbarDrag
end scrollbarDrag

# on lineLocs
try
   if the short name of this card is "Engine" then exit "lineLocs"
   put the millisec into ms ###
   put true into sLineLocs
   focus field "backgroundField" of me
   lock screen
   put the vScroll of me into tVscroll
   put the hilitedLines of me into tHilitedLines
   set the customPropertySet of me to "nodeControl_of_node_ID_"
   put the customProperties of me into tNodeControlA
   set the customPropertySet of me to empty
   repeat for each element tControlID in tNodeControlA
      if there is a control ID tControlID then set the visible of control ID tControlID to false
   end repeat
   put the number of lines of me into tNumOfLines
   put statRound(tNumOfLines / 2) into tTestLineNum
   put statRound(tTestLineNum / 2) into tDelta
   put the formattedHeight of me into tFormattedHeight
   if tFormattedHeight = 0 then put 1 into tFormattedHeight
   repeat 1000 times
      put the formattedHeight of line tTestLineNum of me into tTestLineHeight
      put the formattedHeight of line 1 to tTestLineNum of me into tTestHeight
      put (tTestHeight - tVscroll) / tFormattedHeight into tRatio
      put statRound(tNumOfLines * tRatio) into tDelta
      subtract tDelta from tTestLineNum
      if abs(tTestHeight - tVscroll) <= tTestLineHeight  then exit repeat
   end repeat
   put tTestLineNum into tTopLineNum
   select line tTestLineNum + 2 of me
   put item 2 of the selectedLoc into tSelectedTop
   put tSelectedTop - (the formattedHeight of line tTestLineNum of me) - 1 into tShownLinesHeight
   repeat the height of me times
      add 1 to tTestLineNum
      add 1 to tNumOfShowedLines
      put the nodeControl_of_node_ID_[line tTestLineNum of the visibleNodeIDs of me] of me into tControlID
      if there is a control ID tControlID
      then
         set the top of control ID tControlID to tShownLinesHeight
         if the vScrollbar of me is true then put the scrollbarWidth of me into tScrollbarWidth 
         set the right of control ID tControlID to the right of me - tScrollbarWidth
         set the visible of control ID tControlID to true
      end if
      add the formattedHeight of line tTestLineNum of me to tShownLinesHeight
      if tShownLinesHeight > the height of me then exit repeat
   end repeat
   set the hilitedLines of me to tHilitedLines
   set the vScroll of me to tVscroll
   -- put "tTestLineNum" && tTestLineNum ###
   # Construct htmlText
   repeat for each line tNodeID in the visibleNodeIDs of me
      add 1 to tLineNum
      if tLineNum < tTopLineNum or tLineNum > tTopLineNum + tNumOfShowedLines + 10
      then
         put "<p>" after sHtmlText
         next repeat
      end if
      put empty into sDepthSpace
      repeat round(the depth_of_node_ID_[tNodeID] of me) times
         put "&#9;" after sDepthSpace # Tab
      end repeat
      repeat the indent_of_node_ID_[tNodeID] of me times
         put space after sDepthSpace
      end repeat
      put "<p>" into sHtmlLine
      put empty into sHtmlTextStyle
      put empty into sHtmlTextStyleEnd
      if the textStyle_of_node_ID_[tNodeID] of me is not empty
      then
      repeat for each item sItem in the textStyle_of_node_ID_[tNodeID] of me
         switch
            case sItem is "plain"
               put empty into sHtmlTextStyle
               put empty into sHtmlTextStyleEnd
               break
            case sItem is "bold"
               put "<b>" after sHtmlTextStyle
               put "</b>" after sHtmlTextStyleEnd
               break
            case sItem is "italic"
               put "<i>" after sHtmlTextStyle
               put "</i>" after sHtmlTextStyleEnd
               break
            case sItem is "underline"
               put "<u>" after sHtmlTextStyle
               put "</u>" after sHtmlTextStyleEnd
               break
            case sItem is "expanded"
               put "<expanded>" after sHtmlTextStyle
               put "</expanded>" after sHtmlTextStyleEnd
               break
            case sItem is "condensed"
               put "<condensed>" after sHtmlTextStyle
               put "</condensed>" after sHtmlTextStyleEnd
               break
            case sItem is "strike"
               put "<strike>" after sHtmlTextStyle
               put "</strike>" after sHtmlTextStyleEnd
               break
            case sItem is "box"
               put "<box>" after sHtmlTextStyle
               put "</box>" after sHtmlTextStyleEnd
               break
            case sItem is "threeDbox"
               put "<threedbox>" after sHtmlTextStyle
               put "</threedbox>" after sHtmlTextStyleEnd
               break
            case sItem is "link"
               put "<a>" into sHtmlTextStyle
               put "</a>" after sHtmlTextStyleEnd
               break
         end switch
      end repeat
   end if
      put sDepthSpace after sHtmlLine
      if sNovel is not empty # Second time or more Node is rendered.
      then
         put the firstIconCollapsed_of_node_ID_[tNodeID] of me into sFirstIconCollapsed
         put the firstIconExpanded_of_node_ID_[tNodeID] of me into sFirstIconExpanded
         put the secondIconCollapsed_of_node_ID_[tNodeID] of me into sSecondIconCollapsed
         put the secondIconExpanded_of_node_ID_[tNodeID] of me into sSecondIconExpanded
         put the thirdIconCollapsed_of_node_ID_[tNodeID] of me into sThirdIconCollapsed
         put the thirdconExpanded_of_node_ID_[tNodeID] of me into sThirdIconExpanded
      end if
      switch
         case the expanded_of_node_ID_[tNodeID] of me is true     
            if sFirstIconExpanded is an integer and the useFirstIcon_of_node_ID_[tNodeID] of me is not false and the nodeType_of_node_ID_[tNodeID] of me is not "file" then put "<img src=" & sFirstIconExpanded & ">" & space after sHtmlLine
            if sSecondIconExpanded is an integer and the useSecondIcon_of_node_ID_[tNodeID] of me is not false then put "<img src=" & sSecondIconExpanded & ">" & space after sHtmlLine
            if sThirdIconExpanded is an integer and the useThirdIcon_of_node_ID_[tNodeID] of me is not false then put "<img src=" & sThirdIconExpanded & ">" & space after sHtmlLine
            break
         case the expanded_of_node_ID_[tNodeID] of me is false     
            if sFirstIconCollapsed is an integer and the useFirstIcon_of_node_ID_[tNodeID] of me is not false and the nodeType_of_node_ID_[tNodeID] of me is not "file" then put "<img src=" & sFirstIconCollapsed & ">" & space after sHtmlLine
            if sSecondIconCollapsed is an integer and the useSecondIcon_of_node_ID_[tNodeID] of me is not false then put "<img src=" & sSecondIconCollapsed & ">" & space after sHtmlLine
            if sThirdIconCollapsed is an integer and the useThirdIcon_of_node_ID_[tNodeID] of me is not false then put "<img src=" & sThirdIconCollapsed & ">" & space after sHtmlLine
            break
      end switch
      put empty into sFontSizeColor
      if the textFont_of_node_ID_[tNodeID] of me is not empty then put "face=" & quote & the textFont_of_node_ID_[tNodeID] of me & quote after sFontSizeColor
      if the textSize_of_node_ID_[tNodeID] of me is not empty then put "size=" & quote & the textSize_of_node_ID_[tNodeID] of me & quote after sFontSizeColor
      if tDontChangeHiliteText is true  then put "color=" & quote & sEffectiveTextColorOfMe & quote after sFontSizeColor # Prevents text color from changing when hiliting.
      if the textColor_of_node_ID_[tNodeID] of me is not empty then put "color=" & quote & the textColor_of_node_ID_[tNodeID] of me & quote after sFontSizeColor
      if sFontSizeColor is not empty
      then
         put "<font " after sHtmlLine
         put sFontSizeColor & ">" after sHtmlLine
      end if
      put sHtmlTextStyle after sHtmlLine
      if the label_of_node_ID_[tNodeID] of me is empty then put the name_of_node_ID_[tNodeID] of me after sHtmlLine else put the label_of_node_ID_[tNodeID] of me after sHtmlLine
      put sHtmlTextStyleEnd after sHtmlLine
      if sFontSizeColor is not empty then put "</font>" after sHtmlLine # 230ms for 21710 Nodes
      put "</p>" after sHtmlLine
      put sHtmlLine into sHtmlTextA[sLine]
      -- set the htmlText of me to sHtmlLine
      -- put the formattedHeight of line 1 of me into tBottomA[sLine]
      put sHtmlLine & cr after sHTMLText
      -- if sExpandedA[sLine] is false then
         -- put true into sSkip
         -- put sDepthA[sLine] into sCollapsedNodeDepth
      -- end if
   end repeat
   repeat for each line tNodeID in the keys of sTextShiftA
      put the number of characters of sNameA[tNodeID] into tNumOfNameChars
      if sTextShiftA[tNodeID] is not empty then set the textShift of character - tNumOfNameChars to - 1 of line sNodeLineA[tNodeID] of me to sTextShiftA[tNodeID]
   end repeat
   -- repeat the number of lines of the visibleNodeIDs of me times
      -- add 1 to tLineNum
      -- put tLineNum & "<p>" after tContent
   -- end repeat
   -- put tTopLineNum ###
   -- put sHTMLText after line 20 of tContent
   -- set the htmlText of field "TRY" to sHTMLText
   -- set the htmlText of me to sHTMLText
   replace "<p>" with "<p >" in sHTMLText
   set the htmlText of me to sHTMLText
   set the hilitedLines of me to tHilitedLines
   set the vScroll of me to tVscroll
   unlock screen
   put false into sLineLocs
   -- put the millisec - ms ###
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end lineLocs

on dragEnter
   if the long ID of me is in the long ID of the target
   then
   try
   put true into sDragEnter
   -- set the rectangle of control "dragIndicator" of me to the rectangle of the target
   if "rTreeEngine" is not among the lines of the openStacks
   then
      open invisible stack "rTreeEngine"
   end if
   if word 1 of the target is "field"
   then
      set the lockText of the target to true
      if the short name of the target is not "backgroundField" then set the listBehavior of the target to true
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass dragEnter
end dragEnter

on dragStart
   if the long ID of me is in the long ID of the target
   then
   try
   if word 1 of the short name of the target is "NodeContainer"
   then
      try
      dispatch "dragNodeStart" with sSelectedNodeID , the ID of me
      set the LongDragStartControlID of stack "rTreeEngine" to the long ID of me
      if it is "handled"
      then
         set the tDrag of stack "rTreeEngine" to false
         set the tDragNodeStart of stack "rTreeEngine" to false
      else
         set the dragData to the clickNode of me & comma & the long ID of me
         set the tDragNodeStart of stack "rTreeEngine" to true
         if the lockText of the target is true then set the tDrag of stack "rTreeEngine" to true
      end if
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
      pass dragStart
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end if
pass dragStart
end dragStart

on dragMove pMouseH, pMouseV
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   set the dragAction to "move"
   set the enabled of control "dragIndicator" of me to false
   put false into tBetweenNodes
   if the mouseV - the top of the target < the betweenNodesDelta of me
   then
      set the rectangle of control "dragIndicator" of me to the topLeft of the target , the topRight of the target
      put true into tBetweenNodes
   end if
   if the bottom of the target - the mouseV < the betweenNodesDelta of me
   then
      set the rectangle of control "dragIndicator" of me to the bottomLeft of the target , the bottomRight of the target
      put true into tBetweenNodes
   end if
   if tBetweenNodes is false
   then
      set the rectangle of control "dragIndicator" of me to the rectangle of the target
   end if
   if the useDragIndicator of me is not false
   then
      set the visible of control "dragIndicator" of me to true
   end if
   unlock screen
   put the nodeID of the target into tDropNodeID
   put the mouseV - the top of me into tMouseTopDelta
   put the bottom of me - the mouseV into tMouseBottomDelta
   if the mouseV > the top of me and the mouseV < the top of me + 16
   then
      repeat until (the mouseloc is not pMouseH,pMouseV) or (mouse(1) is "up" and mouse(3) is "up")
         set the thumbposition of scrollbar "VerticalScrollbar" of me to the thumbposition of scrollbar "VerticalScrollbar" of me - 0.1 * (16 / tMouseTopDelta)^3
      end repeat
   end if
   if the mouseV < the bottom of me and the mouseV > the bottom of me - 16
   then
      repeat until (the mouseloc is not pMouseH,pMouseV) or (mouse(1) is "up" and mouse(3) is "up")
         set the thumbposition of scrollbar "VerticalScrollbar" of me to the thumbposition of scrollbar "VerticalScrollbar" of me + 0.1 * (16 / tMouseBottomDelta)^3
      end repeat
   end if
   dispatch "dragNodeMove" with the clickNode of me , the ID of me
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass dragMove
end dragMove

on dragLeave
   if the long ID of me is in the long ID of the target
   then
      -- set the rectangle of control "dragIndicator" of me to the rectangle of the target
   end if
   pass dragLeave
end dragLeave

on dragDrop
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   put true into tHandlerBusy
   set the visible of control "dragIndicator" of me to false
   put the nodeID of the target into tDropNodeID
   put the nodeID of the target into tMouseUpNodeID
   set the wholeMatches to true
   put false into tBetweenNodes
   if the mouseV - the top of the target < the betweenNodesDelta of me
   then
      put line (lineOffset(the ID of the target , the nodeContainerIDs of me) + the thumbposition of scrollbar "VerticalScrollbar" of me - 1) of the visibleNodeIDs of me into tBelowNodeID
      put line (lineOffset(the ID of the target , the nodeContainerIDs of me) + the thumbposition of scrollbar "VerticalScrollbar" of me - 1) - 1 of the visibleNodeIDs of me into tAboveNodeID
      put true into tBetweenNodes
      put "Above" into tSide
   end if
   if the bottom of the target - the mouseV < the betweenNodesDelta of me
   then
      put line (lineOffset(the ID of the target , the nodeContainerIDs of me) + the thumbposition of scrollbar "VerticalScrollbar" of me - 1) + 1 of the visibleNodeIDs of me into tBelowNodeID
      put line (lineOffset(the ID of the target , the nodeContainerIDs of me) + the thumbposition of scrollbar "VerticalScrollbar" of me - 1) of the visibleNodeIDs of me into tAboveNodeID
      put true into tBetweenNodes
      put "Below" into tSide
   end if
   
   -- put "tDropNodeID" && tDropNodeID && the family_of_node_ID_[the clickNode of me] of me && the nodeType_of_node_ID_[the clickNode of me] of me ###
   -- put "dragData" && item 1 of dragData && "the clickNode of me" && the clickNode of me ###
   if sDragEnter is not true
   then
      if the nodeType_of_node_ID_[tDropNodeID] of me is "file" and tBetweenNodes is not true or tDropNodeID is among the lines of the family_of_node_ID_[the clickNode of me] of me
      then
         dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of me with the thumbposition of scrollbar "VerticalScrollbar" of me
         exit dragDrop
      end if
   end if
   if sDragEnter is true and the nodeType_of_node_ID_[tDropNodeID] of me is "file" and tBetweenNodes is not true
   then
      dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of me with the thumbposition of scrollbar "VerticalScrollbar" of me
      put false into sDragEnter
      set the LongDragStartControlID of stack "rTreeEngine" to empty
      exit dragDrop
   end if
   put false into sDragEnter
   
   put the LongDragStartControlID of stack "rTreeEngine" into sLongDragStartControlID
   -- dispatch "dragNodeStart" with sSelectedNodeID , the ID of me
   -- if it is "handled" then put false into tDragNodeStart else put true into tDragNodeStart
   dispatch "dragNodeDrop" to me with sClickedNodeID , tMouseUpNodeID , the ID of me
   -- put "tDrag" && tDrag ###
   if the tDrag of stack "rTreeEngine" is true and the long ID of me is sLongDragStartControlID # Drag & Drop Nodes within the same Tree
   then
      dispatch "moveSomeNodes" to me
      -- put false into tDragNodeStart
      set the tDragNodeStart of stack "rTreeEngine" to false
      -- put false into tDrag
      set the tDrag of stack "rTreeEngine" to false
      set the LongDragStartControlID of stack "rTreeEngine" to empty
      exit dragDrop # Do not pass as the actual dropping is taken care of by "moveSomeNodes"
   end if
   # Drag and Drop into another rTree control
   if sLongDragStartControlID is not empty
   then
   if the long ID of me is not sLongDragStartControlID and the behavior of the owner of the dragSource is "button id 2135 of stack" && quote & "rTreeEngine" & quote
   then
      if the ctrlKey is not down
      then
         dispatch "delete_node_ID" to sLongDragStartControlID with the hilitedNodeIDs of sLongDragStartControlID
      end if
      put the nodeIDs of me into tNodeIDs
      put the hilitedNodeIDs of sLongDragStartControlID
      repeat for each line tHilitedNodeID in the hilitedNodeIDs of sLongDragStartControlID
         put the family_of_node_ID_[tHilitedNodeID] of sLongDragStartControlID into tFamily
         put the lastNodeID of me into tLastNodeID
         put round(the depth_of_node_ID_[tHilitedNodeID] of sLongDragStartControlID) into tDepthDiff
         repeat for each line tID in tFamily
            add 1 to tLastNodeID
            put cr & tLastNodeID after tDroppedNodeIDs
            repeat for each line tCustomPropertySet in the customPropertySets of sLongDragStartControlID
               if tCustomPropertySet is "depth_of_node_ID_" then next repeat
               if tCustomPropertySet is "number_of_node_ID_" then next repeat
               if tCustomPropertySet is "ID_of_node_ID_" then next repeat
               if tCustomPropertySet is "IDpath_of_node_ID_" then next repeat
               if tCustomPropertySet is "parent_of_node_ID_" then next repeat
               put tCustomPropertySet & "[" & tID & "]" into tPropSet
               put tCustomPropertySet & "[" & tLastNodeID & "]" into tNewPropSet
               set the tNewPropSet of me to the tPropSet of sLongDragStartControlID
            end repeat
            put round(the depth_of_node_ID_[tMouseUpNodeID] of me) into tMouseUpNodeIDdepth
            if tMouseUpNodeIDdepth is empty then put - 1 into tMouseUpNodeIDdepth
            set the depth_of_node_ID_[tLastNodeID] of me to tMouseUpNodeIDdepth + 1 - tDepthDiff + round(the depth_of_node_ID_[tID] of sLongDragStartControlID)
         end repeat
         set the lastNodeID of me to tLastNodeID
      end repeat
      put the nodeLine_of_node_ID_[tMouseUpNodeID] of me into tMouseLine
      if tMouseLine is empty
      then
         put the number of lines of the nodeIDs of me into tMouseLine
      end if
      repeat for each line tDroppedID in tDroppedNodeIDs
         if tDroppedID is not in tUniqueDroppedNodeIDs then put tDroppedID & cr after tUniqueDroppedNodeIDs
      end repeat
      if character - 1 of tUniqueDroppedNodeIDs is cr then delete character - 1 of tUniqueDroppedNodeIDs
      if line 2 of tUniqueDroppedNodeIDs is an integer then put tUniqueDroppedNodeIDs after line tMouseLine of tNodeIDs
      if character 1 of tNodeIDs is cr then delete character 1 of tNodeIDs
      if character - 1 of tNodeIDs is cr then delete character - 1 of tNodeIDs
      set the nodeIDs of me to tNodeIDs
      set the hilitedNodeID of me to tMouseUpNodeID
      dispatch "renderTree" to me
      dispatch "renderTree" to sLongDragStartControlID
      set the LongDragStartControlID of stack "rTreeEngine" to empty
      exit dragDrop
   end if
   end if
   
   put - 0 into tNumberAdd
   if tBetweenNodes is true and tSide is "Above" then subtract 1 from tNumberAdd
   repeat for each line tSourcePath in the dragData
      put the lastNodeID of me + 1 into sNewNodeID
      set the lastNodeID of me to sNewNodeID
      put cr & sNewNodeID after tNewNodeIDs
      set the sourcePath_of_node_ID_[sNewNodeID] of me to tSourcePath
      if tDropNodeID is not empty
      then
         put the number_of_node_ID_[tDropNodeID] of me into tNewNumber
         put round(the depth_of_node_ID_[tDropNodeID] of me) + 1 into tNewDepth
         if tBetweenNodes is true then subtract 1 from tNewDepth
      end if
      switch
         case the mouseV < the top of me + the topMargin of me - the borderWidth of me - 2
            put 1 + tNumberAdd into tNumber
            break
         case the mouseV > the top of me + the formattedHeight of me
            put the number_of_node_ID_[line - 1 of the visibleNodeIDs of me] of me + 1 + tNumberAdd into tNumber
            break
         default
            if the expandOnDrop of me is not false then set the expanded_of_node_ID_[tDropNodeID] of me to true
            if tNewNumber is empty then put 1 into tNewNumber
            put tNewNumber + tNumberAdd into tNumber
            set the depth_of_node_ID_[sNewNodeID] of me to tNewDepth
      end switch
      set the itemDelimiter to slash
      put item - 1 of tSourcePath into tNameTemp
      set the itemDelimiter to comma
      put 0 into sCharNum
      repeat for each character sCharacter in tNameTemp
         if sCharacter is not tab then exit repeat
         add 1 to sCharNum
      end repeat
      put character sCharNum + 1 to - 1 of tNameTemp into tName
      set the name_of_node_ID_[sNewNodeID] of me to tName
      if tNumberAdd is 0 then put 0 into sCharNum
      put sCharNum into sDepth
      set the depth_of_node_ID_[sNewNodeID] of me to round(the depth_of_node_ID_[sNewNodeID] of me) + sDepth
   end repeat
   put the nodeIDs of me into tNodeIDs
   put tNewNodeIDs after line tNumber of tNodeIDs
   if character 1 of tNodeIDs is cr then delete character 1 of tNodeIDs
   if character - 1 of tNodeIDs is cr then delete character - 1 of tNodeIDs
   
   set the nodeIDs of me to tNodeIDs
   dispatch "renderTree" to me
   set the LongDragStartControlID of stack "rTreeEngine" to empty
   put false into tHandlerBusy
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  unlock screen
end if
pass dragDrop
end dragDrop

on resizeControl
   lock screen
   -- beep
   if the long ID of me is in the long ID of the target
   then
      -- beep
      dispatch "updateGeometry" to me
      if the mouse is "up"
      then
         
         dispatch "updateGeometry" to me
      end if
   end if
   unlock screen
   pass resizeControl
end resizeControl

on mouseMove
   if the long ID of me is in the long ID of the target
   then
      
   try
      set the lockLocation of me to true
      if the tool is not "pointer tool" and sMouseWithin is true and the ctrlKey is not down
      then
         put the mouse into tMouse
         if tMouse is "up" and sPreviousMouse is "down"
         then
            send "CalibrateScrollbar" to scrollbar "VerticalScrollbar" of me in 1 millisec
         end if
         if word 2 of the mouseCharChunk is not empty
         then
            put the imageSource of the mouseCharChunk into tMouseIconID
         else
            put empty into tMouseIconID
         end if
         set the mouseIcon of me to tMouseIconID
         set the vScrollbar of me to false
         set the hScrollbar of me to false
         if word 1 of the short name of the target is "NodeContainer"
         then
            if the target is not sPreviousTarget
            then
               put the nodeID of the target into tNodeID
               set the mouseNode of me to tNodeID
               dispatch "nodeEnter" with tNodeID , the ID of me
               if there is a sPreviousTarget and sPreviousTarget is not empty then put the nodeID of sPreviousTarget into tPreviousNodeID
               dispatch "nodeLeave" with tPreviousNodeID , the ID of me
            end if
            put the target into sPreviousTarget
         end if
         if the ctrlKey is down then put the target into sPreviousTarget
      end if
      # Manage geometry
      if the tool is "pointer tool" and sMouseWithin is true and the ctrlKey is not down
      then
         put the mouse into tMouse
         switch
            case tMouse is "down" and sPreviousMouse is "up"
               put the rectangle of me into sStartRectangle
               put the mouseH into sStartMouseH
               put the mouseV into sStartMouseV
               put sStartMouseH - the left of me into sLeftDelta
               put sStartMouseV - the top of me into sTopDelta
               put the right of me - sStartMouseH into sRightDelta
               put the bottom of me - sStartMouseV into sBottomDelta
               break
            case tMouse is "up" and sPreviousMouse is "down"
               set the lockLocation of me to true
         end switch
         if tMouse is "down" and the tool is "pointer tool"
         then
            put sStartRectangle into tRectangle
            switch
               case sTopDelta > 8 and sLeftDelta > 8 and sBottomDelta > 8 and sRightDelta > 8 and tMouse is "down" -- and sPreviousMouse is "up"
                  set the left of me to item 1 of the mouseLoc - sLeftDelta
                  set the top of me to item 2 of the mouseLoc - sTopDelta
                  break
               case sTopDelta < 8 and sLeftDelta < 8
                  set the lockLocation of me to true
                  put the mouseV - sTopDelta into item 2 of tRectangle
                  put the mouseH - sLeftDelta into item 1 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
               case sTopDelta < 8 and sRightDelta < 8 ###
                  set the lockLocation of me to true
                  put the mouseV - sTopDelta into item 2 of tRectangle
                  put the mouseH + sRightDelta into item 3 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
               case sBottomDelta < 8 and sLeftDelta < 8 ###
                  set the lockLocation of me to true
                  put the mouseV + sBottomDelta into item 4 of tRectangle
                  put the mouseH - sLeftDelta into item 1 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
               case sBottomDelta < 8 and sRightDelta < 8
                  set the lockLocation of me to true
                  put the mouseV + sBottomDelta into item 4 of tRectangle
                  put the mouseH + sRightDelta into item 3 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
               case sLeftDelta < 8
                  set the lockLocation of me to true
                  put the mouseH - sLeftDelta into item 1 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
               case sTopDelta < 8
                  set the lockLocation of me to true
                  put the mouseV - sTopDelta into item 2 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
               case sRightDelta < 8
                  set the lockLocation of me to true
                  put the mouseH + sRightDelta into item 3 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
               case sBottomDelta < 8
                  set the lockLocation of me to true
                  put the mouseV + sBottomDelta into item 4 of tRectangle
                  set the rectangle of me to tRectangle
                  dispatch "updateGeometry" to me
                  break
            end switch
         end if
         # End manage geometry
         set the vScrollbar of me to false
         set the hScrollbar of me to false
      end if
      put tMouse into sPreviousMouse
   catch tError
      put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
      put item 2 of tError into tLine
      put item 4 of tError into tChunk
      delete word - 1 of tChunk
      answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
   end try
   end if
   pass mouseMove
end mouseMove

on updateGeometry
   if there is a graphic "background" of me
   then
      set the name of graphic "background" of me to "backgroundGraphic" # Backwards compatibility.
   end if
   lock messages
   set the rectangle of graphic "backgroundGraphic" of me to the rectangle of me
   set the rectangle of field "BackgroundField" of me to the rectangle of me
   set the height of scrollbar "VerticalScrollbar" of me to the height of me - the height of scrollbar "HorizontalScrollbar" of me
   set the top of scrollbar "VerticalScrollbar" of me to the top of me
   set the right of scrollbar "VerticalScrollbar" of me to the right of me
   set the width of scrollbar "HorizontalScrollbar" of me to the width of me - the width of scrollbar "VerticalScrollbar" of me
   set the bottom of scrollbar "HorizontalScrollbar" of me to the bottom of me
   set the left of scrollbar "HorizontalScrollbar" of me to the left of me
   set the rectangle of graphic "CornerPiece" of me to the topRight of scrollbar "HorizontalScrollbar" of me , the bottomRight of me
   dispatch "updateTree" to scrollbar "verticalScrollbar" of me with the thumbPosition of scrollbar "verticalScrollbar" of me
   unlock messages
end updateGeometry

# on mouseMove # OLD
   put mouse(1) into tMouse
   if tMouse is "up" and tMouseDown is not false
   then
      put false into tMouseDown
      -- put empty into sClickMouseLoc
   end if
   if tMouse is "down" and the ctrlKey is down or the shiftKey is down
   then
      -- set the multipleHilites of me to true
   else
      -- set the multipleHilites of me to false
   end if
   if tMouse is "down" and tMouseDown is not true and the ctrlKey is not down and the shiftKey is not down
   then
      put true into tMouseDown
      put the mouseLoc into sClickMouseLoc
      -- focus on me
      focus field "backgroundField" of me
      lock screen
      if the mouseCharChunk is not empty
      then
         put the imageSource of character word 2 of the mouseCharChunk of me into tIconID
      else
         put empty into tIconID
      end if
      set the itemDelimiter to comma
      put line sClickedLineNum of the visibleNodeIDs of me into sSelectedNodeID
      dispatch "dragNodeStart" with sSelectedNodeID , the ID of me
      if it is "handled" then set the tDragNodeStart of stack "rTreeEngine" to false else set the tDragNodeStart of stack "rTreeEngine" to true
      put the nodeID of the target into sClickNodeID
      put the number_of_node_ID_[the clickNode of me] of me into tClickedNodeNumber
      unlock screen
   end if
   if tMouse is "down" and the mouseLoc is within the rectangle of me
   then
      -- put "sClickMouseLoc" && sClickMouseLoc && "the mouseLoc" && the mouseLoc ###
      if abs(item 1 of sClickMouseLoc - the mouseH) > 3 or abs(item 2 of sClickMouseLoc - the mouseV) > 3
      then
         dispatch "dragNodeStart" with sSelectedNodeID , the ID of me
         if it is "handled" then set the tDrag of stack "rTreeEngine" to false else set the tDrag of stack "rTreeEngine" to true
         # put true into tDrag
      end if
      put the betweenNodesDelta of me into sBetweenDelta
      -- put 0 into sBetweenDelta # Disables drop between Nodes.
      put the mouseV - (item 2 of the selectedLoc) into sDiff
      if sBetweenDelta is 0 then put 0 into sDeltaCorrection
      if sBetweenDelta is 1 then put 1 into sDeltaCorrection
      if sBetweenDelta is 2 then put 2 into sDeltaCorrection
      if sBetweenDelta > 2 then put 3 into sDeltaCorrection
      switch
         case sDiff > (the formattedHeight of the mouseLine) - (sBetweenDelta + sDeltaCorrection) and sBetweenDelta is not 0
            put true into tBetweenNodes
            put false into tFromBelowBetweenNodes
            put (word 2 of the mouseLine) into tAboveLineNum
            put the mouseNode of me into tAboveNodeID
            put (word 2 of the mouseLine) + 1 into tBelowLineNum
            put line (word 2 of the mouseLine) + 1 of the visibleNodeIDs of me into tBelowNodeID
            put tAboveNodeID & comma & tBelowNodeID into tBetweenNodeIDs
            if round(the depth_of_node_ID_[tAboveNodeID] of me) < round(the depth_of_node_ID_[tBelowNodeID] of me)
            then
               put round(the depth_of_node_ID_[tBelowNodeID] of me) * item 1 of the tabStops of the target into sIndent
            else
               put round(the depth_of_node_ID_[tAboveNodeID] of me) * item 1 of the tabStops of the target into sIndent
            end if
            break
         case sDiff < sBetweenDelta and sBetweenDelta is not 0
            put true into tBetweenNodes
            put true into tFromBelowBetweenNodes
            put (word 2 of the mouseLine) into tBelowLineNum
            put the mouseNode of me into tBelowNodeID
            put (word 2 of the mouseLine) - 1 into tAboveLineNum
            put line (word 2 of the mouseLine) - 1 of the visibleNodeIDs of me into tAboveNodeID
            put tAboveNodeID & comma & tBelowNodeID into tBetweenNodeIDs
            if round(the depth_of_node_ID_[tAboveNodeID] of me) < round(the depth_of_node_ID_[tBelowNodeID] of me)
            then
               put round(the depth_of_node_ID_[tBelowNodeID] of me) * item 1 of the tabStops of the target into sIndent
            else
               put round(the depth_of_node_ID_[tAboveNodeID] of me) * item 1 of the tabStops of the target into sIndent
            end if
            break
         default
            put false into tBetweenNodes
            put false into tFromBelowBetweenNodes
            put empty into tAboveNodeID
            put empty into tBelowNodeID
            put empty into tBetweenNodeIDs
      end switch
      if the mouseV - ( the top of me + the topMargin of me + 2 ) > the formattedHeight of me
      then
         put line - 1 of the visibleNodeIDs of me into tAboveNodeID
         put empty into tBelowNodeID
      end if
      if tMouse is "down"
      then
         -- if tDragNodeStart is true and the lockText of me is true
         -- then
            -- put true into tDrag
         -- else
            -- put false into tDrag
         -- end if
         put line sClickedLineNum of the visibleNodeIDs of me into sSelectedNodeID
         switch
            case tBetweenNodeIDs is empty
               put the number_of_node_ID_[the mouseNode of me] of me + 1 into tDroppedNodeNewNumber
               break
            case tBetweenNodeIDs is not empty
               put the number_of_node_ID_[tAboveNodeID] of me + 1 into tDroppedNodeNewNumber
               break
         end switch
         -- dispatch "dragNodeMove" with sSelectedNodeID , tDroppedNodeNewNumber , the ID of me
         if the label_of_node_ID_[sSelectedNodeID] of me is empty
         then
            put the number of characters of the name_of_node_ID_[sSelectedNodeID] of me into numOfNameChars
         else
            put the number of characters of the label_of_node_ID_[sSelectedNodeID] of me into numOfNameChars
         end if
         put the effective hiliteColor into sHiliteColor
      else
         -- put false into tDrag
      end if
   end if
   put the mouseNode of me into sMouseNodeOfMe
   if tMouseNodeID is not sMouseNodeOfMe
   then
      if tMouse is "down" then put true into tTwoMouseUp
      dispatch "nodeLeave" with tMouseNodeID , the ID of me
      if sMouseNodeOfMe is not empty then dispatch "nodeEnter" with sMouseNodeOfMe , the ID of me
      put the mouseNode of me into tLastNodeIDEntered
      put the mouseNode of me into tMouseNodeID
   end if
end mouseMove

on mouseLeave
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   put false into sMouseWithin
   set the customPropertySet of me to empty
   dispatch "nodeLeave" with tLastNodeIDEntered , the ID of me
   -- click at 0,0 # Needed to make field receive "mouseMove" BUG?
   put false into tHandlerBusy
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
  pass mouseLeave
end mouseLeave

on create_node theName theNumber theDepth
   dispatch "new_node" to me with theName , theNumber , theDepth
end create_node

function create_node theName theNumber theDepth
   dispatch "new_node" to me with theName , theNumber , theDepth
end create_node

on new_node tParams
   lock messages
   try
      put true into tHandlerBusy
      put true into tProcessingNewNode
      set the wholeMatches to true
      replace quote with empty in tParams
      if tParams is not empty
      then
         if sNewNodeIDs is empty
         then
            set the customPropertySet of me to "depth_of_node_ID_"
            put the customProperties of me into sDepthA
            set the customPropertySet of me to "children_of_node_ID_"
            put the customProperties of me into sChildrenA
            set the customPropertySet of me to empty
            put the rootNodeIDs of me into tRootNodeIDs
            put the nodeIDs of me into sNewNodeIDs
         end if
         put the lastNodeID of me + 1 into sNewNodeID
         set the lastNodeID of me to sNewNodeID
         -- set the name_of_node_ID_[sNewNodeID] of me to word 2 of tParams
         if "child" is in tParams # Example: dispatch "create_node" to group "Tree" of me with "as child 7 of node ID 1"
         then
            if word - 6 of tParams is "-"
            then
               delete word - 6 of tParams
               put "-" before word - 5 of tParams
            end if
            put word - 5 of tParams into tPosition
            if tPosition = 0 then put - 1 into tPosition
            put word - 1 of tParams into tRelativeToID
            put sChildrenA[tRelativeToID] into tChildren
            put the number of lines of tChildren into tNofChildren
            switch
               case tPosition < 0
                  put line tPosition of tChildren into tPositionOldID
                  if tPositionOldID is empty then put tRelativeToID into tPositionOldID
                  put lineOffset(tPositionOldID , sNewNodeIDs) into tNodeNumber
                  put cr & sNewNodeID after line tNodeNumber of sNewNodeIDs
                  put cr & sNewNodeID after line tPosition of tChildren
                  break
               case tNofChildren = 0
                  put tRelativeToID into tPositionOldID
                  put lineOffset(tPositionOldID , sNewNodeIDs) into tNodeNumber
                  put cr & sNewNodeID after line tNodeNumber of sNewNodeIDs
                  put sNewNodeID into tChildren
                  break
               case tPosition = 1
                  put line tPosition of tChildren into tPositionOldID
                  put lineOffset(tPositionOldID , sNewNodeIDs) into tNodeNumber
                  put cr & sNewNodeID after line tNodeNumber - 1 of sNewNodeIDs
                  put sNewNodeID & cr before tChildren
                  break
               case tPosition > tNofChildren
                  put line tNofChildren of tChildren + 1 into tPositionOldID
                  put lineOffset(tPositionOldID , sNewNodeIDs) into tNodeNumber
                  put cr & sNewNodeID after line tNodeNumber - 1 of sNewNodeIDs
                  put cr & sNewNodeID after line tNofChildren of tChildren
                  break
               case tPosition > 1
                  put line tPosition of tChildren into tPositionOldID
                  put lineOffset(tPositionOldID , sNewNodeIDs) into tNodeNumber
                  put cr & sNewNodeID after line tNodeNumber - 1 of sNewNodeIDs
                  put cr & sNewNodeID after line tPosition of tChildren
                  break
            end switch
            if character 1 of tChildren is cr then delete character 1 of tChildren
            
            put tChildren into sChildrenA[tRelativeToID]
            put sDepthA[tRelativeToID] + 1 into sDepthA[sNewNodeID]
           
            dispatch "newNode" with sNewNodeID, the ID of me
            put false into tHandlerBusy
            return sNewNodeID
         end if
         
         if "root" is in tParams # Example: dispatch "create_node" to group "Tree" of me with "as root 2"
         then
            if word - 2 of tParams is "-"
            then
               delete word - 2 of tParams
               put "-" before word - 1 of tParams
            end if
            put word - 1 of tParams into tPosition
            if tPosition = 0 then put - 1 into tPosition
            switch
               case tRootNodeIDs is empty
                  put sNewNodeID into sNewNodeIDs
                  put sNewNodeID into tRootNodeIDs
                  break
               case tPosition < - (the number of lines of tRootNodeIDs)
                  put sNewNodeID & cr before sNewNodeIDs
                  put sNewNodeID & cr before tRootNodeIDs
                  break
               case tPosition < 0
                  put line tPosition + 1 of tRootNodeIDs into tPositionOldID
                  put lineOffset(tPositionOldID , sNewNodeIDs) - 1 into tNodeNumber
                  put cr & sNewNodeID after line tNodeNumber of sNewNodeIDs
                  put cr & sNewNodeID after line tPosition of tRootNodeIDs
                  break
               case tPosition > the number of lines of tRootNodeIDs
                  put cr & sNewNodeID after sNewNodeIDs
                  put cr & sNewNodeID after tRootNodeIDs
                  break
               case tPosition = 1
                  put sNewNodeID & cr before sNewNodeIDs
                  put sNewNodeID & cr before tRootNodeIDs
                  break
               case tPosition > 1
                  put line tPosition + 1 of tRootNodeIDs into tPositionOldID
                  put lineOffset(tPositionOldID , sNewNodeIDs) - 2 into tNodeNumber
                  put cr & sNewNodeID after line tNodeNumber of sNewNodeIDs
                  put cr & sNewNodeID after line tPosition of tRootNodeIDs
                  break
            end switch
            dispatch "newNode" with sNewNodeID, the ID of me
            put false into tHandlerBusy
            return sNewNodeID
         end if
      end if
      if tParams is empty
      then
      put true into tHandlerBusy
      put true into tProcessingNewNode
      if sNewNodeIDs is empty then put the nodeIDs of me into sNewNodeIDs
      put the lastNodeID of me + 1 into sNewNodeID
      set the lastNodeID of me to sNewNodeID
      -- set the name_of_node_ID_[sNewNodeID] of me to theName
      -- set the depth_of_node_ID_[sNewNodeID] of me to theDepth
      if sNewNodeIDs is empty
      then
         put sNewNodeID into sNewNodeIDs
      else
         put cr & sNewNodeID after sNewNodeIDs
      end if
      dispatch "newNode" with sNewNodeID, the ID of me
      put false into tHandlerBusy
      return sNewNodeID
      end if
   catch tError
      put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
      put item 2 of tError into tLine
      put item 4 of tError into tChunk
      delete word - 1 of tChunk
      answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
   end try
   unlock messages
end new_node

# on createSomeNodes theName theNumber theDepth theFirstIcon, theSecondIcon
   put true into tHandlerBusy
   put true into tProcessingNewNode
   put the nodeIDs of me into sNodeIDs
   put the lastNodeID of me + 1 into sNewNodeID
   set the lastNodeID of me to sNewNodeID
   put cr & sNewNodeID after sNodeIDs
   if character 1 of sNodeIDs is cr then delete character 1 of sNodeIDs
   set the nodeIDs of me to sNodeIDs
   dispatch "newNode" with sNewNodeID, the ID of me
   put false into tHandlerBusy
   return sNewNodeID
end createSomeNodes

on copy_node_ID
   lock screen
   try
   repeat for each character sCharacter in the params
      if sCharacter is quote then next repeat
      put sCharacter after sNodeIDs
   end repeat
   set the itemDelimiter to space
   delete item 1 of sNodeIDs
   set the itemDelimiter to comma
   put comma & sNodeIDs  after tNodeIDsToCopy
   if character 1 of tNodeIDsToCopy is comma then delete character 1 of tNodeIDsToCopy
   if character - 1 of tNodeIDsToCopy is comma then delete character - 1 of tNodeIDsToCopy
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end copy_node_ID

on delete_node
   lock screen
   try
   repeat for each character sCharacter in the params
      if sCharacter is quote then next repeat
      put sCharacter after sNodeIDs
   end repeat
   set the itemDelimiter to space
   delete item 1 of sNodeIDs
   set the itemDelimiter to comma
   put comma & sNodeIDs  after sTempNodeIDsToDelete
   if character 1 of sTempNodeIDsToDelete is comma then delete character 1 of sTempNodeIDsToDelete
   if character - 1 of sTempNodeIDsToDelete is comma then delete character - 1 of sTempNodeIDsToDelete
   repeat for each item sNodeNumber in sTempNodeIDsToDelete
      put comma & the ID_of_node_[sNodeNumber] of me after tNodeIDsToDelete
   end repeat
   if character 1 of tNodeIDsToDelete is comma then delete character 1 of tNodeIDsToDelete
   if character - 1 of tNodeIDsToDelete is comma then delete character - 1 of tNodeIDsToDelete
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end delete_node

on delete_node_ID
   lock screen
   try
   repeat for each character sCharacter in the params
      if sCharacter is quote then next repeat
      put sCharacter after sNodeIDs
   end repeat
   set the itemDelimiter to space
   delete item 1 of sNodeIDs
   -- put "sNodeIDs" && sNodeIDs ####
   replace cr with comma in sNodeIDs
   set the itemDelimiter to comma
   put comma & sNodeIDs  after tNodeIDsToDelete
   if character 1 of tNodeIDsToDelete is comma then delete character 1 of tNodeIDsToDelete
   if character - 1 of tNodeIDsToDelete is comma then delete character - 1 of tNodeIDsToDelete
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end delete_node_ID

on delete_nodeData
   lock screen
   try
   set the customPropertySets of me to empty
   set the nodeIDs of me to empty
   set the visibleNodeIDs of me to empty
   set the lastNodeID of me to empty # put empty into tLastNodeID
   -- set the text of me to empty
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end delete_nodeData

on applyDeleteNode
   lock screen
   try
   put tNodeIDsToDelete into theNodeIDs
   replace cr with comma in theNodeIDs
   -- put "theNodeIDs" && theNodeIDs ###
   -- put the family_of_node_ID_["minHeight of properties of stack" && quote & "Untitled 1" & quote] of group "Browser Tree" ###
   # Delete the whole family of the node to delete.
   -- put "theNodeIDs" && theNodeIDs ###
   repeat for each item tsNodeID in theNodeIDs
      put comma & the family_of_node_ID_[tsNodeID] of me after tNodeIDsToDeleteTEMP
   end repeat
   replace cr with comma in tNodeIDsToDeleteTEMP
   -- put "tsNodeID" && tsNodeID ###
   -- put "tNodeIDsToDeleteTEMP" && tNodeIDsToDeleteTEMP ###
   -- put "the family_of_node_ID_[sNodeID] of me" && the family_of_node_ID_[sNodeID] of me ###
   -- put the family_of_node_ID_[sNodeID] of me ###
   repeat for each item tID in tNodeIDsToDeleteTEMP
      if tID is not in tNewList then put tID & comma after tNewList
   end repeat
   put tNewList into tNodeIDsToDeleteTEMP
   if character 1 of tNodeIDsToDeleteTEMP is comma then delete character 1 of tNodeIDsToDeleteTEMP
   if character - 1 of tNodeIDsToDeleteTEMP is comma then delete character - 1 of tNodeIDsToDeleteTEMP
   put tNodeIDsToDeleteTEMP into tNodeIDsToDelete
   repeat for each item sNodeID in tNodeIDsToDelete
      put the cardID_of_node_ID_[sNodeID] of me into tCardID
      if there is a card ID tCardID
      then
         answer warning "Do you also want to delete the Card this Node is attached to?" with "No" and "Yes"
         if it is "Yes" then delete card ID tCardID
      end if
      put the number_of_node_ID_[sNodeID] of me & cr after sLineNumbers
   end repeat
   -- put "tNodeIDsToDelete" && tNodeIDsToDeleteTEMP ###
   delete character - 1 of sLineNumbers
   sort sLineNumbers descending numeric
   -- put "sLineNumbers" && sLineNumbers ###
   put the NodeIDs of me into sNodeIDs
   dispatch "deleteNode" with theNodeIDs , the ID of me
   repeat for each line sLine in sLineNumbers
      delete line sLine of sNodeIDs
   end repeat
   repeat for each line sSet in the customPropertySets of me
      set the customPropertySet of me to sSet
      put the customProperties of me into sCp
      repeat for each item sNodeID in tNodeIDsToDelete
         delete local sCp[sNodeID]
      end repeat
      set the customProperties of me to sCp
   end repeat
   set the customPropertySet of me to empty
   -- put "sNodeIDs" && sNodeIDs ###
   set the NodeIDs of me to sNodeIDs
   put empty into tNodeIDsToDelete
   -- if line 1 of the recentCards is not the ID of this card and the short name of this stack is not "rTreeEngine" then go recent card
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
   pass applyDeleteNode
end applyDeleteNode

on delete_treeData
   lock screen
   try
   -- put the scrollbarID of me into tScrollbarID
   set the customPropertySets of me to empty
   set the customProperties of me to empty
   -- set the text of me to empty
   -- set the scrollbarID of me to tScrollbarID
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end delete_treeData

# setProp #
setProp cached_of_node_[nodeNumber] newValue
   lock screen
   if tHandlerBusy is false then
      if nodeNumber is an integer
      then
         set the cached_of_node_ID_[line nodeNumber of the nodeIDs of me] of me to newValue
      else
         put the ID_of_node_[nodeNumber] of me into sNodeID
         set the cached_of_node_ID_[sNodeID] of me to newValue
      end if
   end if
end cached_of_node_

setProp children_of_node_ID_[tID] newValue
   try
      if tHandlerBusy is true
      then
         if character - 1 of newValue is cr then delete character - 1 of newValue
         pass children_of_node_ID_
      end if
      # Trap set children as it is read only.
   catch tError
      put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
      put item 2 of tError into tLine
      put item 4 of tError into tChunk
      delete word - 1 of tChunk
      answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
   end try
end children_of_node_ID_

# setProp collapsed_of_node_ID_[nodeID] newValue
   put true into sCollapsedSet
   set the expanded_of_node_ID_[nodeID] of me to not newValue
   pass collapsed_of_node_ID_
end collapsed_of_node_ID_

setProp depth_of_node_ID_[nodeID] newDepth
   lock screen
   try
      if tHandlerBusy is false and tSetParentHandler is not true and tProcessingNewNode is not true then
         put round(newDepth) into newDepth
      set the customPropertySet of me to "depth_of_node_ID_"
      put the customProperties of me into sDepthA
      set the customPropertySet of me to "parent_of_node_ID_"
      put the customProperties of me into sParentA
      set the customPropertySet of me to "number_of_node_ID_"
      put the customProperties of me into sNumberA
      set the customPropertySet of me to empty
      put newDepth - sDepthA[nodeID] into sDepthDiff
      put the family_of_node_ID_[nodeID] of me into sFamily
      repeat for each line sNodeID in sFamily
         put sDepthDiff + sDepthA[sNodeID] into sDepthA[sNodeID]
      end repeat
      set the customPropertySet of me to "depth_of_node_ID_"
      set the customProperties of me to sDepthA
      set the customPropertySet of me to empty
      # Find parent.
      combine sNumberA by cr and comma
      sort lines of sNumberA descending numeric by item 2 of each #  Reverse, so repeat for each can "step down" to parent ID.
      put newDepth into sDepthA[nodeID]
      put false into sFindParent
      repeat for each line sLine in sNumberA
         if sFindParent is true
         then
            if sDepthA[item 1 of sLine] < sDepthA[nodeID] # Sets first node with a lower depth to parent even if the depth diff > 1
            then
               put item 1 of sLine into sParentA[nodeID]
               exit repeat
            end if
         end if
         if item 1 of sLine is nodeID then put true into sFindParent
      end repeat
      set the customPropertySet of me to "parent_of_Node_ID_"
      set the customProperties of me to sParentA
      set the customPropertySet of me to empty 
   end if
   -- unlock messages
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
   pass depth_of_node_ID_
end depth_of_node_ID_

setProp depth_of_node_[nodeNumber] newDepth
   lock screen
   try
   if tHandlerBusy is false then
      if nodeNumber is an integer
      then
         set the depth_of_node_ID_[line nodeNumber of the nodeIDs of me] of me to newDepth
      else
         put the ID_of_node_[nodeNumber] of me into sNodeID
         set the depth_of_node_ID_[sNodeID] of me to newDepth
      end if
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end depth_of_node_

# setProp collapsedChar newChar
lock screen
   if tHandlerBusy is false then
      set the customPropertySet of me to "collapsedChar_of_node_ID_"
      put the customProperties of me into sCollapsedCharA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the expanded_of_node_ID_[sNodeID] of me is false then put newChar into sCollapsedCharA[sNodeID]
      end repeat
      set the customPropertySet of me to "collapsedChar_of_node_ID_"
      set the customProperties of me to sCollapsedCharA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass collapsedChar
end collapsedChar

# setProp expandedChar newChar
lock screen
   if tHandlerBusy is false then
      set the customPropertySet of me to "expandedChar_of_node_ID_"
      put the customProperties of me into sExpandedCharA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the expanded_of_node_ID_[sNodeID] of me is true then put newChar into sExpandedCharA[sNodeID]
      end repeat
      set the customPropertySet of me to "expandedChar_of_node_ID_"
      set the customProperties of me to sExpandedCharA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass expandedChar
end expandedChar

setProp expanded_of_node_[nodeNumber] newValue
   lock screen
   try
   if tHandlerBusy is false then
      if nodeNumber is an integer
      then
         set the expanded_of_node_ID_[line nodeNumber of the nodeIDs of me] of me to newValue
      else
         put the ID_of_node_[nodeNumber] of me into sNodeID
         set the expanded_of_node_ID_[sNodeID] of me to newValue
      end if
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end expanded_of_node_

setProp expanded_of_node_ID_[nodeID] newValue
   try
   -- if newValue is true then dispatch "nodeExpanded" with nodeID, the ID of me
   -- if newValue is false then dispatch "nodeCollapsed" with nodeID, the ID of me
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
   pass expanded_of_node_ID_
end expanded_of_node_ID_

setProp family_of_node_
   lock screen
   try
      # Trap setting ID as it is read only.
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end family_of_node_

setProp family_of_node_ID_
   lock screen
   try
      # Trap setting ID as it is read only.
   catch tError
      put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
      put item 2 of tError into tLine
      put item 4 of tError into tChunk
      delete word - 1 of tChunk
      answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
   end try
end family_of_node_ID_

# setProp firstIcon_of_node_[nodeNumber] newValue
lock screen
   if tHandlerBusy is false then
      if nodeNumber is an integer
      then
         set the firstIcon_of_node_ID_[line nodeNumber of the nodeIDs of me] of me to newValue
      else
         put the ID_of_node_[nodeNumber] of me into sNodeID
         set the firstIcon_of_node_ID_[sNodeID] of me to newValue
      end if
   end if
end firstIcon_of_node_

# setProp firstIconCollapsed newIconID
lock screen
   if tHandlerBusy is false then
      set the customPropertySet of me to "firstIconCollapsed_of_node_ID_"
      put the customProperties of me into sFirstIconCollapsedA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the expanded_of_node_ID_[sNodeID] of me is false then put newIconID into sFirstIconCollapsedA[sNodeID]
      end repeat
      set the customPropertySet of me to "firstIconCollapsed_of_node_ID_"
      set the customProperties of me to sFirstIconCollapsedA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass firstIconCollapsed
end firstIconCollapsed

# setProp hilitedNode theHilitedNodeNumbers
   set the customPropertySet of me to "ID_of_node_"
   put the customProperties of me into sIDA
   set the customPropertySet of me to "nodeLine_of_node_ID_"
   put the customProperties of me into sNodeLineA
   set the customPropertySet of me to empty
   replace cr with comma in theHilitedNodeNumbers
   repeat for each item sNodeNum in theHilitedNodeNumbers
      put sIDA[sNodeNum] into sNodeID
      put sNodeLineA[sNodeID] & comma after sLineNumbers
   end repeat
   set the hilitedLines of me to sLineNumbers
end hilitedNode

# setProp hilitedNodes theHilitedNodeNumbers
   if theHilitedNodeNumbers is not empty
   then
      replace cr with comma in theHilitedNodeNumbers
      repeat for each item sNodeNum in theHilitedNodeNumbers
         put the ID_of_node_[sNodeNum] of me into sNodeID
         put the nodeLine_of_node_ID_[sNodeID] of me & comma after sLineNum
      end repeat
      delete character - 1 of sLineNum
      if sLineNum is not empty then set the hilitedLines of me to sLineNum
   end if
end hilitedNodes

setProp hilitedNodeID theHilitedNodeIDs
   if the long ID of me is in the long ID of the target
   then
   -- lock screen
   try
   replace cr with comma in theHilitedNodeIDs
   repeat for each item sNodeID in theHilitedNodeIDs
      put true into tHilitedA[sNodeID] 
   end repeat
   if tHandlerBusy is not true
   then
   if the expandOnHilite of me is not false and tHandlerBusy is not true
   then
      put item 1 of theHilitedNodeIDs into tHilitedID
      -- put tHilitedID ###
      set the itemDelimiter to slash
      put item 1 to - 2 of the IDpath_of_node_ID_[tHilitedID] of me into tItems
      -- put the IDpath_of_node_ID_[tHilitedID] of me  ###
      repeat for each item tItem in tItems
         -- put tItem ###
         set the expanded_of_node_ID_[tItem] of me to true
      end repeat
      set the itemDelimiter to comma
   end if
   dispatch "renderTree" to me
   put the nodeLine_of_node_ID_[item 1 of theHilitedNodeIDs] of me into tHilitedLineNum
   put the thumbposition of scrollbar "VerticalScrollbar" of me into tThumbPos
   if tHilitedLineNum > tThumbPos and tHilitedLineNum < tThumbPos + the number of lines of the nodeContainerIDs of me
   then
      put true into tInView
   else
      put false into tInView
   end if
   if theHilitedNodeIDs is not empty and tInView is false
   then
      set the thumbposition of scrollbar "VerticalScrollbar" of me to the nodeLine_of_node_ID_[item 1 of theHilitedNodeIDs] of me
   end if
   end if
   repeat for each line tNodeContainerID in the nodeContainerIDs of me
      set the backgroundColor of control ID tNodeContainerID of me to empty
      put the nodeID of control ID tNodeContainerID of me into tNodeID
      if item 1 of theHilitedNodeIDs is tNodeID
      then
         set the opaque of control ID tNodeContainerID of me to true
         if the hiliteColor of control ID tNodeContainerID of me is empty
         then
            -- focus field "backgroundField" of me
            -- put the name_of_node_ID_[the nodeID of control ID tNodeContainerID of me] of me ###
            set the backgroundColor of control ID tNodeContainerID of me to the hiliteColor of me
         end if
      end if
   end repeat
   set the customPropertySet of me to "hilited_of_node_ID_"
   set the customProperties of me to tHilitedA
   set the customPropertySet of me to empty
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
   pass hilitedNodeID
end hilitedNodeID

setProp hilitedNodeIDs theHilitedNodeIDs
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   replace cr with comma in theHilitedNodeIDs
   repeat for each item sNodeID in theHilitedNodeIDs
      put true into tHilitedA[sNodeID] 
   end repeat
   if tHandlerBusy is not true
   then
   if the expandOnHilite of me is not false and tHandlerBusy is not true
   then
      put item 1 of theHilitedNodeIDs into tHilitedID
      set the itemDelimiter to slash
      put item 1 to - 2 of the IDpath_of_node_ID_[tHilitedID] of me into tItems
      repeat for each item tItem in tItems
         set the expanded_of_node_ID_[tItem] of me to true
      end repeat
      set the itemDelimiter to comma
   end if
   -- dispatch "calibrateScrollbar" to scrollbar "VerticalScrollbar" of me with the thumbposition of scrollbar "VerticalScrollbar" of me
   dispatch "renderTree" to me
   
   put the nodeLine_of_node_ID_[item 1 of theHilitedNodeIDs] of me into tHilitedLineNum
   put the thumbposition of scrollbar "VerticalScrollbar" of me into tThumbPos
   
   if tHilitedLineNum > tThumbPos and tHilitedLineNum < tThumbPos + the number of lines of the nodeContainerIDs of me - 1
   then
      put true into tInView
   else
      put false into tInView
   end if
   if theHilitedNodeIDs is not empty and tInView is false
   then
      put the nodeLine_of_node_ID_[item 1 of theHilitedNodeIDs] of me into tNodeLine ###
      if tNodeLine is an integer then set the thumbposition of scrollbar "VerticalScrollbar" of me to tNodeLine
   end if
   end if
   repeat for each line tNodeContainerID in the nodeContainerIDs of me
      set the backgroundColor of control ID tNodeContainerID of me to empty
      put the nodeID of control ID tNodeContainerID of me into tNodeID
      -- if item 1 of theHilitedNodeIDs is tNodeID
      if tNodeID is among the items of theHilitedNodeIDs
      then
         set the opaque of control ID tNodeContainerID of me to true
         if the hiliteColor of control ID tNodeContainerID of me is empty
         then
            -- focus control ID tNodeContainerID of me
            -- focus field "backgroundField" of me
            -- put the name_of_node_ID_[the nodeID of control ID tNodeContainerID of me] of me ###
            set the backgroundColor of control ID tNodeContainerID of me to the hiliteColor of me
         end if
      end if
   end repeat
   set the customPropertySet of me to "hilited_of_node_ID_"
   set the customProperties of me to tHilitedA
   set the customPropertySet of me to empty
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
   pass hilitedNodeIDs
end hilitedNodeIDs

# setProp hilitedNodeName theHilitedNodeNames
   if theHilitedNodeNames is not empty
   then
      replace cr with comma in theHilitedNodeNames
      repeat for each item sItem in theHilitedNodeNames
         put sItem into sItemTemp
         repeat until character 1 of sItemTemp is not space
            delete character 1 of sItemTemp
         end repeat
         repeat until character - 1 of sItemTemp is not space
            delete character - 1 of sItemTemp
         end repeat
         put sItemTemp & comma after tHNN
      end repeat
      if character - 1 of tHNN is comma then delete character - 1 of tHNN
      repeat for each item sNodeNum in tHNN
         put the ID_of_node_[sNodeNum] of me into sNodeID
         put the nodeLine_of_node_ID_[sNodeID] of me & comma after sLineNum
      end repeat
      delete character - 1 of sLineNum
      if sLineNum is not empty then set the hilitedLines of me to sLineNum
   end if
end hilitedNodeName

# setProp hilitedNodeNames theHilitedNodeNames
   if theHilitedNodeNames is not empty
   then
      replace cr with comma in theHilitedNodeNames
      repeat for each item sItem in theHilitedNodeNames
         put sItem into sItemTemp
         repeat until character 1 of sItemTemp is not space
            delete character 1 of sItemTemp
         end repeat
         repeat until character - 1 of sItemTemp is not space
            delete character - 1 of sItemTemp
         end repeat
         put sItemTemp & comma after tHNN
      end repeat
      if character - 1 of tHNN is comma then delete character - 1 of tHNN
      repeat for each item sNodeNum in tHNN
         put the ID_of_node_[sNodeNum] of me into sNodeID
         put the nodeLine_of_node_ID_[sNodeID] of me & comma after sLineNum
      end repeat
      delete character - 1 of sLineNum
      if sLineNum is not empty then set the hilitedLines of me to sLineNum
   end if
end hilitedNodeNames

setProp hilited_of_node_ID_[sNodeID] newValue
   if the long ID of me is in the long ID of the target
   then
   lock screen
   try
   put the millisec into ms ###
   -- put the hilitedLines of me into sHilitedLinesOfMe
   put the nodeLine_of_node_ID_[sNodeID] of me into sLineNum
   if newValue is true
   then
      put sHilitedLinesOfMe & comma & sLineNum into sHilitedLines
      if character 1 of sHilitedLines is comma then delete character 1 of sHilitedLines
      -- set the hilitedLines of me to sHilitedLines
   end if
   if newValue is false
   then
      repeat for each item sHilitedLine in sHilitedLinesOfMe
         if sHilitedLine is sLineNum then next repeat
         put sHilitedLine & comma after sHilitedLines
      end repeat
      if character - 1 of sHilitedLines is comma then delete character - 1 of sHilitedLines
   end if 
   unlock screen
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  end if
   pass hilited_of_node_ID_
end hilited_of_node_ID_

setProp ID_of_node_[nodeNumber] newValue
   try
      # Trap setting ID by user as it is read only.
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
   if tSetByEngine is true then pass ID_of_node_
end ID_of_node_

setProp ID_of_node_ID_
   try
      # Trap setting ID as it is read only.
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end ID_of_node_ID_

setProp IDpath_of_node_
   try
      # Trap setting IDpath as it is read only.
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end IDpath_of_node_

setProp IDpath_of_node_ID_
   try
      # Trap setting IDpath as it is read only.
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end IDpath_of_node_ID_

setProp indent_of_node_[nodeNumber] newValue
   try
   if nodeNumber is an integer
   then
      set the indent_of_node_ID_[line nodeNumber of the nodeIDs of me] of me to newValue
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the indent_of_node_ID_[sNodeID] of me to newValue
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end indent_of_node_

# setProp firstIconExpanded newIconID
   if tHandlerBusy is false then
      set the customPropertySet of me to "firstIconExpanded_of_node_ID_"
      put the customProperties of me into sFirstIconExpandedA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the expanded_of_node_ID_[sNodeID] of me is true then put newIconID into sFirstIconExpandedA[sNodeID]
      end repeat
      set the customPropertySet of me to "firstIconExpanded_of_node_ID_"
      set the customProperties of me to sFirstIconExpandedA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass firstIconExpanded
end firstIconExpanded

setProp rootNodeIDs newValue
   try
      if tHandlerBusy is not true
      then
         put newValue into sRootNodeIDs
      end if
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
  pass rootNodeIDs
end rootNodeIDs

setProp secondIconCollapsed_of_node_[nodeNumber] newValue
   try
   if tHandlerBusy is false then
      if nodeNumber is an integer
      then
         set the secondIconCollapsed_of_node_[line nodeNumber of the nodeIDs of me] of me to newValue
      else
         put the ID_of_node_[nodeNumber] of me into sNodeID
         set the secondIconCollapsed_of_node_[sNodeID] of me to newValue
      end if
   end if
   catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end secondIconCollapsed_of_node_

# setProp thirdIcon_of_node_[nodeNumber] newValue
   if tHandlerBusy is false then
      if nodeNumber is an integer
      then
         set the thirdIcon_of_node_ID_[line nodeNumber of the nodeIDs of me] of me to newValue
      else
         put the ID_of_node_[nodeNumber] of me into sNodeID
         set the thirdIcon_of_node_ID_[sNodeID] of me to newValue
      end if
   end if
end thirdIcon_of_node_

# setProp secondIconCollapsed newIconID
   if tHandlerBusy is false then
      set the customPropertySet of me to "secondIconCollapsed_of_node_ID_"
      put the customProperties of me into sSecondCollapsedIconA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the expanded_of_node_ID_[sNodeID] of me is false then put newIconID into sSecondCollapsedIconA[sNodeID]
      end repeat
      set the customPropertySet of me to "secondIconCollapsed_of_node_ID_"
      set the customProperties of me to sSecondCollapsedIconA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass secondIconCollapsed
end secondIconCollapsed

# setProp secondIconExpanded newIconID
   if tHandlerBusy is false then
      set the customPropertySet of me to "secondIconExpanded_of_node_ID_"
      put the customProperties of me into sSecondIconA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the expanded_of_node_ID_[sNodeID] of me is true then put newIconID into sSecondIconA[sNodeID]
      end repeat
      set the customPropertySet of me to "secondIconExpanded_of_node_ID_"
      set the customProperties of me to sSecondIconA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass secondIconExpanded
end secondIconExpanded

# setProp folderIcon newIconID
   if tHandlerBusy is false then
      set the customPropertySet of me to "secondIcon_of_node_ID_"
      put the customProperties of me into sSecondIconA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the expanded_of_node_ID_[sNodeID] of me is true then put newIconID into sSecondIconA[sNodeID]
      end repeat
      set the customPropertySet of me to "secondIcon_of_node_ID_"
      set the customProperties of me to sSecondIconA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass folderIcon
end folderIcon

# setProp fileIcon newIconID
   if tHandlerBusy is false then
      set the customPropertySet of me to "secondIconCollapsed_of_node_ID_"
      put the customProperties of me into sSecondIconCollapsedA
      set the customPropertySet of me to "secondIconExpanded_of_node_ID_"
      put the customProperties of me into sSecondIconExpandedA
      set the customPropertySet of me to empty
      repeat for each line sNodeID in the nodeIDs of me
         if the nodeType_of_node_ID_[sNodeID] of me is "file" and sSecondIconCollapsedA[sNodeID] is newIconID and sSecondIconExpandedA[sNodeID] is newIconID
         then
            put newIconID into sSecondIconCollapsedA[sNodeID]
            put newIconID into sSecondIconExpandedA[sNodeID]
         end if
      end repeat
      set the customPropertySet of me to "secondIconCollapsed_of_node_ID_"
      set the customProperties of me to sSecondIconCollapsedA
      set the customPropertySet of me to "secondIconExpanded_of_node_ID_"
      set the customProperties of me to sSecondIconExpandedA
      set the customPropertySet of me to empty
      dispatch "renderTRee"
   end if
   pass fileIcon
end fileIcon

setProp lastNodeID
   try
      if tHandlerBusy is true then pass lastNodeID
      catch tError
     put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
     put item 2 of tError into tLine
     put item 4 of tError into tChunk
     delete word - 1 of tChunk
     answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
  end try
end lastNodeID

setProp name_of_node_ID_[nodeID] newName
   put true into tSetIDHandler
   if tHandlerBusy is not true
   then
      set the ID_of_node_[newName] of me to nodeID
   end if
   put false into tSetIDHandler
   put the name_of_node_ID_[nodeID] of me into sName
   set the defaultFolder to $HOMEDRIVE & slash # Needed to free the nodes from being locked by process.
   dispatch "nodeNameChanged" with sName  , newName , nodeID , the ID of me
   pass name_of_node_ID_
end name_of_node_ID_

/*
on nodeNameChangedInternal oldName newName nodeID treeID
   beep ###
   if the autoSync of me is true and the treeType of me is "filesystem"
   then
      answer "Do you really want to rename this File/Folder on your Hard Drive?" with "Yes" and "No"
      if it is "Yes"
      then
         -- beep ###
      put the sourcePath_of_node_ID_[nodeID] of me into sOldPath
      set the itemDelimiter to "/"
      put sOldPath into sNewPath
      put newName into item - 1 of sNewPath
      put sOldPath && sNewPath
      rename folder sOldPath to sNewPath
      end if
   end if
end nodeNameChangedInternal
*/

setProp name_of_node_[nodeNumber] newValue
   if nodeNumber is an integer
   then
      put line nodeNumber of the nodeIDs of me into sNodeID
      set the name_of_node_ID_[sNodeID] of me to newValue
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the name_of_node_ID_[sNodeID] of me to newValue
   end if
   send "deleteCustomPropertySet name_of_node_" to me in 1 millisec
   pass name_of_node_
end name_of_node_

setProp nodeData newNodeData
   
   put newNodeData into sNodeDataA
   
   /*
   lock messages
   put the millisec into ms ###
   repeat for each key tNodeID in newNodeData
      put cr & tNodeID after tNodeIDs
      put newNodeData[tNodeID] into tPropertiesA
      repeat for each key tProperty in tPropertiesA
         put tProperty & "_of_node_ID_" into tPropset
         put "[" & tNodeID & "]" after tPropset
         set the tPropset of me to tPropertiesA[tProperty]
      end repeat
   end repeat
   delete character 1 of tNodeIDs
   sort tNodeIDs numeric
   set the nodeIDs of me to tNodeIDs
   -- put "NodeData set in" && the millisec - ms && "ms" ###
   unlock messages
   -- pass nodeData
   */
   
end nodeData

setProp nodeID_of_line_
   # Trap as it is read only.
end nodeID_of_line_

setProp nodeIDs newNodeIDs
   put the millisec into ms ###
   unlock messages
   if tHandlerBusy is not true
   then
      put newNodeIDs into newNodeIDsTEMP
      sort newNodeIDsTEMP numeric descending
      put true into tHandlerBusy
      set the lastNodeID of me to line 1 of newNodeIDsTEMP
   end if
   put true into tHandlerBusy
   put the millisec into ms ###
   if comma is among the characters of newNodeIDs
   then
      replace comma with cr in newNodeIDs
      set the nodeIDs of me to newNodeIDs
   else
      if the lastNodeID of me is empty then set the lastNodeID of me to the number of lines of newNodeIDs
      if the lastNodeID of me is zero then set the lastNodeID of me to empty
         set the customPropertySet of me to "depth_of_node_ID_"
         put the customProperties of me into tDepthA
         set the customPropertySet of me to empty
         put empty into tRootNodeIDsTemp
         repeat for each line tNodeID in newNodeIDs
            add 1 to tNumber
            put tNumber into tNumberA[tNodeID]
            -- put tDepthA[tNodeID] & cr after tDepths
            if tDepthA[tNodeID] = 0 or tDepthA[tNodeID] is empty
            then
               put cr & tNodeID after tRootNodeIDsTemp
            end if
            # Set IDpath and parent
            set the itemDelimiter to slash
            put tNodeID into item tDepthA[tNodeID] + 1 of tIDpath
            put tNodeID into line tDepthA[tNodeID] + 1 of tIDpathLines #########
            delete item tDepthA[tNodeID] + 2 to - 1 of tIDpath
            delete line tDepthA[tNodeID] + 2 to - 1 of tIDpathLines ########
            put tIDpath into tIDpathA[tNodeID]
            put tIDpathLines into tIDpathLinesA[tNodeID] #######
            if line - 2 of tIDpathLines is not empty
            then
               if tChildrenA[line - 2 of tIDpathLines] is empty
               then
                  put tNodeID into tChildrenA[line - 2 of tIDpathLines]
               else
                  put cr & tNodeID after tChildrenA[line - 2 of tIDpathLines]
               end if
            end if
            repeat for each line tAncestorID in tIDpathLines
               if tFamilyA[tAncestorID] is empty
               then
                  put tNodeID into tFamilyA[tAncestorID]
               else
                  put cr & tNodeID after tFamilyA[tAncestorID]
               end if
            end repeat
            -- put "tFamilyA[tAncestorID]" && tFamilyA[tAncestorID] ###
            put line - 2 of tIDpathLines into tParentA[tNodeID]
            set the itemDelimiter to comma
            if tPreviousNodeID is an integer
            then
               if tDepthA[tNodeID] <= tDepthA[tPreviousNodeID]
               then
                  put "true" into tLeafA[tPreviousNodeID]
               else
                  put "false" into tLeafA[tPreviousNodeID]
               end if
            end if
            put tNodeID into tPreviousNodeID
         end repeat
         delete character 1 of tRootNodeIDsTemp
         -- put "tRootNodeIDsTemp" && tRootNodeIDsTemp ###
         -- put "tDepths" && tDepths
         set the rootNodeIDs of me to tRootNodeIDsTemp
         put true into tLeafA[tNodeID]
      set the customPropertySet of me to "number_of_node_ID_"
      set the customProperties of me to tNumberA
      set the customPropertySet of me to "IDpath_of_node_ID_"
      set the customProperties of me to tIDpathA
      set the customPropertySet of me to "IDpathLines_of_node_ID_"
      set the customProperties of me to tIDpathLinesA
      set the customPropertySet of me to "children_of_node_ID_"
      set the customProperties of me to tChildrenA
      set the customPropertySet of me to "family_of_node_ID_"
      set the customProperties of me to tFamilyA
      set the customPropertySet of me to "parent_of_node_ID_"
      set the customProperties of me to tParentA
      set the customPropertySet of me to "leaf_of_node_ID_"
      set the customProperties of me to tLeafA
      set the customPropertySet of me to empty
      -- if there is a field "BenchMarkInfo" then put "nodeIDs set in" && the millisec - ms &&"ms" & cr into field "BenchMarkInfo" ###
      -- put "lastNodeID" && the lastNodeID of me
      -- put the millisec - ms ###
      pass nodeIDs
   end if
   -- dispatch "calibrateScrollbar" to scrollbar ID the scrollbarID of me with the visibleNodeIDs of me
end nodeIDs

setProp nodeLine_of_node_
   # Trap set path as it is read only.
end nodeLine_of_node_

setProp nodeLine_of_node_ID_
   # Trap set path as it is read only.
end nodeLine_of_node_ID_

setProp nodeType_of_node_[nodeNumber] newValue
   if nodeNumber is an integer
   then
      put line nodeNumber of the nodeIDs of me into sNodeID
      set the nodeType_of_node_ID_[sNodeID] of me to newValue
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the nodeType_of_node_ID_[sNodeID] of me to newValue
   end if
   send "deleteCustomPropertySet nodeType_of_node_" to me in 1 millisec
   pass nodeType_of_node_
end nodeType_of_node_

setProp number_of_node_[nodeNumber] newValue
   if nodeNumber is an integer
   then
      put line nodeNumber of the nodeIDs of me into sNodeID
      set the number_of_node_ID_[sNodeID] of me to newValue
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the number_of_node_ID_[sNodeID] of me to newValue
   end if
end number_of_node_

setProp number_of_node_ID_[nodeID] newNumber
   put true into sSetNumberHandlerBusy
   if tHandlerBusy is not true and tSetParentHandler is not true and nodeID is not empty then
      put the nodeIDs of me into sNodeIDs
      put  the number of lines of sNodeIDs into sNoL
      put the number_of_node_ID_[nodeID] of me into oldNumber
      if oldNumber is empty and nodeID is an integer
      then
         repeat for each line tNodeID in sNodeIDs
            add 1 to tNumber
            if nodeID is tNodeID then exit repeat
         end repeat
         put tNodeID into oldNumber
      end if
      if oldNumber is empty
      then
         set the number_of_node_ID_[nodeID] of me to sNoL
         put sNoL into oldNumber
      end if
      if oldNumber = newNumber
      then
         put false into tHandlerBusy
         put false into sSetNumberHandlerBusy
         pass number_of_node_ID_
      end if
      if newNumber >sNoL then put sNoL into newNumber
      if newNumber < 1 then put 1 into newNumber
      put the family_of_node_ID_[nodeID] of me into sFamily
      if the ID_of_node_[newNumber] of me is among the lines of sFamily or the nodeType_of_node_ID_[nodeID] of me is "file"
      then # Drop not allowed
         put false into tHandlerBusy
         put false into sSetNumberHandlerBusy
         pass number_of_node_ID_
      end if
      put oldNumber into sFirstLN
      put the number of lines of sFamily + oldNumber into sLastLN
      switch
         case newNumber > oldNumber
            put the nodeIDs of me into sTempnodeIDs
            put cr & sFamily after line newNumber of sTempnodeIDs
            delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
            set the nodeIDs of me to sTempnodeIDs
            break
         case (newNumber < oldNumber)
            put the nodeIDs of me into sTempnodeIDs
            delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
            switch
               case newNumber is 1
                  put sFamily & cr before line 1 of sTempnodeIDs
                  break
               case newNumber is not 1
                  put cr & sFamily after line newNumber - 1 of sTempnodeIDs
                  break
            end switch
            set the nodeIDs of me to sTempnodeIDs
            break
      end switch
      
      /*
         # Find parent.
      set the customPropertySet of me to "depth_of_node_ID_"
      put the customProperties of me into sDepthA
      set the customPropertySet of me to "name_of_node_ID_"
      put the customProperties of me into sNameA
      set the customPropertySet of me to empty
      repeat for each line sLine in the NodeIDs of me
         add 1 to sNumber
         if sDepthA[sLine] is empty then put 0 into sDepthA[sLine]
         put sNumber into sNumberA[sLine]
         put sLine into sIDA[sNameA[sLine]]
         put sLine into sIDA[sNumberA[sLine]]
         # Set IDpath and parent
         set the itemDelimiter to slash
         put sLine into item sDepthA[sLine] + 1 of sIDpath
         delete item sDepthA[sLine] + 2 to - 1 of sIDpath
         put sIDpath into sIDpathA[sLine]
         put item - 2 of sIDpath into sParentA[sLine]
         set the itemDelimiter to comma
         if sParentA[sLine] is empty then put 0 into sParentA[sLine]
      end repeat
      */
      
      
      -- set the customPropertySet of me to "ID_of_Node_"
      -- set the customProperties of me to sIDA
      -- set the customPropertySet of me to "parent_of_Node_ID_"
      -- set the customProperties of me to sParentA
      -- set the customPropertySet of me to "depth_of_Node_ID_"
      -- set the customProperties of me to sDepthA
      set the customPropertySet of me to empty 
   end if
   put false into tHandlerBusy
   put false into sSetNumberHandlerBusy
   pass number_of_node_ID_
end number_of_node_ID_

setProp parent_of_node_[nodeNumber] newParent
   if tHandlerBusy is false then
      if nodeNumber is an integer
      then
         put line nodeNumber of the nodeIDs of me into nodeID
         set the parent_of_node_ID_[nodeID] of me to newParent
      else
         put the ID_of_node_[nodeNumber] of me into nodeID
         set the parent_of_node_ID_[nodeID] of me to newParent
      end if
   end if
end parent_of_node_

setProp parent_of_node_ID_[nodeID] newParent
   put true into tSetParentHandler
   if tHandlerBusy is not true
   then
      put the family_of_node_ID_[nodeID] of me into sFamily
      if newParent is not among the lines of sFamily # Check so parent is not set to member of family.
      then
         put round(the depth_of_node_ID_[newParent] of me) + 1 into newDepth
         set the customPropertySet of me to "depth_of_node_ID_"
         put the customProperties of me into sDepthA
         set the customPropertySet of me to "parent_of_node_ID_"
         put the customProperties of me into sParentA
         set the customPropertySet of me to "number_of_node_ID_"
         put the customProperties of me into sNumberA
         set the customPropertySet of me to empty
         put newDepth - sDepthA[nodeID] into sDepthDiff
         put the family_of_node_ID_[nodeID] of me into sFamily
         repeat for each line sNodeID in sFamily # Set new depths for ll nodes in the family that is getting a new parent.
            put sDepthDiff + sDepthA[sNodeID] into sDepthA[sNodeID]
         end repeat
         set the customPropertySet of me to "depth_of_node_ID_"
         set the customProperties of me to sDepthA
         set the customPropertySet of me to empty
         put the nodeIDs of me into sNodeIDs
         put  the number of lines of sNodeIDs into sNoL
         put the number_of_node_ID_[newParent] of me into newNumber
         put the number_of_node_ID_[nodeID] of me into oldNumber
         if oldNumber = newNumber then pass parent_of_node_ID_
         if newNumber >sNoL then put sNoL into newNumber
         if newNumber < 1 then put 1 into newNumber
         put oldNumber into sFirstLN
         put the number of lines of sFamily + oldNumber into sLastLN
         switch
            case newNumber > oldNumber # New parent is above the node getting a new parent.
               put the nodeIDs of me into sTempnodeIDs
               put cr & sFamily after line newNumber of sTempnodeIDs
               delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
               set the nodeIDs of me to sTempnodeIDs
               break
            case newNumber < oldNumber # New parent is below the node getting a new parent.
               put the nodeIDs of me into sTempnodeIDs
               delete line sFirstLN to sLastLN - 1 of sTempnodeIDs
               if newNumber is 0 then put sFamily & cr before line 1 of sTempnodeIDs
               if newNumber is not 0 then put cr & sFamily after line newNumber of sTempnodeIDs
               set the nodeIDs of me to sTempnodeIDs
               break
         end switch
      end if
   end if
   put false into tSetParentHandler
   pass parent_of_node_ID_
end parent_of_node_ID_

# setProp properties_of_node_ID_[tNodeID] tNewPropertiesA
   repeat for each key tPropertyName in tNewPropertiesA
      set the customPropertySet of me to tPropertyName
      set the customProperties of me to tNewPropertiesA[tNodeID]
   end repeat
   set the customPropertySet of me to empty
end properties_of_node_ID_

setProp sourcePath_of_node_ID_[theNodeID] newSourcePath
   if tSetFromScanNode is not true
   then
      put false into tSetFromScanNode
      switch
         case tSetFromMoveSomeNodes is true
            put tClickedNodeFamily into theFamily
            put false into tSetFromMoveSomeNodes
            break
         default
            put the family_of_node_ID_[theNodeID] of me into theFamily
      end switch
      set the defaultFolder to $HOMEDRIVE & slash # Needed to free the nodes from being locked by process.
      dispatch "sourcePathChanged" with the sourcePath_of_node_ID_[theNodeID] of me  , newSourcePath , theNodeID , the ID of me
      set the customPropertySet of me to sourcePath_of_node_ID_
      put the customProperties of me into sSourcePathA
      set the itemDelimiter to slash
      put the number of items of sSourcePathA[theNodeID] into sOldDepth
      repeat for each line sFamilyNodeID in theFamily
         put newSourcePath & slash & item sOldDepth + 1 to - 1 of sSourcePathA[sFamilyNodeID] into sSourcePathA[sFamilyNodeID]
      end repeat
      set the customProperties of me to sSourcePathA
      set the customPropertySet of me to empty
   end if
   pass sourcePath_of_node_ID_
end sourcePath_of_node_ID_

# setProp useCache newValue
   repeat for each line sNodeID in the nodeIDs of me
      put false into sCachedA[sNodeID]
   end repeat
   pass useCache
end useCache

# setProp useCache newValue
   repeat for each line sNodeID in the nodeIDs of me
      put false into sCachedA[sNodeID]
   end repeat
   pass useCache
end useCache

setProp visibleNodeIDs tNewIDs
   if tHandlerBusy is true
   then
      repeat for each line tNodeID in tNewIDs
         add 1 to tNum
         put tNum into tNodeLineA[tNodeID]
      end repeat
      set the customPropertySet of me to "nodeLine_of_node_ID_"
      set the customProperties of me to tNodeLineA
      set the customPropertySet of me to empty
      dispatch "finishedCalculateTree" with the ID of me
      send "calibrateScrollbar" to scrollbar "VerticalScrollbar" of me in 1 millisec
      pass visibleNodeIDs
   end if
end visibleNodeIDs

getProp properties_of_node_ID_[theNodeID]
   if theNodeID is not empty
   then
   -- put "ID_of_node_ID_,label_of_node_ID_,cached_of_node_ID_,children_of_node_ID_,family_of_node_ID_,firstIconExpanded_of_node_ID_,firstIconCollapsed_of_node_ID_,name_of_node_ID_,indent_of_node_ID_,depth_of_node_ID_,IDpath_of_node_ID_,ID_of_node_ID_,nodeType_of_node_ID_,expanded_of_node_ID_,number_of_node_ID_,parent_of_node_ID_,path_of_node_ID_,sourcePath_of_node_ID_,nodeID_of_line_,nodeLine_of_node_ID_,secondIconCollapsed_of_node_ID_,secondIconExpanded_of_node_ID_,thirdIconCollapsed_of_node_ID_,thirdIconExpanded_of_node_ID_,textFont_of_node_ID_,textColor_of_node_ID_,textSize_of_node_ID_,textStyle_of_node_ID_,useFirstIcon_of_node_ID_,useSecondIcon_of_node_ID_,useThirdIcon_of_node_ID_,visible_of_node_ID_,textShift_of_node_ID_" into tPropertyNames # collapsedChar_of_node_ID_,expandedChar_of_node_ID_,htmlText_of_node_ID_
      repeat for each line sCPS in the NodeProperties of stack "rTreeEngine" -- tPropertyNames
         if the keys of sCPS is empty then next repeat
      set the itemDelimiter to "_"
      put item 1 of sCPS into sPropertyName
      set the itemDelimiter to comma
      put theNodeID into sNodeID
      if sCPS is "nodeID_of_line_" then put the nodeLine_of_node_ID_[theNodeID] of me into sNodeID # Gets line number instead of node ID.
      put sCPS & "[" & sNodeID & "]" into sP
      put the sP of me into sPropertyA[sPropertyName]
   end repeat
   set the properties_of_node_ID_[sNodeID] of me to sPropertyA
   send "deleteCustomPropertySet properties_of_node_ID_" to me in 1 millisec
   end if
   pass properties_of_node_ID_
end properties_of_node_ID_

getProp customProperties_of_node_ID_[theNodeID]
   if theNodeID is not empty
   then
   -- put "ID_of_node_ID_,label_of_node_ID_,cached_of_node_ID_,children_of_node_ID_,family_of_node_ID_,firstIconExpanded_of_node_ID_,firstIconCollapsed_of_node_ID_,name_of_node_ID_,indent_of_node_ID_,depth_of_node_ID_,IDpath_of_node_ID_,ID_of_node_ID_,nodeType_of_node_ID_,expanded_of_node_ID_,number_of_node_ID_,parent_of_node_ID_,path_of_node_ID_,sourcePath_of_node_ID_,nodeID_of_line_,nodeLine_of_node_ID_,secondIconCollapsed_of_node_ID_,secondIconExpanded_of_node_ID_,thirdIconCollapsed_of_node_ID_,thirdIconExpanded_of_node_ID_,textFont_of_node_ID_,textColor_of_node_ID_,textSize_of_node_ID_,textStyle_of_node_ID_,useFirstIcon_of_node_ID_,useSecondIcon_of_node_ID_,useThirdIcon_of_node_ID_,htmlText_of_node_ID_,visible_of_node_ID_,textShift_of_node_ID_" into tPropertyNames # collapsedChar_of_node_ID_,expandedChar_of_node_ID_
   repeat for each line sCPS in the customPropertySets of me
      if sCPS is "cREVGeneral" then next repeat
      if sCPS is among the lines of the NodeProperties of stack "rTreeEngine" then next repeat
      set the itemDelimiter to "_"
      put item 1 of sCPS into sPropertyName
      set the itemDelimiter to comma
      put sCPS & "[" & theNodeID & "]" into sP
      put the sP of me into sPropertyA[sPropertyName]
   end repeat
   set the customProperties_of_node_ID_[theNodeID] of me to sPropertyA
   send "deleteCustomPropertySet customProperties_of_node_ID_" to me in 1 millisec
   end if
   pass customProperties_of_node_ID_
end customProperties_of_node_ID_

getProp nodeAbove
   set the nodeAbove of me to tAboveNodeID
   send "deleteCustomProperty nodeAbove" to me in 1 millisec
   pass nodeAbove
end nodeAbove

getProp nodeBelow
   set the nodeBelow of me to tBelowNodeID
   send "deleteCustomProperty nodeBelow" to me in 1 millisec
   pass nodeBelow
end nodeBelow

getProp nodeData
   -- put the millisec into ms ###
   set the itemDelimiter to "_"
   repeat for each line tCustomPropertySet in the customPropertySets of me
      set the customPropertySet of me to tCustomPropertySet
      put the customProperties of me into tCP
      if the keys of tCP is empty then next repeat
      repeat for each key tNodeID in tCP
         put tCP[tNodeID] into nodeDataA[tNodeID][item 1 of tCustomPropertySet]
      end repeat
   end repeat
   set the itemDelimiter to comma
   set the customPropertySet of me to empty
   set the nodeData of me to nodeDataA
   send "deleteCustomProperty nodeData" to me in 1 millisec
   -- put "NodeData get in" && the millisec - ms && "ms" ###
   pass nodeData
end nodeData

# getProp nodeHeight_of_node_ID_[tNodeID]
   put the nodeHeight_of_node_ID_[tNodeID] of me into tNodeHeight
   if tNodeHeight is empty
   then
      put true into tNotSet
      put the nodeHeight of me into tNodeHeight
   end if
   -- if tNodeHeight is empty then put "21" into tNodeHeight
   if tNotSet
   then
      set the nodeHeight_of_node_ID_[tNodeID] of me to tNodeHeight
      send "deleteCustomPropertySet nodeHeight_of_node_ID_" to me in 1 millisec
   end if
   pass nodeHeight_of_node_ID_
end nodeHeight_of_node_ID_

getProp betweenNodes
   set the betweenNodes of me to tBetweenNodes
   send "deleteCustomProperty betweenNodes" to me in 1 millisec
   pass betweenNodes
end betweenNodes

getProp cached_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the cached_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sCached
      set the cached_of_node_[nodeNumber] of me to sCached
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the cached_of_node_[nodeNumber] of me to the cached_of_node_ID_[sNodeID] of me
   end if
   send "deleteCustomPropertySet cached_of_node_" to me in 1 millisec
   pass cached_of_node_
end cached_of_node_

getProp clickNode
   -- set the clickNode of me to line sClickedLineNum of the visibleNodeIDs of me
   pass clickNode
end clickNode

getProp children_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the children_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sChildren
      set the children_of_node_[nodeNumber] of me to sChildren
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the children_of_node_[nodeNumber] of me to the children_of_node_ID_[sNodeID] of me
   end if
   send "deleteCustomPropertySet children_of_node_" to me in 1 millisec
   pass children_of_node_
end children_of_node_

getProp children_of_node_ID_[nodeID]
   put the children_of_node_ID_[nodeID] of me into tChildren
   if character - 1 of tChildren is cr
   then
      delete character - 1 of tChildren
      set the children_of_node_ID_[nodeID] of me to tChildren
   else
      pass children_of_node_ID_
   end if
end children_of_node_ID_

getProp depth_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put round(the depth_of_node_ID_[line nodeNumber of the nodeIDs of me] of me) into sDepth
      set the depth_of_node_[nodeNumber] of me to sDepth
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the depth_of_node_[nodeNumber] of me to round(the depth_of_node_ID_[sNodeID] of me)
   end if
   send "deleteCustomPropertySet depth_of_node_" to me in 1 millisec
   pass depth_of_node_
end depth_of_node_

getProp expanded_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the expanded_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sExpanded
      set the expanded_of_node_[nodeNumber] of me to sExpanded
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the expanded_of_node_[nodeNumber] of me to the expanded_of_node_ID_[sNodeID] of me
   end if
   send "deleteCustomPropertySet expanded_of_node_" to me in 1 millisec
   pass expanded_of_node_
end expanded_of_node_

getProp firstIconCollapsed_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the firstIconCollapsed_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sFirstIconCollapsed
      set the firstIconCollapsed_of_node_[nodeNumber] of me to sFirstIconCollapsed
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the firstIconCollapsed_of_node_[nodeNumber] of me to the firstIconCollapsed_of_node_[sNodeID] of me
   end if
   send "deleteCustomPropertySet firstIconCollapsed_of_node_" to me in 1 millisec
   pass firstIconCollapsed_of_node_
end firstIconCollapsed_of_node_

# getProp hilitedNodes
   set the customPropertySet of me to "nodeID_of_line_"
   put the customProperties of me into sNodeIDofLineA
   set the customPropertySet of me to empty
   repeat for each item sLineNum in the hilitedLines of me
      put sNodeIDofLineA[sLineNum] & comma after sHilitedNode
   end repeat
   delete character - 1 of sHilitedNode
   set the hilitedNode of me to sHilitedNode
   send "deleteCustomProperty hilitedNodes" to me in 1 millisec
   pass hilitedNodes
end hilitedNodes

# getProp hilitedNode
   set the customPropertySet of me to "nodeID_of_line_"
   put the customProperties of me into sNodeIDofLineA
   set the customPropertySet of me to empty
   repeat for each item sLineNum in the hilitedLines of me
      put sNodeIDofLineA[sLineNum] & comma after sHilitedNode
   end repeat
   delete character - 1 of sHilitedNode
   set the hilitedNode of me to sHilitedNode
   send "deleteCustomProperty hilitedNode" to me in 1 millisec
   pass hilitedNode
end hilitedNode

getProp hilitedNodeID
   set the hilitedNodeID of me to the hilitedNodeIDs of me
   send "deleteCustomProperty hilitedNodeID" to me in 1 millisec
   pass hilitedNodeID
end hilitedNodeID

getProp hilitedNodeIDs newHilitedNodeIDs
   if comma is among the characters of newHilitedNodeIDs
   then
      replace comma with cr in newHilitedNodeIDs
      set the hilitedNodeIDs of me to newHilitedNodeIDs
   else
      pass hilitedNodeIDs
   end if
end hilitedNodeIDs

getProp ID_of_the_last_node
   set the ID_of_the_last_node of me to the lastNodeID of me
   send "deleteCustomProperty ID_of_the_last_node" to me in 1 millisec
   pass ID_of_the_last_node
end ID_of_the_last_node

getProp ID_of_last_node
   set the ID_of_last_node of me to the lastNodeID of me
   send "deleteCustomProperty ID_of_last_node" to me in 1 millisec
   pass ID_of_last_node
end ID_of_last_node

getProp ID_of_node_[nodeNumber]
   put true into tSetByEngine
   if nodeNumber is an integer
   then
      put line nodeNumber of the nodeIDs of me into sID
      set the ID_of_node_[nodeNumber] of me to sID
   else
      set the customPropertySet of me to "name_of_node_ID_"
      put the customProperties of me into sNameA
      set the customPropertySet of me to empty
      put empty into sNID
      repeat for each line sNodeID in the nodeIDs of me
         if sNameA[sNodeID] is empty then put "Node id" && sNodeID into sNameA[sNodeID]
         if sNameA[sNodeID] is nodeNumber
         then
            put sNodeID into sNID
            exit repeat
         end if
      end repeat
      set the ID_of_node_[nodeNumber] of me to sNID
   end if
   send "deleteCustomPropertySet ID_of_node_" to me in 1 millisec
   put false into tSetByEngine
   pass ID_of_node_
end ID_of_node_

getProp ID_of_node_ID_[nodeID]
   put true into tSetByEngine
   if nodeID is an integer
   then
      set the ID_of_node_ID_[nodeID] of me to nodeID
   end if
   send "deleteCustomPropertySet ID_of_node_ID_" to me in 1 millisec
   put false into tSetByEngine
   pass ID_of_node_ID_
end ID_of_node_ID_

getProp IDpath_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put line nodeNumber of the nodeIDs of me into sID
      set the IDpath_of_node_[nodeNumber] of me to the IDpath_of_node_ID_[sID] of me
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the IDpath_of_node_[nodeNumber] of me to the IDpath_of_node_ID_[sNodeID] of me
   end if
   send "deleteCustomPropertySet IDpath_of_node_" to me in 1 millisec
   pass IDpath_of_node_
end IDpath_of_node_

local sTarget

getProp mouseNode
   -- put the target & cr after sTarget
   -- put sTarget
   -- if the target is me then exit mouseNode
   -- set the mouseNode of me to line word 2 of the mouseLine + the thumbPosition of scrollbar ID the scrollbarID of me - 1 of the visibleNodeIDs of me
   -- set the mouseNode of me to the nodeID of the target
   -- put the mouseNode of me  ###
   -- send "deleteCustomProperty mouseNode" to me in 1 millisec
   pass mouseNode
end mouseNode

# getProp family_of_node_ID_[nodeID]
   put the number_of_node_ID_[nodeID] of me into nodeNumber
   put line nodeNumber to - 1 of the nodeIDs of me into sNodeIDs
   put nodeNumber - 1 into x
   put the depth_of_node_ID_[nodeID] of me into sOldDepth
   repeat for each line tLine in sNodeIDs
      add 1 to x
      if x = nodeNumber or the depth_of_node_ID_[tLine] of me > sOldDepth then put tLine & cr after sFamily else exit repeat
   end repeat
   delete last character of sFamily
   set the family_of_node_ID_[nodeID] of me to sFamily
   send "deleteCustomPropertySet family_of_node_ID_" to me in 1 millisec
   pass family_of_node_ID_
end family_of_node_ID_

getProp family_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put 0 into x
      put round(the depth_of_node_[nodeNumber] of me) into sOldDepth
      repeat for each line tLine in the nodeIDs of me
         add 1 to x
         if x < nodeNumber then next repeat
         if x = nodeNumber or round(the depth_of_node_ID_[tLine] of me) > sOldDepth then put tLine & cr after sFamily else exit repeat
      end repeat
      delete last character of sFamily
      set the family_of_node_[nodeNumber] of me to sFamily
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      put the number_of_node_ID_[sNodeID] of me into nNumber
      put 0 into x
      put round(the depth_of_node_[nNumber] of me) into sOldDepth
      repeat for each line tLine in the nodeIDs of me
         add 1 to x
         if x < nNumber then next repeat
         if x = nNumber or round(the depth_of_node_ID_[tLine] of me) > sOldDepth then put tLine & cr after sFamily else exit repeat
      end repeat
      delete last character of sFamily
      set the family_of_node_[nodeNumber] of me to sFamily
   end if
   send "deleteCustomPropertySet family_of_node_" to me in 1 millisec
   pass family_of_node_
end family_of_node_

# getProp nodeLine_of_node_ID_[tNodeID]
   set the wholeMatches to true
   put lineOffset(tNodeID , the visibleNodeIDs of me) into tLineNum
   if tLineNum is not 0
   then
      set the nodeLine_of_node_ID_[tNodeID] of me to tLineNum
   else
      set the nodeLine_of_node_ID_[tNodeID] of me to empty
   end if
   send "deleteCustomPropertySet nodeLine_of_node_ID_" to me in 1 millisec
   pass nodeLine_of_node_ID_
end nodeLine_of_node_ID_

getProp nodeLine_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the ID_of_node_[nodeNumber] of me into nodeID
      set the nodeLine_of_node_[nodeNumber] of me to the nodeLine_of_node_ID_[nodeID] of me
   else
      put the ID_of_node_[nodeNumber] of me into nodeID
      set the nodeLine_of_node_[nodeNumber] of me to the nodeLine_of_node_ID_[nodeID] of me
   end if
   send "deleteCustomPropertySet nodeLine_of_node_" to me in 1 millisec
   pass nodeLine_of_node_
end nodeLine_of_node_

# getProp number_of_node_ID_[nodeID]
   if nodeID is not empty
   then
      set the wholeMatches to true
      set the number_of_node_ID_[nodeID] of me to lineOffset(nodeID , the nodeIDs of me)
      send "deleteCustomPropertySet number_of_node_ID_" to me in 1 millisec
   end if
   pass  number_of_node_ID_
end number_of_node_ID_

getProp number_of_nodes
   set the number_of_nodes of me to the number of lines of the nodeIDs of me
   send "deleteCustomProperty number_of_nodes" to me in 1 millisec
   pass number_of_nodes
end number_of_nodes

getProp path_of_node_ID_[nodeID]
   if nodeID is not empty
   then
      set the itemDelimiter to slash
      repeat for each item sID in the IDpath_of_node_ID_[nodeID] of me
         put the name_of_node_ID_[sID] of me & "/" after sPath
      end repeat
      delete character - 1 of sPath
      set the path_of_node_ID_[nodeID] of me to sPath
      send "deleteCustomPropertySet path_of_node_ID_" to me in 1 millisec
   end if
   pass  path_of_node_ID_
end path_of_node_ID_

getProp path_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the path_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sPath
      set the path_of_node_[nodeNumber] of me to sPath
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the path_of_node_[nodeNumber] of me to the path_of_node_ID_[sNodeID] of me
   end if
   send "deleteCustomPropertySet path_of_node_" to me in 1 millisec
   pass  path_of_node_
end path_of_node_

getProp parent_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the parent_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sParent
      set the parent_of_node_[nodeNumber] of me to sParent
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the parent_of_node_[nodeNumber] of me to the parent_of_node_ID_[sNodeID] of me
   end if
   send "deleteCustomPropertySet parent_of_node_" to me in 1 millisec
   pass parent_of_node_
end parent_of_node_

getProp selectedNodes
   repeat for each item sLine in the hilitedLines of me
      put line sLine of the visibleNodeIDs of me & comma after sSN
   end repeat
   delete character - 1 of sSN
   set the selectedNodes of me to sSN
   send "deleteCustomProperty selectedNodes" to me in 1 millisec
   pass selectedNodes
end selectedNodes

getProp number_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      set the number_of_node_[nodeNumber] of me to nodeNumber
   else
      put the ID_of_node_[nodeNumber] of me into sID
      set the number_of_node_[nodeNumber] of me to the number_of_node_ID_[sID] of me
   end if
   send "deleteCustomPropertySet number_of_node_" to me in 1 millisec
   pass number_of_node_
end number_of_node_

getProp name_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the name_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sName
      set the name_of_node_[nodeNumber] of me to sName
   else
      put the ID_of_node_[nodeNumber] of me into sID
      set the name_of_node_ID_[sID] of me to nodeNumber
   end if
   send "deleteCustomPropertySet name_of_node_" to me in 1 millisec
   pass name_of_node_
end name_of_node_

getProp secondIconCollapsed_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the secondIconCollapsed_of_node_[line nodeNumber of the nodeIDs of me] of me into sSecondIconCollapsed
      set the secondIconCollapsed_of_node_[nodeNumber] of me to sSecondIconCollapsed
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the secondIconCollapsed_of_node_[nodeNumber] of me to the secondIconCollapsed_of_node_[sNodeID] of me
   end if
   send "deleteCustomPropertySet secondIconCollapsed_of_node_" to me in 1 millisec
   pass secondIconCollapsed_of_node_
end secondIconCollapsed_of_node_

# getProp thirdIcon_of_node_[nodeNumber]
   if nodeNumber is an integer
   then
      put the thirdIcon_of_node_ID_[line nodeNumber of the nodeIDs of me] of me into sThirdIcon
      set the thirdIcon_of_node_[nodeNumber] of me to sThirdIcon
   else
      put the ID_of_node_[nodeNumber] of me into sNodeID
      set the thirdIcon_of_node_[nodeNumber] of me to the thirdIcon_of_node_ID_[sNodeID] of me
   end if
   send "deleteCustomPropertySet thirdIcon_of_node_" to me in 1 millisec
   pass thirdIcon_of_node_
end thirdIcon_of_node_

on deleteCustomProperty theProperty
   put the customKeys of me into theProperties
   repeat for each line sProperty in theProperties
      add 1 to c
      if sProperty is theProperty then put c into sLine
   end repeat
   delete line sLine of theProperties
   set the customKeys of me to theProperties
end deleteCustomProperty

on deleteCustomPropertySet theSet
   put the customPropertySets of me into sSets
   repeat for each line sSet in sSets
      add 1 to c
      if sSet is theSet then put c into sLine
   end repeat
   delete line sLine of sSets
   set the customPropertySets of me to sSets
end deleteCustomPropertySet

on saveStackRequest
   if the long ID of me is in the long ID of the target
   then
   -- beep
   -- put "Hi there!" ###
   if "rTreeEngine" is not among the lines of the substacks of this stack
   then
      -- put "Hi there!" ###
      set the mainStack of stack "rTreeEngine" to this stack
   end if
   end if
   pass saveStackRequest
end saveStackRequest

on closeField
   if the long ID of me is in the long ID of the target
   then
      -- beep ###
   end if
   pass closeField
end closeField

on createRtree
   -- beep
   put "rTree created!"
end createRtree


## TODO LIST ##

# 2.0
# IDpath not working
# nodeControl ?
# nodeLine


## FUNCTIONS ##
#    mouseNode. WORKING.
#    selectedNodes. WORKING. Not introduced.
#    number_of_nodes. WORKING. Not introduced.

## MESSAGES ##
#    deleteNode theNodeID, theTreeID.
#    nodeDown theButton, theNodeID, theTreeID. WORKING. DOCUMENTED.
#    nodeUp theButton, theNodeID, theTreeID. WORKING. DOCUMENTED.
#    nodeDoubleDown theButton, theNodeID, theTreeID. WORKING. DOCUMENTED.
#    nodeDoubleUp theButton, theNodeID, theTreeID. WORKING. DOCUMENTED.
#    nodeEnter theNodeID, theTreeID. WORKING. DOCUMENTED.
#    nodeLeave theNodeID, theTreeID. WORKING. DOCUMENTED.
#    nodeNameChanged oldName, newName, nodeID, TreeID. WORKING.
#    nodeExpanded theNodeID, newValue, theTreeID. WORKING. DOCUMENTED.
#    nodeCollapsed theNodeID, newValue, theTreeID. WORKING. DOCUMENTED.
#    newNode theNodeID, theTreeID. WORKING.
#    dragNodeStart theNodeID, theTreeID. WORKING. DOCUMENTED.
#    dragNodeMove theNodeID, theTreeID. WORKING.  DOCUMENTED.
#    dragNodeDrop theNodeID, theTreeID. WORKING. DOCUMENTED.
#    dragNodeEnd theNodeID, theTreeID. WORKING. DOCUMENTED.
#    moveSomeNodes theNodeID, theTreeID. WORKING.
#    startScanNode theNodeID, theTreeID. WORKING.
#    finnishedScanNode theNodeID, theTreeID. WORKING.
#    startCalculateTree theTreeID. WORKING.
#    finishedCalculateTree theTreeID theNumberOfNodes. WORKING.
#    startRenderTree theTreeID. WORKING. DOCUMENTED.
#    finnishedRenderTree theTreeID. WORKING. DOCUMENTED.

## COMMANDS ##
#    delete_node_ID. WORKING. DOCUMENTED.
#    delete_node_. WORKING.
#    delete_treeData. WORKING. DOCUMENTED.
#    delete_nodeData. WORKING. DOCUMENTED.
#    new_node. WORKING. COULD TAKE PARAMS IN THE FORM: name:xyz firstIcon:1017 USE COLON AND SPACE. DOCUMENTED.
#    create_node. WORKING. COULD TAKE PARAMS IN THE FORM: name:xyz depth:3 USE COLON AND SPACE.
#    select_node. NOT IMPLEMENTED.
#    select_node_ID. NOT IMPLEMENTED.
#    render_tree. WORKING. DOCUMENTED.

## CONSTANTS ##

## KEYWORDS ##

##   PROPERTIES   ##

#     NODE PROPERTIES   #
#    "cached" REFERED TO BY: ID, NUMBER OR NAME. WORKING.
#    "children" REFERED TO BY: ID, NUMBER OR NAME. READ ONLY. WORKING. DOCUMENTED.
#    "depth"  REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "expanded" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "family" REFERED TO BY: ID, NUMBER OR NAME. READ ONLY. WORKING. DOCUMENTED.
#    "firstIconCollapsed" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "firstIconExpanded" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "ID" REFERED TO BY: ID, NUMBER OR NAME. READ ONLY. WORKING. DOCUMENTED.
#    "IDpath" REFERED TO BY: ID, NUMBER OR NAME. READ ONLY. WORKING. DOCUMENTED.
#    "indent" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "name" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "nodeType" CAN TAKE VALUES file or folder. REFERED TO BY: ID, NUMBER OR NAME. WORKING.
#    "nodeLine" REFERED TO BY: ID, NUMBER OR NAME. READ ONLY.  WORKING. DOCUMENTED.
#    "number" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "parent" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "path" REFERED TO BY: ID, NUMBER OR NAME. READ ONLY. WORKING.
#    "secondIconCollapsed" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "secondIconExpanded" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "sourcePath" REFERED TO BY: ID. WORKING. DOCUMENTED.
#    "thirdIconCollapsed" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "thirdIconExpanded" REFERED TO BY: ID, NUMBER OR NAME. WORKING. DOCUMENTED.
#    "textStyle" REFERED TO BY: ID. CAN BE: "bold,italic,underline,strikeOut,box,threeDbox,link,condensed,expanded" WORKING. DOCUMENTED.
#    "textFont" REFERED TO BY: ID. WORKING. DOCUMENTED.
#    "textSize" REFERED TO BY: ID. WORKING. DOCUMENTED.
#    "textColor" REFERED TO BY: ID. WORKING. DOCUMENTED.
#    "useFirstIcon" REFERED TO BY: ID. WORKING. DOCUMENTED.
#    "useSecondIcon" REFERED TO BY: ID. WORKING. DOCUMENTED.
#    "useThirdIcon" REFERED TO BY: ID. WORKING. DOCUMENTED.

#     TREE PROPERTIES #
#    "autoScrollbar" WORKING. DOCUMENTED.
#    "betweenNodesDelta" WORKING. DOCUMENTED.
#    "clickIcon" WORKING. DOCUMENTED.
#    "clickNode" WORKING. DOCUMENTED.
#    "collapsedChar" WORKING. Not introduced.
#    "customBehavior" CAN BE "true" OR "false". NOT FULLY IMPLEMENTED.
#    "expandOnDrop" WORKING. Not introduced.
#    "expandChar" WORKING. Not introduced.
#    "fileIcon" WORKING. DOCUMENTED.
#    "firstIconCollapsed" WORKING. DOCUMENTED.
#    "firstIconExpanded" WORKING. DOCUMENTED.
#    "hilitedNodeIDs" WORKING. DOCUMENTED.
#    "folderIcon" WORKING. Not introduced.
#    "hiliteDragNode" WORKING.
#    "hilitedTextColor" The color to apply to text when a row is highlighted. By default this property is empty in which case the color is black if the average of the RGB value for the hilite color > 128, white otherwise. NOT IMPLEMENTED: Not introduced.
#    "language" WORKING. Not introduced.
#    "lastNodeID" WORKING. DOCUMENTED.
#    "mouseIcon" NOT WORKING.
#    "newNodeOnReturn" WORKING. DOCUMENTED.
#    "nodeDivider" Tree property, (image ID) NOT IMPLEMENTED. Not introduced.
#    "nodeIDs" WORKING. DOCUMENTED.
#    "nodeSelector" Tree property, (image ID) NOT IMPLEMENTED. Not introduced.
#    "secondIconCollapsed" WORKING. DOCUMENTED.
#    "secondIconExpanded" WORKING. DOCUMENTED.
#    "treeType" CAN BE EITHER OF "filesystem" OR "custom" WORKING. DOCUMENTED.
#    "useCache"  WORKING.
#    "visibleNodeIDs" WORKING. DOCUMENTED.

#    "hilitedNode" SPECIFIES THE NAMES OR NUMBERS OF THE SELECTED NODES AS A LIST WITH ONE ID PER LINE. WORKING. Not introduced.
#    "hilitedNodes" SPECIFIES THE NAMES OR NUMBERS OF THE SELECTED NODES AS A LIST WITH ONE ID PER LINE. WORKING. Not introduced.
#    "hilitedNodeID" SPECIFIES THE IDs OF THE SELECTED NODES AS A LIST WITH ONE ID PER LINE. WORKING.
#    "hilitedNodeIDs" SPECIFIES THE IDs OF THE SELECTED NODES AS A LIST WITH ONE ID PER LINE. WORKING.
#    "hilitedNodeName" SPECIFIES THE NAMES OR NUMBERS OF THE SELECTED NODES AS A LIST WITH ONE ID PER LINE. WORKING AS SETTABLE. Not introduced.
#    "hilitedNodeNames" SPECIFIES THE NAMES OR NUMBERS OF THE SELECTED NODES AS A LIST WITH ONE ID PER LINE. WORKING AS SETTABLE. Not introduced.


## OPERATORS ##

## TODO ##
# Move all hilited nodes
# Indented Nodes with no Icon does not render correct when setting new name.
# Disabled Nodes. Specifies that a Node is dimmed and does not respond to user action.
# Script and behavior for nodes.
# look into "linkText" for storing data with the node.
# textHeight
# textPattern
# textShift Can be difficult to speed up as it does not have pixel detail with html.
# getProp handlers should not execute if nodeID is empty.
# cut - copy - paste
# Keep text formatting when rendering tree.
# useTabs (true or false)
# checked (true or false)
# selected READ ONLY.  WORKING. DECIDED TO SKIP FOR NOW.
# Separate handler for path calculation
# namePath ?
# sourcePath ?
# sorting of nodes (children, family, tree)
# mouseNodeChunk, mouseNodeChar, mouseNodeCharChunk
# Serials. NOT IMPLEMENTED.
# Messages from all handlers. NOT IMPLEMENTED IN ALL HANDLERS.

# - FIXED - #
# Name should work as for other objects. Name is part of the path. Refer to a node by ID, number, or name. Label work as for other objects.
# D&D hiliting not working when mouseDown over name or icons of node. SET HTMLTEXT TO A TEMP FIELD INSTEAD OF VARIABLE:
# Typing new name should set label if label is used.
# DoubleUp messes with drop! FIXED WITH tDrag set to false IN moueDoubleUp.
# Calculate and set path when scanning, creating, deleting and moving nodes. WORKING IN renderTree HANDLER.
# hiliteDragNode. Tree Property, can be true or false.
# drag handlers
# hilite the drop-node after D&D.
# IDpath (feels like a good idea!) WORKS!
# Setting "parent" should set "depth" and "number". WORKS!
# setting number and depth should apply to whole family. WORKS!
# check if Engine could be used as library stack. WORKS!
# nodeClick. NOT SURE IF AND HOW TO USE THIS! SEE DICTIONARY FOR "mouseClick". DECIDED TO SKIP.
# clickNode, mouseNode, selectedNode and selectedNodes  should be functions (read only). WORKING. READ ONLY:
# Remove selected_of_node_ID_ or make read only? WORKING. READ ONLY:
# Drag and Drop between nodes should set depth to deepest of node above and below.
# Drop nodes to same depth "between" other nodes. WORKING.
# Make children property settable and sortable. NOT IMPLEMENTED.
# Check hilited function/property with selected. (Hilited is property and selected is function in Rev.)
# setProp number_of_node_ID_[nodeID] newNumber. This one is ugly and takes a lot of time! FIXED!
# Standard tree behavior: mouseDoubleDown to expand, mouseDown on status icon to expand/collapse, two mouseUp on name to rename. WORKING.
# Two mouseUp on name to rename. WORKING.
# Setting icons should reset iconProperties. WORKING.
# "family" read-only property. WORKING! "subTree" could be synonym in future.
# hiliting is not working when clicked outside name or second icon. FIXED. Hiliting behaves unpredictable overall.
# Drop node to lower number is not working. FIXED.
# Drag and Drop not working when clicking outside text or icons. FIXED.
# Drag and Drop between nodes should work also between leafs. FIXED.
# mouseDoubleDown to expand. WORKING.
# mouseDown on status icon to expand/collapse. WORKING
# Remove layer property. FIXED.
# Should be able to have no icon. FIXED BY SETTING ICON PROPERTIES TO EMPTY.
# The node property "owner" should be replaced with "parent". REPLACED WITH PARENT.
# Fix // after C:. FIXED.
# Selection/hilite does not work when clicking on text or icon. REVBUG!
# Flag in the handlers to avoid setProp/getProp activated from TreeEngine script. FIXED.
# Remove depth. Can be calculated from the number of items in path. DECIDED TO KEEP.

# - v.1.1 - #
# templateNode. ?
# Disabled nodes, icon and text dimmed.
# Checkboxes.
# Hilite customization.
# Dragimage.

## SETTABLE PROPERTIES ##
# 

## READ-ONLY PROPERTIES ##
#

## PRO FEATURES ##
# Calback functionality to let rTree only display data (without storing it) from an external source. (See DataGrid)
# Full control of appearance and behavior.
# DLL Engine
# Commands, functions and messages in parity with native rev controls.

## Definitions ##
# Tree - a non-empty collection of nodes & edges 
# Node - can have a name and carry other associated information 
# Path - a list of distinct nodes in which successive nodes are connected by edges. Any two nodes must have one and only one path between them, else it is not a tree
# Root - starting point (top) of the tree 
# Parent (ancestor) of a node A - the node "above" node A 
# Child (descendent) of a node A - the node "below" node A 
# Siblings - nodes that have same parent 
# Leaf (terminal node) - a node with no children 
# Level of a node - the number of edges between this node and the root 
# Depth of a node - the number of edges from the root to that node.
# The depth of the root is 0. 
# Height of a node - the largest number of edges from that node to a leaf.
# The height of each leaf is zero 
# Height of a tree - the longest path from the root to a leaf node. 
# Balanced tree - the difference between the height of the left subtree and the right subtree is not more than 1. 
# Ordered trees - The order of the children matters, i.e. children are listed in a particular order. 

# Tips and Tricks
# Set the "sharedText" of the control (field) to true and then group the control and set the backgroundBehavior of the group to true. The Tree will look the same on all cards where the it appears.
