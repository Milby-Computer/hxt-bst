Script "stack_rTreeEngine_button_id_2135"

/*
# Name: button "rTreeBehavior" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2135 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: akrTMibuqtKsV8sU3VStpg==
*/


/*
rTree 2.0
©2008 - 2013 Tapirsoft
info@Tapirsoft.com 
This stack was written by Mats Wilstrand

Licensing terms:

These scripts are licensed to you if you agree to be bound to one of the following 
License types at your choice.  

1) GPLv3
You may use rTree as FREE Software as outlined in the terms of the GPLv3 or any 
higher version of the GPL as found here: 
http://www.gnu.org/licenses/gpl-3.0.html

2) Commercial license:
If you do not want to disclose the sources of your application you have the option 
to purchase a commercial license from http://www.tapirsoft.com You are paying 
a license fee for the major version of rTree. If you are licensing rTree 2.0.1, you 
will be able to use all upgrades that carry the same major version number 
(in this case 2.x). Once the switch is made to a version 3.x of the library, you will 
need to upgrade your license to use the latest version. However, of course you may 
continue to use any version of the library you currently have licensed, without 
needing to purchase an upgrade. Such a commercial license releases you from the 
requirements of the copyleft GPL license, which include: distribution of all source 
code, including your own product; licensing of your own product under the GPL 
license; prominent mention of the Tapirsoft copyright and the GPL license; and 
disclosure of modifications to the library.

Code Contributions
If you want to contribute to rTrees codebase and want your changes to be accepted 
into the main trunc, you will have to accept our open source contribution 
agreement as found here: 
http://www.tapirsoft.com/osca.pdf
*/

global gMs
global gSessionID
global gRootNodeIDs
global gNodeDataA
global gTEST

local sRootNodeIDs
local sNodeDataA
local sEffectiveNodeDataA
local sHilitedA
local tHandlerBusy
local sLastNodeID
local tNumber
local sIDpath
local sDepth
local sShown
local sNodeIDs
local sVisibleNodeIDs
local sHilitedNodeIDs
local sHeight
local sNodeLineCounter
local sClickedLineNum
local tBetweenNodes
local sFamily
local sDropNodes

local sStartMouseH
local sStartMouseV
local sLeftDelta
local sTopDelta
local sRightDelta
local sBottomDelta
local sPreviousMouse
local sPreviousTarget
local sStartRectangle
local sLockLocation
local sMouseWithin
local sSelection
local sFirstRun
local tMouseUpNodeID
local sLongNodeTextControlID

local tNodeContainerIDs

local sCellDataA
local sLockLoc
local sPersistentDataSaved
local sNodeBehaviorOfMe
local tE
local sWidestNodePixels
local sHendValue
local sRenderingTree
local sNewNodeID
local sVthumbSize
local sVlineInc
local sVpageInc
local sNodeExpanded
local sNodeCollapsed
local sVthumbPos
local sCalibratedLineNum
local sMouse
local sResizingControl
local sRect
local sAverageLineHeight
local sHilitedNodeIDsSorted
local sRecentNodeID

constant treeProperties = "autoScrollbar,betweenNodesDelta,clickIcon,clickNode,editNodeOnDoubleClick,fileIcon,firstIconCollapsed,firstIconExpanded,hilitedNodeIDs,lastNodeID,mouseNode,newNodeOnReturn,nodeIDs,secondIconCollapsed,secondIconExpanded,showInvisibleNodes,thirdIconCollapsed,thirdIconExpanded,treeType,visibleNodeIDs"
constant nodeProperties = "children,depth,expanded,IDpath,indent,nodeID,nodeLine,parent,sourcePath,textColor,textFont,textSize,textStyle,firstIconCollapsed,firstIconExpanded,secondIconCollapsed,secondIconExpanded,thirdIconCollapsed,thirdIconExpanded,fileIcon,fileIcon,useFirstIcon,useSecondIcon,useThirdIcon,useFirstBadge"
constant inheritableProperties = "firstIconCollapsed,firstIconExpanded,secondIconCollapsed,secondIconExpanded,thirdIconCollapsed,thirdIconExpanded,fileIcon,firstIconShift,secondIconShift,thirdIconShift,fileIcon,useFirstIcon,useSecondIcon,useThirdIcon"


setProp '[pExpression] newValue
   set '[pExpression] of me to newValue
end '

setProp rt[pExpression] newValue
   local tNodeRef , tExpression
   
   put word - 1 of pExpression into tNodeRef
   put word 1 to - 2 of pExpression into tExpression
   replace space with "_" in tExpression
   put "_" & "[" & tNodeRef & "]" after tExpression
   set the tExpression of me to newValue
end rt

getProp '[pExpression]
   get the rt[pExpression] of me
end '

getProp rt[pExpression]
   local tNodeRef , tExpression
   
   put word - 1 of pExpression into tNodeRef
   put word 1 to - 2 of pExpression into tExpression
   replace space with "_" in tExpression
   put "_" & "[" & tNodeRef & "]" after tExpression
   return the tExpression of me
end rt

on preOpenControl
   if the long ID of me is not in the long ID of the target
   then
      pass "preOpenControl"
   end if
   if sFirstRun is empty
   then
      if the autoStartUsing of me is not false
      then
         set the autoStartUsing of me to true
         start using stack "rTreeEngine"
      end if
      
      send "setPersistentData" to me
      -- open stack "rTreeEngine"
      if there is no graphic "cornerPiece" of me
      then
         SetDialogProperties
         answer warning "rTree" && the rTreeVersion of stack "rTreeEngine" && "has found an rTree control" & cr & \
               "(" && the name of me && ")" & cr & \ 
               "which is in an older rTree format!" & cr & cr & \
               "If you want to convert your old format rTree control into the rTree" && the rTreeVersion of stack "rTreeEngine" && "format" & cr & cr & \
               "Please right-click in your old rTree control and choose" && quote & "Import from Older Format" & quote \
               with "OK!"
      end if
      put false into sFirstRun
   end if
   pass preOpenControl
end preOpenControl

on move_node tParams
   local tRelativeToID
   local tPosition
   local tParentID
   local tChildren
   local tNewNodeID
   local tNofChildren
   local tPositionOldID
   local tProcessingNewNode
   local tNewNodeIDs
   local tName
   local tNodeIDsSorted
   local tRefPos
   local tRelativeToNumber
   local tRelativeToName
   local tIdOrName
   
   
   if tParams is not empty
   then
      set the wholematches to true
      -- replace quote with empty in tParams
      if "before node" is in tParams # Example: send "create_node" && "before node ID 1"
      then
         replace "- " with "-" in tParams
         put wordOffset("before",tParams) into tRefPos
            if word 1 of tParams is "ID"
            then
               put word 2 to tRefPos - 1 of tParams into tNewNodeID
               put "ID" && tNewNodeID into tIdOrName
            else
               put TheNewNodeID() into tNewNodeID
               if word 1 of tParams is not "before"
               then
                  put word 1 to tRefPos - 1 of tParams into sNodeDataA[tNewNodeID]["name"]
                  put sNodeDataA[tNewNodeID]["name"] into tIdOrName
               end if
            end if
            if word tRefPos to tRefPos + 2 of tParams is "before node ID"
            then
               put word tRefPos + 3 to - 1 of tParams into tRelativeToID
            else
               if word tRefPos + 2 to - 1 of tParams is an integer
               then
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToNumber
                  put line tRelativeToNumber of sNodeIDs into tRelativeToID
               else
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToName
                  put the ID_of_node_[tRelativeToName] of me into tRelativeToID
               end if
            end if
            if sNodeDataA[tRelativeToID]["number"] is not an integer # Check if Root ID exists.
            then
               answer error "Root Node can not be created." & cr &  "No such Root" && "(" & tRelativeToID & ")."
               exit "move_node"
            end if
            if the effectiveNodeData[tRelativeToID,"parent"] of me is empty
            then
               put lineOffset(tRelativeToID,the rootNodeIDs of me) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "move_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" before word tRefPos of tParams
                  */
               end if
               
               delete line tPosition of sRootNodeIDs
               
               send "create_node" && tIdOrName && "as root" && tPosition to me
            else
               put the effectiveNodeData[tRelativeToID,"parent"] of me into tParentID
               put the effectiveNodeData[tParentID,"children"] of me into tChildren
               put lineOffset(tRelativeToID,tChildren) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "move_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" before word tRefPos of tParams
                  */
               end if
               delete line tPosition of sNodeDataA[tParentID]["children"]
               send "create_node" && tIdOrName && "as child" && tPosition && "of node ID" && tParentID to me
            end if
         end if
         if "after node" is in tParams # Example: send "move_node" && "after node ID 1"
         then
            replace "- " with "-" in tParams
            put wordOffset("after",tParams) into tRefPos
            if word 1 of tParams is "ID"
            then
               put word 2 to tRefPos - 1 of tParams into tNewNodeID
               put "ID" && tNewNodeID into tIdOrName
            else
               put TheNewNodeID() into tNewNodeID
               if word 1 of tParams is not "after"
               then
                  put word 1 to tRefPos - 1 of tParams into sNodeDataA[tNewNodeID]["name"]
                  put sNodeDataA[tNewNodeID]["name"] into tIdOrName
               end if
            end if
            if word tRefPos to tRefPos + 2 of tParams is "after node ID"
            then
               put word tRefPos + 3 to - 1 of tParams into tRelativeToID
            else
               if word tRefPos + 2 to - 1 of tParams is an integer
               then
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToNumber
                  put line tRelativeToNumber of sNodeIDs into tRelativeToID
               else
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToName
                  put the ID_of_node_[tRelativeToName] of me into tRelativeToID
               end if
            end if
            if sNodeDataA[tRelativeToID]["number"] is not an integer # Check if Root ID exists.
            then
               answer error "Root Node can not be created." & cr &  "No such Root" && "(" & tRelativeToID & ")."
               exit "move_node"
            end if
            if the effectiveNodeData[tRelativeToID,"parent"] of me is empty
            then
               put lineOffset(tRelativeToID,the rootNodeIDs of me) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "move_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" after word tRefPos of tParams
                  */
               end if
               send "create_node" && tIdOrName && "as root" && tPosition + 1 to me
            else
               put the effectiveNodeData[tRelativeToID,"parent"] of me into tParentID
               put the effectiveNodeData[tParentID,"children"] of me into tChildren
               put lineOffset(tRelativeToID,tChildren) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "move_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" after word tRefPos of tParams
               */
            end if
            send "create_node" && tIdOrName && "as child" && tPosition + 1 && "of node ID" && tParentID to me
         end if
      end if
      if "as child" is in tParams # Example: dispatch "move_node" to group "Tree" of me with "as child 7 of node ID 1"
      then
         replace "- " with "-" in tParams
         repeat for each word tWord in tParams
            add 1 to tRefPos
            if word tRefPos to tRefPos + 1 of tParams is "as child"
            then
               exit repeat
            end if
         end repeat
         if word 1 of tParams is "ID"
         then
            put word 2 to tRefPos - 1 of tParams into tNewNodeID
         else
            if word 1 of tParams is not "as"
            then
               put the ID_of_node_[word 1 to tRefPos - 1 of tParams] of me into tNewNodeID
            end if
         end if
         -- if tNewNodeID is empty then 
         put word tRefPos + 2 of tParams into tPosition
         if tPosition is not an integer
         then
            answer error "Node can not be moved." & cr &  "Syntax error." & cr & "Node has no position." & cr &  "(" & tParams & ")"
            exit "move_node"
            /* # This would allow no position and place it last.
            put - 1 into tPosition
            put " -1" after word tRefPos of tParams
            */
         end if
         if tPosition = 0 then put - 1 into tPosition
         if word tRefPos + 3 to tRefPos + 5 of tParams is "of node ID"
         then
            put word tRefPos + 6 to - 1 of tParams into tRelativeToID
         else
            if word tRefPos + 5 to - 1 of tParams is an integer
            then
               put word tRefPos + 5 to - 1 of tParams into tRelativeToNumber
               put line tRelativeToNumber of sNodeIDs into tRelativeToID
            else
               put word tRefPos + 4 to - 1 of tParams into tRelativeToName
               put the ID_of_node_[tRelativeToName] of me into tRelativeToID
            end if
         end if
         if sNodeDataA[tRelativeToID]["number"] is not an integer # Check if Parent ID exists.
         then
            answer error "Node can not be moved." & cr &  "No such Parent" && "(" & tRelativeToID & ")."
            exit "move_node"
         end if
         put sNodeDataA[tNewNodeID]["parent"] into tParentID
         if tParentID is empty
         then
            put 0 into tParentID
            delete line lineOffset(tNewNodeID , sRootNodeIDs) of sRootNodeIDs
            delete line lineOffset(tNewNodeID , sRootNodeIDs) of sNodeDataA[0]["children"]
         end if
         delete line lineOffset(tNewNodeID , sNodeDataA[tParentID]["children"]) of sNodeDataA[tParentID]["children"]
         put sNodeDataA[tRelativeToID]["children"] into tChildren
         put the number of lines of tChildren into tNofChildren
         switch
            case tNofChildren = 0
               put tNewNodeID into sNodeDataA[tRelativeToID]["children"]
               break
            case tPosition < 0
               put line tPosition of tChildren into tPositionOldID
               if tPositionOldID is empty
               then
                  put tNewNodeID & cr before line tPosition of sNodeDataA[tRelativeToID]["children"]
               else
                  put cr & tNewNodeID after line tPosition of sNodeDataA[tRelativeToID]["children"]
               end if
               break
            case tPosition = 1
               put tNewNodeID & cr before sNodeDataA[tRelativeToID]["children"]
               break
            case tPosition > tNofChildren
               put cr & tNewNodeID after line tNofChildren of sNodeDataA[tRelativeToID]["children"]
               break
            case tPosition > 1
               put cr & tNewNodeID after line tPosition - 1 of sNodeDataA[tRelativeToID]["children"]
               break
         end switch
      end if
      if "as root" is in tParams # Example: dispatch "move_node" to group "Tree" of me with "as root 2"
      then
         replace "- " with "-" in tParams
         repeat for each word tWord in tParams
            add 1 to tRefPos
            if word tRefPos to tRefPos + 1 of tParams is "as root"
            then
               exit repeat
            end if
         end repeat
         if word 1 of tParams is "ID"
         then
            put word 2 to tRefPos - 1 of tParams into tNewNodeID
         else
            -- put TheNewNodeID() into tNewNodeID
            if word 1 of tParams is not "as"
            then
               put word 1 to tRefPos - 1 of tParams into sNodeDataA[tNewNodeID]["name"]
            end if
         end if
         
         put sNodeDataA[tNewNodeID]["parent"] into tParentID
         
         -- put tNewNodeID into sLastNodeID
         put word tRefPos + 2 of tParams into tPosition
         if tPosition is not an integer
         then
            answer error "Node can not be moved." & cr &  "Syntax error." & cr & "Node has no position." & cr &  "(" & tParams & ")"
            exit "move_node"
            /* # This would allow no position and place it last.
            put - 1 into tPosition
            put " -1" after word tRefPos of tParams
            */
         end if
         
         delete line lineOffset(tNewNodeID , sRootNodeIDs) of sRootNodeIDs
         delete line lineOffset(tNewNodeID , sRootNodeIDs) of sNodeDataA[0]["children"]
         
         delete line lineOffset(tNewNodeID , sNodeDataA[tParentID]["children"]) of sNodeDataA[tParentID]["children"]
         
         if tPosition = 0 then put - 1 into tPosition
         switch
            case sRootNodeIDs is empty
               put tNewNodeID into sRootNodeIDs
               put tNewNodeID into sNodeDataA[0]["children"]
               break
            case tPosition < - (the number of lines of sRootNodeIDs)
               put tNewNodeID & cr before sRootNodeIDs
               put tNewNodeID & cr before sNodeDataA[0]["children"]
               break
            case tPosition < 0
               put cr & tNewNodeID after line tPosition of sRootNodeIDs
               put cr & tNewNodeID after line tPosition of sNodeDataA[0]["children"]
               break
            case tPosition > the number of lines of sRootNodeIDs
               put cr & tNewNodeID after sRootNodeIDs
               put cr & tNewNodeID after sNodeDataA[0]["children"]
               break
            case tPosition = 1
               put tNewNodeID & cr before sRootNodeIDs
               put tNewNodeID & cr before sNodeDataA[0]["children"]
               break
            case tPosition > 1
               put cr & tNewNodeID after line tPosition - 1 of sRootNodeIDs
               put cr & tNewNodeID after line tPosition - 1 of sNodeDataA[0]["children"]
               break
         end switch
         -- dispatch "newNode" to me with tNewNodeID, the ID of me
         put false into tHandlerBusy
         -- return tNewNodeID
      end if
   end if
   if tParams is empty
   then
      answer error "Node can not be moved." & cr &  "Syntax error." & cr & "No parameters specified."
      exit "move_node"
   end if
end move_node


on mouseMove
   if the long ID of me is not in the long ID of the target
   then
      pass "mouseMove"
   end if
   if the cmdKey is down and the tool is "pointer tool"
   then
      if sResizingControl is not true
      then
         dispatch "savePersistentData" to me
      end if
      put true into sResizingControl
   end if
   if sResizingControl is true
   then
      exit "mouseMove"
   end if
   if the tool is "pointer tool"
   then      
      switch
         case mouse(1) is up and sMouse is "down"
            set the lockLoc of me to true
            dispatch "calibrateScrollbar" to me
            break
         case mouse(1) is down
            set the lockLoc of me to false
            if the rect of me is not sRect
            then
               put true into sResizingControl
            end if
            break
      end switch
   end if
   put the rect of me into sRect
   switch
      case there is no long id of the target
         break
      case the nodeID of the owner of the target is not empty
         set the mouseNode of me to the nodeID of the owner of the target
         break
      case the nodeID of the target is not empty
         set the mouseNode of me to the nodeID of the target
         break
      default
         -- set the mouseNode of me to empty
         break
   end switch
   
   -- if the tool is not "pointer tool" and mouse(1) is "up" and sMouse is "down" and the short name of the target is "firstIcon"
   -- then
      -- dispatch "mouseUp" to me with 1 , the long id of the target
   -- end if
   put the mouse into sMouse
   pass "mouseMove"
end mouseMove


on mouseEnter
   local tDescription
   local tLine
   local tChunk
   -- put the target ###
   try
      if the long id of me is in the long id of the target
      then
         if the mouse is up
         then
            put false into sResizingControl
         end if
         -- set the thumbPosition of scrollbar "verticalScrollbar" of me to round(the thumbPosition of scrollbar "verticalScrollbar" of me) # Gets rid of decimals.
         -- set the thumbPosition of scrollbar "horizontalScrollbar" of me to round(the thumbPosition of scrollbar "horizontalScrollbar" of me) # Gets rid of decimals.
         repeat for each item tControl in "connectionLines,dragIndicator,editindicator"
            if there is a control tControl of me
            then
               set the enabled of control tControl of me to false
            end if
         end repeat
         dispatch "rtMouseEnter" to the target -- with the effectiveNodeData[the nodeID of the owner of the target] of me
         dispatch "nodeEnter" to the target with the nodeID of the owner of the target
      end if
   catch tError
      put line (item 1 of tError) of the cErrorsList of card 1 of stack \
            "revErrorDisplay" & colon into tDescription
      put item 2 of tError into tLine
      put item 4 of tError into tChunk
      delete word - 1 of tChunk
      answer error tDescription && quote & tChunk & quote & cr & \
            "Line" && tLine && "in the script of" && the name of me
   end try
   pass mouseEnter
end mouseEnter


on mouseDown theButton theNodeID theTreeID
   local tHilitedNodeIDs
   local tFirstHilitedID
   local tFirstHilitedLine
   local tLastHilitedID
   local tLastHilitedLine
   local tHilitedLinesChunk
   local tRecentHilitedLine
   local sClickedNodeID
   local tClickedNodeNumber
   local tNodeName
   local tFirstIconCollapsed
   local tFirstIconExpanded
   local tIconID
   local tCached
   local tScanNow
   local tDescription
   local tLine
   local tChunk, tClickNodeID, tClickNodeNumber, tPreviousNodeID, tNextNodeID
   local tthumb
   if the long ID of me is in the long ID of the target
   then
      try
         put true into tHandlerBusy
         focus field "backgroundField" of me
         lock screen
         dispatch "startCalculateTree" to the target with the ID of me
         set the clickControl of me to the long ID of the target
         set the recentNodeID of me to the clickNode of me
         put the recentNodeID of me into sRecentNodeID
         set the clickNode of me to the nodeID of the owner of the target
         if the nodeID of the owner of the target is not empty
         then
            put the nodeID of the owner of the target into tClickNodeID
            put sNodeDataA[tClickNodeID]["number"] into tClickNodeNumber
            put line tClickNodeNumber - 1 of sNodeIDs into tPreviousNodeID
            put line tClickNodeNumber + 1 of sNodeIDs into tNextNodeID
            put the hilitedNodeIDs of me into tHilitedNodeIDs
            put the effectiveNodeData[the nodeID of the owner of the target,"nodeLine"] of me into sClickedLineNum
            set the clickNode of me to the nodeID of the owner of the target
            if word 1 of the name of the target is "button"
            then
               set the clickIcon of me to the icon of the target
            end if
            # Set hilitedNodeIDs
            if theButton is 1 and the hiliteOnMouseUp of me is false
            then
               switch
                  case the commandKey is "up" and the shiftKey is "up"
                     put the nodeID of the owner of the target into tHilitedNodeIDs
                     break
                  case the commandKey is "down"
                     switch
                        case the useMultipleHilites of me is not false
                           switch
                              case the useNoncontiguousHilites of me is not false
                                 if the nodeID of the owner of the target is among the lines of the hilitedNodeIDs of me
                                 then
                                    set the wholematches to true
                                    delete line lineOffset(the nodeID of the owner of the target , tHilitedNodeIDs) of tHilitedNodeIDs
                                 else
                                    put tHilitedNodeIDs & cr & the nodeID of the owner of the target into tHilitedNodeIDs
                                 end if
                                 break
                              case the useNoncontiguousHilites of me is false
                                 put the nodeID of the owner of the target into tHilitedNodeIDs
                                 break
                           end switch
                           break
                        case the useMultipleHilites of me is false
                           put the nodeID of the owner of the target into tHilitedNodeIDs
                           break
                     end switch
                     break
                  case the shiftKey is "down"
                     switch
                        case the useMultipleHilites of me is not false
                           put line 1 of the hilitedNodeIDs of me into tFirstHilitedID
                           put the effectiveNodeData[tFirstHilitedID,"nodeLine"] of me into tFirstHilitedLine
                           put line - 1 of the hilitedNodeIDs of me into tLastHilitedID
                           put the effectiveNodeData[tLastHilitedID,"nodeLine"] of me into tLastHilitedLine
                           if sClickedLineNum < tFirstHilitedLine
                           then
                              put line sClickedLineNum to tLastHilitedLine of sVisibleNodeIDs into tHilitedLinesChunk
                              put empty into tHilitedNodeIDs
                              repeat for each line tHilitedID in tHilitedLinesChunk
                                 put tHilitedID & cr after tHilitedNodeIDs
                              end repeat
                              if character - 1 of tHilitedNodeIDs is cr then
                                 delete character - 1 of tHilitedNodeIDs
                              end if
                           end if
                           if sClickedLineNum > tLastHilitedLine
                           then
                              put line tFirstHilitedLine to sClickedLineNum of sVisibleNodeIDs into tHilitedLinesChunk
                              put empty into tHilitedNodeIDs
                              repeat for each line tHilitedID in tHilitedLinesChunk
                                 put tHilitedID & cr after tHilitedNodeIDs
                              end repeat
                              if character - 1 of tHilitedNodeIDs is cr then
                                 delete character - 1 of tHilitedNodeIDs
                              end if
                           end if
                           if sClickedLineNum < tLastHilitedLine and sClickedLineNum > tFirstHilitedLine and tClickNodeID is not sRecentNodeID
                           then
                              put the effectiveNodeData[the recentNodeID of me,"nodeLine"] of me into tRecentHilitedLine
                              if tRecentHilitedLine is empty then
                                 put tFirstHilitedLine into tRecentHilitedLine
                              end if
                              if sClickedLineNum < tRecentHilitedLine
                              then
                                 put line sClickedLineNum to tRecentHilitedLine of sVisibleNodeIDs into tHilitedLinesChunk
                              else
                                 put line tRecentHilitedLine to sClickedLineNum of sVisibleNodeIDs into tHilitedLinesChunk
                              end if
                              put empty into tHilitedNodeIDs
                              repeat for each line tHilitedID in tHilitedLinesChunk
                                 put tHilitedID & cr after tHilitedNodeIDs
                              end repeat
                              if character - 1 of tHilitedNodeIDs is cr then
                                 delete character - 1 of tHilitedNodeIDs
                              end if
                           end if
                           break
                        case the useMultipleHilites of me is false
                           put the nodeID of the owner of the target into tHilitedNodeIDs
                           break
                     end switch
                     break
               end switch
               filter tHilitedNodeIDs without empty
               if char -1 of tHilitedNodeIDs=cr then delete char -1 of tHilitedNodeIDs
               set the hilitedNodeIDs of me to tHilitedNodeIDs
            end if
            # END Set hilitedNodeIDs
            put the nodeID of the owner of the target into sClickedNodeID
            put the effectiveNodeData[the nodeID of the owner of the target ,"number"] of me into tClickedNodeNumber
            if the short name of this stack is not "rTreeEngine"
            then
               set the LongStackID of stack "rTreeEngine" to the long id of this stack
               set the LongCardID of stack "rTreeEngine" to the long id of this card
               set the LongTreeID of stack "rTreeEngine" to the long id of me
               set the clickNode of stack "rTreeEngine" to the nodeID of the owner of the target
            end if
            put sNodeDataA[the nodeID of the owner of the target ]["name"] into tNodeName
            if the short name of the target is among the items of "firstIcon,secondIcon,thirdIcon"
            then
               put the effectiveNodeData[the nodeID of the owner of the target,"firstIconCollapsed"] of me into tFirstIconCollapsed
               put the effectiveNodeData[the nodeID of the owner of the target,"firstIconExpanded"] of me into tFirstIconExpanded
               put the icon of the target into tIconID
               if the short name of the target is "firstIcon"
               then
                  if sNodeDataA[the nodeID of the owner of the target]["expanded"] is not false
                  then
                     set the expanded_of_node_ID_[sClickedNodeID] of me to false
                     get TheVisibleNodeIDs()
                     put the thumbPos of sb "verticalScrollbar" of me into tThumb
                     
                     dispatch "calibrateScrollbar" to me
                  else
                     set the expanded_of_node_ID_[sClickedNodeID] of me to true
                     get TheVisibleNodeIDs()
                     put the thumbPos of sb "verticalScrollbar" of me into tThumb
                     dispatch "calibrateScrollbar" to me
                  end if
               end if
            end if
            if the effectiveNodeData[sClickedNodeID,"sourcePath"] of me is not empty and the useCache of me is not false
            then
               put the effectiveNodeData[sClickedNodeID,"cached"] of me into tCached
               if the useCache of me is not false and tCached is not true
               then
                  put true into sNodeDataA[sClickedNodeID]["cached"]
                  put true into tScanNow
               end if
            end if
            if there is a card ID sNodeDataA[sClickedNodeID]["cardID"]
            then
               go to card ID sNodeDataA[sClickedNodeID]["cardID"]
            end if
            dispatch "nodeDown" to the target with theButton , the nodeID of the owner of the target , the ID of me
            if tScanNow is true
            then
               dispatch "scanNode" to the target with the clickNode of me
            end if
         end if
         if "nodeContainer" is not in the long name of the target
         then
            set the clickNode of me to empty
         end if
         put false into tHandlerBusy
      catch tError
         put line (item 1 of tError) of the cErrorsList of card 1 of stack \
               "revErrorDisplay" & colon into tDescription
         put item 2 of tError into tLine
         put item 4 of tError into tChunk
         delete word - 1 of tChunk
         answer error tDescription && quote & tChunk & quote & cr & \
               "Line" && tLine && "in the script of" && the name of me
         put terror
      end try
   end if
   put false into tHandlerBusy
   dispatch "rtMouseDown" to the target with theButton , the effectiveNodeData[the nodeID of the owner of the target] of me
   if tThumb is not empty then
      set the thumbPos of sb "verticalScrollbar" of me to tThumb
   end if
   pass mouseDown
end mouseDown

on scan_node_ID theNodeID
   send "scanNode" && theNodeID to me
end scan_node_ID

on scanNode tNodeID
   local tClickNode
   local tSourcePath
   local tPath
   local tFolders
   local tFiles
   local tChildren
   
   dispatch "startScanNode" to control id the nodeContainerID_of_node_ID_[tNodeID] of me with tNodeID
   put tNodeID into tClickNode
   if the useCache of me is true or the useCache of me is empty
   then
      if the useGlobalData of me is not true
      then
         put true into sNodeDataA[tClickNode]["cached"]
      else
         put true into gNodeDataA[tClickNode]["cached"]
      end if
   end if
   put the effectiveNodeData[tClickNode,"sourcePath"] of me into tSourcePath
   put the shortFilePath of tSourcePath into tPath
   set the defaultFolder to tPath
   put the folders into tFolders
   put the files into tFiles
   if tSourcePath is empty or the result is "can't open directory"
   then
      set the cached_of_node_ID_[tClickNode] of me to false
      exit scanNode
   end if
   if character - 1 of tPath is slash then delete character - 1 of tPath # Removes slash after drive letter e.g. C:/
   
   put empty into tChildren
   
   if the useGlobalData of me is not true
   then
      repeat for each line tFolder in tFolders
         if tFolder is "." or tFolder is ".." then next repeat
         -- add 1 to sLastNodeID
         put TheNewNodeID() into sLastNodeID
         put cr & sLastNodeID after tChildren
         put tFolder into sNodeDataA[sLastNodeID]["name"]
         put tPath & slash & tFolder into sNodeDataA[sLastNodeID]["sourcePath"]
         put false into sNodeDataA[sLastNodeID]["expanded"]
         put "folder" into sNodeDataA[sLastNodeID]["nodeType"]
      end repeat
      repeat for each line tFile in tFiles
         if tFile is "." or tFile is ".." then next repeat
         -- add 1 to sLastNodeID
         put TheNewNodeID() into sLastNodeID
         put cr & sLastNodeID after tChildren
         put tFile into sNodeDataA[sLastNodeID]["name"]
         put tPath & slash & tFile into sNodeDataA[sLastNodeID]["sourcePath"]
         put false into sNodeDataA[sLastNodeID]["expanded"]
         put "file" into sNodeDataA[sLastNodeID]["nodeType"]
      end repeat
      delete character 1 of tChildren
      put tChildren into sNodeDataA[tClickNode]["children"]
   end if
   
   if the useGlobalData of me is true
   then
      repeat for each line tFolder in tFolders
         if tFolder is "." or tFolder is ".." then next repeat
         -- add 1 to sLastNodeID
         put TheNewNodeID() into sLastNodeID
         put cr & sLastNodeID after tChildren
         put tFolder into gNodeDataA[sLastNodeID]["name"]
         put tPath & slash & tFolder into gNodeDataA[sLastNodeID]["sourcePath"]
         put false into gNodeDataA[sLastNodeID]["expanded"]
         put "folder" into gNodeDataA[sLastNodeID]["nodeType"]
      end repeat
      repeat for each line tFile in tFiles
         if tFile is "." or tFile is ".." then next repeat
         -- add 1 to sLastNodeID
         put TheNewNodeID() into sLastNodeID
         put cr & sLastNodeID after tChildren
         put tFile into gNodeDataA[sLastNodeID]["name"]
         put tPath & slash & tFile into gNodeDataA[sLastNodeID]["sourcePath"]
         put false into gNodeDataA[sLastNodeID]["expanded"]
         put "file" into gNodeDataA[sLastNodeID]["nodeType"]
      end repeat
      delete character 1 of tChildren
      put tChildren into gNodeDataA[tClickNode]["children"]
   end if
   dispatch "finishedScanNode" to control id the nodeContainerID_of_node_ID_[tNodeID] of me with tNodeID
   send "renderTree" to me
   -- send "calibrateScrollbar" to me
end scanNode

on mouseUp theButton theTarget
   local tHilitedNodeIDs
   local tFirstHilitedID
   local tFirstHilitedLine
   local tLastHilitedID
   local tLastHilitedLine
   local tHilitedLinesChunk
   local tRecentHilitedLine
   local tCustomPropertiesA
   local tVisible
   local tRecentCards
   local tDescription
   local tLine
   local tChunk
   local tSelectedFieldLongID
   local tTarget
   local tClickNodeID, tClickNodeNumber, tPreviousNodeID, tNextNodeID
   
   put the long id of the target into tTarget
   
   if theTarget is not empty
   then
      put theTarget into tTarget
   end if
   
   if the long ID of me is in the long ID of tTarget
   then
      lock screen
      try
         put true into tHandlerBusy
         if there is a control "dragIndicator" of me then set the visible of control "dragIndicator" of me to false
         if there is a control "editIndicator" of me then set the visible of control "editIndicator" of me to false
         if the short name of tTarget is "nodeText"
         then
            set the lockText of tTarget to true
            set the autoHilite of tTarget to false
            set the listBehavior of tTarget to false
         end if
         local qNodeID
         local tClickNode
         put the nodeID of the owner of tTarget into qNodeID
         put the clickNode of me into tClickNode
         
         set the clickControl of me to the long ID of the target
         set the recentNodeID of me to the clickNode of me
         set the clickNode of me to the nodeID of the owner of the target
         if the nodeID of the owner of the target is not empty
         then
            put the nodeID of the owner of the target into tClickNodeID
            put sNodeDataA[tClickNodeID]["number"] into tClickNodeNumber
            put line tClickNodeNumber - 1 of sNodeIDs into tPreviousNodeID
            put line tClickNodeNumber + 1 of sNodeIDs into tNextNodeID
            put the hilitedNodeIDs of me into tHilitedNodeIDs
            put the effectiveNodeData[the nodeID of the owner of the target,"nodeLine"] of me into sClickedLineNum
            set the clickNode of me to the nodeID of the owner of the target
            if word 1 of the name of the target is "button"
            then
               set the clickIcon of me to the icon of the target
            end if
            # Set hilitedNodeIDs
            if theButton is 1 and the hiliteOnMouseUp of me is not false
            then
               switch
                  case the commandKey is "up" and the shiftKey is "up"
                     put the nodeID of the owner of the target into tHilitedNodeIDs
                     break
                  case the commandKey is "down"
                     switch
                        case the useMultipleHilites of me is not false
                           switch
                              case the useNoncontiguousHilites of me is not false
                                 if the nodeID of the owner of the target is among the lines of the hilitedNodeIDs of me
                                 then
                                    set the wholematches to true
                                    delete line lineOffset(the nodeID of the owner of the target , tHilitedNodeIDs) of tHilitedNodeIDs
                                 else
                                    put tHilitedNodeIDs & cr & the nodeID of the owner of the target into tHilitedNodeIDs
                                 end if
                                 break
                              case the useNoncontiguousHilites of me is false
                                 put the nodeID of the owner of the target into tHilitedNodeIDs
                                 break
                           end switch
                           break
                        case the useMultipleHilites of me is false
                           put the nodeID of the owner of the target into tHilitedNodeIDs
                           break
                     end switch
                     break
                  case the shiftKey is "down"
                     switch
                        case the useMultipleHilites of me is not false
                           put line 1 of the hilitedNodeIDs of me into tFirstHilitedID
                           put the effectiveNodeData[tFirstHilitedID,"nodeLine"] of me into tFirstHilitedLine
                           put line - 1 of the hilitedNodeIDs of me into tLastHilitedID
                           put the effectiveNodeData[tLastHilitedID,"nodeLine"] of me into tLastHilitedLine
                           if sClickedLineNum < tFirstHilitedLine
                           then
                              put line sClickedLineNum to tLastHilitedLine of sVisibleNodeIDs into tHilitedLinesChunk
                              put empty into tHilitedNodeIDs
                              repeat for each line tHilitedID in tHilitedLinesChunk
                                 put tHilitedID & cr after tHilitedNodeIDs
                              end repeat
                              if character - 1 of tHilitedNodeIDs is cr then
                                 delete character - 1 of tHilitedNodeIDs
                              end if
                           end if
                           if sClickedLineNum > tLastHilitedLine
                           then
                              put line tFirstHilitedLine to sClickedLineNum of sVisibleNodeIDs into tHilitedLinesChunk
                              put empty into tHilitedNodeIDs
                              repeat for each line tHilitedID in tHilitedLinesChunk
                                 put tHilitedID & cr after tHilitedNodeIDs
                              end repeat
                              if character - 1 of tHilitedNodeIDs is cr then
                                 delete character - 1 of tHilitedNodeIDs
                              end if
                           end if
                           if sClickedLineNum <= tLastHilitedLine and sClickedLineNum >= tFirstHilitedLine and tClickNodeID is not sRecentNodeID
                           then
                              put the effectiveNodeData[sRecentNodeID,"nodeLine"] of me into tRecentHilitedLine
                              if tRecentHilitedLine is empty then
                                 put tFirstHilitedLine into tRecentHilitedLine
                              end if
                              if sClickedLineNum < tRecentHilitedLine
                              then
                                 put line sClickedLineNum to tRecentHilitedLine of sVisibleNodeIDs into tHilitedLinesChunk
                              else
                                 put line tRecentHilitedLine to sClickedLineNum of sVisibleNodeIDs into tHilitedLinesChunk
                              end if
                              put empty into tHilitedNodeIDs
                              repeat for each line tHilitedID in tHilitedLinesChunk
                                 put tHilitedID & cr after tHilitedNodeIDs
                              end repeat
                              if character - 1 of tHilitedNodeIDs is cr then
                                 delete character - 1 of tHilitedNodeIDs
                              end if
                           end if
                           break
                        case the useMultipleHilites of me is false
                           put the nodeID of the owner of the target into tHilitedNodeIDs
                           break
                     end switch
                     break
               end switch
               filter tHilitedNodeIDs without empty
               if char -1 of tHilitedNodeIDs=cr then delete char -1 of tHilitedNodeIDs
               set the hilitedNodeIDs of me to tHilitedNodeIDs
            end if
            # END Set hilitedNodeIDs
         end if
         put the customProperties of me into tCustomPropertiesA
         repeat for each key tKey in tCustomPropertiesA
            replace cr with comma in tCustomPropertiesA[tKey]
         end repeat
         combine tCustomPropertiesA using cr and tab
         switch
            case theButton is 3 and the short name of this stack is not "rTreeEngine"
               if the useContextMenu of me is not false and sNodeDataA[the nodeID of the owner of tTarget] is not false
               then
                  set the visible of stack "rTreeEngine" to false
                  put the visible of stack "rTreeEngine" into tVisible
                  put the recentCards of stack "rTreeEngine" into tRecentCards
                  switch
                     case the name of tTarget is the name of control "backgroundField"
                        dispatch "treeID" to button "TreeMenu" of card "Engine" of stack "rTreeEngine" \
                              with the long ID of me , the long ID of tTarget
                        dispatch "treeClickLoc" to button "TreeMenu" of card "Engine" of stack "rTreeEngine" \
                              with the clickLoc
                        set the visible of stack "rTreeEngine" to false
                        set the decorations of stack "rTreeEngine" to "default"
                        palette stack "rTreeEngine"
                        open card "Engine" of stack "rTreeEngine"
                        popup button "TreeMenu" of card "Engine" of stack "rTreeEngine"
                        set the rectangle of stack "rTreeEngine" to the ResizedRectangle of stack "rTreeEngine" 
                        break
                     case the short name of tTarget is among the items of "nodeBackground"
                        lock screen
                        dispatch "treeID" to button "NodeMenu" of card "Engine" of stack "rTreeEngine" \
                              with the long ID of me , the long ID of tTarget , the mouseLine
                        set the decorations of stack "rTreeEngine" to "default"
                        palette stack "rTreeEngine"
                        open card "Engine" of stack "rTreeEngine"
                        popup button "NodeMenu" of card "Engine" of stack "rTreeEngine"
                        set the rectangle of stack "rTreeEngine" to the ResizedRectangle of stack "rTreeEngine" 
                        unlock screen
                        break
                     case the short name of tTarget is among the items of "firstBadge,secondBadge,thirdBadge"
                        dispatch "treeID" to button "BadgeMenu" of card "Engine" of stack "rTreeEngine" \
                              with the long ID of me , the long ID of tTarget
                        set the decorations of stack "rTreeEngine" to "default"
                        palette stack "rTreeEngine"
                        open card "Engine" of stack "rTreeEngine"
                        popup button "BadgeMenu" of card "Engine" of stack "rTreeEngine"
                        set the rectangle of stack "rTreeEngine" to the ResizedRectangle of stack "rTreeEngine" 
                        break
                  end switch
               end if
         end switch
         put the nodeID of the owner of tTarget into tMouseUpNodeID
         set the tDrag of stack "rTreeEngine" to false
         -- switched to target to avoid havoc when the defaultstack has changed MB
         dispatch "nodeUp" to tTarget with theButton , the nodeID of the owner of the target , the ID of me
         unlock screen
      catch tError
         put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
         put item 2 of tError into tLine
         put item 4 of tError into tChunk
         delete word - 1 of tChunk
         answer error tDescription && quote & tChunk & quote & cr & \
               "Line" && tLine && "in the script of" && the name of me
      end try
      put false into tHandlerBusy
      
      if there is a the behavior of me
      then
         dispatch "rtMouseUp" to the behavior of me
      end if
      if there is a the behavior of tTarget
      then
         dispatch "rtMouseUp" to the behavior of tTarget
      end if
      if there is a the behavior of the owner of tTarget
      then
         dispatch "rtMouseUp" to the behavior of the owner of tTarget
      end if
      
      pass mouseUp theButton
   end if
   
   if there is a the behavior of me
   then
      dispatch "rtMouseUp" to the behavior of me
   end if
   if there is a the behavior of tTarget
   then
      dispatch "rtMouseUp" to the behavior of tTarget
   end if
   if there is a the behavior of the owner of tTarget
   then
      dispatch "rtMouseUp" to the behavior of the owner of tTarget
   end if
   
   pass mouseUp
end mouseUp


on rawKeyUp theKey
   if the long ID of me is not in the long ID of the target
   then
      pass "rawKeyUp"
   end if
   local tSelectedFieldLongID
   local tNodeID
   local tSelectedChunk
   local tFieldTopLeft
   
   if the long ID of me is in the long ID of the target
   then
      -- set the lockLoc of me to true
   if (theKey is 65361 or theKey is 65362 or theKey is 65363 or theKey is 65364) # Scroll wheel
   then
      pass "rawKeyUp"
   end if
   lock screen
   if the target is not empty
   then
      if word 1 of the short name of the target is "nodeText" and the lockText of the target is false
      then
         put the long ID of the target into tSelectedFieldLongID
         put the nodeID of the owner of the target into tNodeID
         if theKey is 65293 or theKey is 65288 or theKey is 65535 # returnKey or backspaceKey or deleteKey
         then
            if character - 1 of the target is cr then delete character - 1 of the target
            put the selectedChunk into tSelectedChunk
            set the htmlText_of_node_ID_[the nodeID of the owner of the target] of me to the htmlText of the target
            set the lockText of the target to false
            set the showBorder of the target to true
            set the opaque of the target to true
            send "updateTree" to me
            select tSelectedChunk
         end if
         put the topLeft of the target into tFieldTopLeft
         set the width of the target to the formattedWidth of the target
         set the height of the target to the formattedHeight of the target
         set the topLeft of the target to tFieldTopLeft
         -- send "updateTree" to me
         -- set the lockText of tSelectedFieldLongID to false
      end if
   end if
   end if
   unlock screen
   pass "rawKeyUp"
end rawKeyUp

on mouseDoubleUp theButton
   local tRect
   if the the long id of me is in the long id of the target
   then
      -- set the lockLoc of me to true
      if word 1 of the short name of the target is "nodeText" and the editNodeOnDoubleClick of me is not false
      then
         put the rectangle of the target into tRect
         set the lockText of the target to false # Takes 40 ms to set lockText!
         set the rectangle of the target to tRect
         set the listBehavior of the target to false
         set the autoHilite of the target to true
         send "selectAfterMouseUp" to me in 0 millisec
      end if
      
      -- set the clickNode of me to the nodeID of the owner of the target
      if the expanded_of_node_ID_[the nodeID of the owner of the target] of me is empty
      then
         set the expanded_of_node_ID_[the nodeID of the owner of the target] of me to true
      end if
      switch
         case  the short name of the target is "firstIcon"
            break
         case there is a control "nodeText" of the owner of the target
            if the lockText of control "nodeText" of the owner of the target is true and the expandOnDoubleClick of me is not false
            then
               -- send "afterMouseDoubleDown" && the nodeID of the owner of the target to me in 1 millisec
               set the expanded_of_node_ID_[the nodeID of the owner of the target] of me to not the expanded_of_node_ID_[the nodeID of the owner of the target] of me
               send "renderTree" to me
            end if
            break
         default
            if the expandOnDoubleClick of me is not false
            then
               -- send "afterMouseDoubleDown" && the nodeID of the owner of the target to me in 1 millisec
               set the expanded_of_node_ID_[the nodeID of the owner of the target] of me to not the expanded_of_node_ID_[the nodeID of the owner of the target] of me
               send "renderTree" to me
            end if
      end switch
      
      dispatch "nodeDoubleUp" to the target with theButton , the nodeID of the owner of the target , the ID of me
   end if
   --pass mouseDoubleUp
end mouseDoubleUp

on selectAfterMouseUp
   select character 1 to - 1 of the selectedLine
   set the threeD of the selectedField to false
   set the showborder of the selectedField to true
   set the opaque of the selectedField to true
end selectAfterMouseUp


on mouseLeave
   if the long ID of me is not in the long ID of the target
   then
      pass "mouseLeave"
   end if
   if "nodeBackground" is not in the target
   then
      -- set the mouseNode of me to empty
      set the mouseIcon of me to empty
   end if
   dispatch "rtMouseLeave" to the target with the nodeID of the owner of the target
   dispatch "nodeLeave" to the target with the nodeID of the owner of the target
   pass mouseLeave
end mouseLeave


on resizeControl
   if the long ID of me is not in the long ID of the target
   then
      pass "resizeControl"
   end if
   local tThumbPosition
   -- lock screen
   send "updateGeometry" to me
   -- send "calibrateScrollbar" to me -- && tThumbPosition
   send "updateTree" && the thumbPosition of scrollbar "verticalScrollbar" of me to me
   if mouse(1) is up
   then
      put false into sResizingControl
   end if
   -- patch alejandro 2
   --set the pageInc of sb "verticalScrollbar" of me to the number of lines of the nodeContainerIDs of me
   -- pass resizeControl # For speed do not pass!
end resizeControl

on moveControl
   if the long ID of me is not in the long ID of the target
   then
      pass "moveControl"
   end if
   if mouse(1) is up
   then
      put false into sResizingControl
      set the lockLoc of me to true
   end if
end moveControl

local sPageIncFactor
local sMillisecStart

on cancelMessage
   local tMessage
   put param(1) into tmessage
   repeat for each line theLine in the pendingMessages
      if tMessage is in theLine then cancel item 1 of theLine
   end repeat
end cancelMessage

on mouseWheelScrollUp
   local tMillisecDelta, tScrollDelta
   cancelMessage "mouseWheelScrollUp"
   cancelMessage "mouseWheelScrollDown"
   if the thumbPosition of scrollbar "VerticalScrollbar" of me < 0 or the thumbPosition of scrollbar "VerticalScrollbar" of me is not a number
   then
      set the thumbPosition of scrollbar "VerticalScrollbar" of me to 0
   end if
   if the useMomentumScroll of me is false
   then
      put the pageInc of scrollbar "VerticalScrollbar" of me - the  lineInc of scrollbar "VerticalScrollbar" of me into tScrollDelta
      if tScrollDelta < 1 then
         put 1 into tScrollDelta
      end if
      set the thumbPosition of scrollbar "VerticalScrollbar" of me to round(the thumbPosition of scrollbar "VerticalScrollbar" of me - tScrollDelta)
   else
      put the millisec - sMillisecStart + 10 into tMillisecDelta
      put (the endValue of of scrollbar "VerticalScrollbar" of me * 2) / tMillisecDelta * 0.7 into sPageIncFactor
      if sPageIncFactor < 4
      then
         put 1 into sPageIncFactor
      end if
      set the thumbPosition of scrollbar "VerticalScrollbar" of me to round(the thumbPosition of scrollbar "VerticalScrollbar" of me - sPageIncFactor)
      put the millisec into sMillisecStart
   end if
end mouseWheelScrollUp
   
on mouseWheelScrollDown
   local tMillisecDelta, tScrollDelta
   cancelMessage "mouseWheelScrollUp"
   cancelMessage "mouseWheelScrollDown"
   if the thumbPosition of scrollbar "VerticalScrollbar" of me < 0 or the thumbPosition of scrollbar "VerticalScrollbar" of me is not a number
   then
      set the thumbPosition of scrollbar "VerticalScrollbar" of me to 0
   end if
   if the useMomentumScroll of me is false
   then
      put the pageInc of scrollbar "VerticalScrollbar" of me - the lineInc of scrollbar "VerticalScrollbar" of me into tScrollDelta
      if tScrollDelta < 1 then
         put 1 into tScrollDelta
      end if
      set the thumbPosition of scrollbar "VerticalScrollbar" of me to round(the thumbPosition of scrollbar "VerticalScrollbar" of me + tScrollDelta)
   else
      put the millisec - sMillisecStart + 10 into tMillisecDelta
      put (the endValue of of scrollbar "VerticalScrollbar" of me * 2) / tMillisecDelta * 0.7 into sPageIncFactor
      if sPageIncFactor < 4
      then
         put 1 into sPageIncFactor
      end if
      set the thumbPosition of scrollbar "VerticalScrollbar" of me to round(the thumbPosition of scrollbar "VerticalScrollbar" of me + sPageIncFactor)
      put the millisec into sMillisecStart
   end if
end mouseWheelScrollDown

on rawKeyDown theKey
   if the long ID of me is not in the long ID of the target
   then
      pass "rawKeyDown"
   end if
   local tThumbPos
   local tLineNum
   local tDescription
   local tLine
   local tChunk
   local tHscrollbarHeight
   local tID
   
   switch
      case theKey is 65308 # mouse wheel down
         if the useMomentumScroll of me is false
         then
            send "mouseWheelScrollDown" to me in 0 millisec
         else
            if sPageIncFactor is empty then put 1 into sPageIncFactor
            send "mouseWheelScrollDown" to me in 70 millisec
         end if
         pass "rawKeyDown"
         break
      case theKey is 65309 # mouse wheel up
         if the useMomentumScroll of me is false
         then
            send "mouseWheelScrollUp" to me in 0 millisec
         else
            if sPageIncFactor is empty then put 1 into sPageIncFactor
            send "mouseWheelScrollUp" to me in 70 millisec
         end if
         pass "rawKeyDown"
         break
   end switch
   
   -- put the millisec into ms ###
   -- put the target  ###
   if the long ID of me is in the long ID of the target
   then
      try
         if theKey is 65308 or theKey is 65309
         then
            -- put the selectedChunk -- long name of the selectedField ###
            focus field "backgroundField" of me # Mouse wheel.
         end if
         -- lock screen
         put true into tHandlerBusy
         
         if theKey is 65293 and the lockText of the selectedField is true # Return Key.
         then
            if the newNodeOnReturn of me is not false
            then
               set the newNodeOnReturn of me to true
               switch
                  case the clickControl of me is the long ID of field "backgroundField" of me and the clickV <= the top of me
                     send "new_node" && "as root 1" to me
                     break
                  case the clickControl of me is the long ID of field "backgroundField" of me and the clickV > the top of me
                     send "new_node" && "as root - 1" to me
                     break
                  case the effectiveNodeData[word 1 of the hilitedNodeIDs of me,"expanded"] of me is not false
                     send "new_node" && "as child - 1 of node ID" && word 1 of the hilitedNodeIDs of me to me
                     break
                  case the effectiveNodeData[word 1 of the hilitedNodeIDs of me,"expanded"] of me is false
                     send "new_node" && "as child - 1 of node ID" && the effectiveNodeData[word 1 of the hilitedNodeIDs of me,"parent"] of me to me
                     break
               end switch
               send "renderTree" to me
               focus field "backgroundField" of me
            end if
            pass "rawKeyDown"
         end if
         
         if theKey is 65505 then pass "rawKeyDown"
         
         # Arrowkey navigation.
         if (theKey is 65361 or theKey is 65362 or theKey is 65363 or theKey is 65364) -- and the lockText of the selectedField is true
         then
            put the thumbposition of scrollbar "VerticalScrollbar" of me into tThumbPos
            repeat for each line tContainerID in the nodeContainerIDs of me
               add 1 to tLineNum
               if line 1 of the hilitedNodeIDs of me is the nodeID of control ID tContainerID of me then exit repeat
            end repeat
            switch 
               case theKey is 65361 or theKey is 65362
                  if tLineNum = 1
                  then
                     put the nodeID of control ID line tLineNum of the nodeContainerIDs of me into tID
                     set the thumbPosition of scrollbar "VerticalScrollbar" of me to round(tThumbPos - 1)
                     set the hilitedNodeIDs of me to tID
                  else
                     set the hilitedNodeIDs of me to the nodeID of control ID line tLineNum - 1 of the nodeContainerIDs of me
                  end if
                  break
               case theKey is 65363 or theKey is 65364 and tLineNum is not the number of lines of sVisibleNodeIDs
                  put 0 into tHscrollbarHeight
                  if the visible of scrollbar "HorizontalScrollbar" of me is true then
                     put the height of scrollbar "HorizontalScrollbar" of me into tHscrollbarHeight
                  end if
                  if the bottom of control ID line tLineNum of the nodeContainerIDs of me of me > the bottom of me - tHscrollbarHeight
                  then
                     put the nodeID of control ID line tLineNum of the nodeContainerIDs of me into tID
                     set the thumbPosition of scrollbar "VerticalScrollbar" of me to round(tThumbPos + 1)

                     set the hilitedNodeIDs of me to tID
                     -- patch alejandro scrolling
                     set the hilitedNodeIDs of me to the nodeID of control ID line (the number of lines of the nodeContainerIDs of me) of the nodeContainerIDs of me
                     
                  else
                     if line tLineNum + 1 of the nodeContainerIDs of me is not empty then
                        set the hilitedNodeIDs of me to the nodeID of control ID line tLineNum + 1 of the nodeContainerIDs of me
                     end if
                  end if
                  break
            end switch
            pass "rawKeyDown"
         end if
         
         if theKey is 65535 # deleteKey
         then
            switch
               case word 1 of the name of the target is "field" and the lockText of the target is false
                  break
               default
                  if not the dontDeleteNodesOnDeleteKey of me then
                     dispatch "delete_node_ID" to me with the hilitedNodeIDs of me
                     dispatch "calculateTree" to the target
                     set the hilitedNodeIDs of me to empty
                     send "renderTree" to me
                  end if
            end switch
         end if
         -- unlock screen
      catch tError
         put line (item 1 of tError) of the cErrorsList of card 1 of stack "revErrorDisplay" & colon into tDescription
         put item 2 of tError into tLine
         put item 4 of tError into tChunk
         delete word - 1 of tChunk
         answer error tDescription && quote & tChunk & quote & cr & "Line" && tLine && "in the script of" && the name of me
      end try
   end if
   put true into tHandlerBusy
   unlock screen
   pass "rawKeyDown" theKey
end rawKeyDown

setProp globalRootNodeIDs newRootNodeIDs
   replace comma with cr in newRootNodeIDs
   put newRootNodeIDs into gRootNodeIDs
   -- put true into gUpdateAll
   pass globalRootNodeIDs
end globalRootNodeIDs

setProp rootNodeIDs newRootNodeIDs
   replace comma with cr in newRootNodeIDs
   if character 1 of newRootNodeIDs is cr then delete character 1 of newRootNodeIDs
   if character - 1 of newRootNodeIDs is cr then delete character - 1 of newRootNodeIDs
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         -- put newRootNodeIDs into gRootNodeIDs
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         put newRootNodeIDs into sRootNodeIDs
         break
   end switch
   pass rootNodeIDs
end rootNodeIDs

on globalRootNodeIDs newRootNodeIDs
   replace comma with cr in newRootNodeIDs
   put newRootNodeIDs into gRootNodeIDs
   -- put true into gUpdateAll
end globalRootNodeIDs

on rootNodeIDs newRootNodeIDs
   replace comma with cr in newRootNodeIDs
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         -- put newRootNodeIDs into gRootNodeIDs
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         put newRootNodeIDs into sRootNodeIDs
         break
   end switch
end rootNodeIDs

getProp rootNodeIDs
   if sFirstRun is empty then pass rootNodeIDs
   return sRootNodeIDs
end rootNodeIDs

getProp globalRootNodeIDs
   if sFirstRun is empty then pass globalRootNodeIDs
   return gRootNodeIDs
end globalRootNodeIDs

getProp effectiveRootNodeIDs
   local tRootNodeIDs
   
   if the useGlobalData of me is true
   then
      put gRootNodeIDs into tRootNodeIDs
      if tRootNodeIDs is empty
      then
         put sRootNodeIDs into tRootNodeIDs
      end if
      else
         put sRootNodeIDs into tRootNodeIDs
      end if
   return tRootNodeIDs
end effectiveRootNodeIDs

getProp globalNodeData[theKeys]
   if sFirstRun is empty then pass globalNodeData
   switch
      case theKeys is empty
         return gNodeDataA
         break
      case the number of items of theKeys is 1
         return gNodeDataA[item 1 of theKeys]
         break
      case the number of items of theKeys is 2
         switch
            case  item 2 of theKeys is "leaf"
               if sNodeDataA[item 1 of theKeys]["children"] is empty then return true else return false
               break
            case  item 2 of theKeys is "depth"
               return TheDepth(item 1 of theKeys)
               break
            case  item 2 of theKeys is "family"
               return TheFamily(item 1 of theKeys)
               break
            case  item 2 of theKeys is "IDpath"
               return TheIDpath(item 1 of theKeys)
               break
            default
               return gNodeDataA[item 1 of theKeys][item 2 of theKeys]
         end switch
         break
      case the number of items of theKeys is 3
         return gNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
         break
   end switch
end globalNodeData

setProp globalNodeData[theKeys] newNodeData
   if the keys of newNodeData[0] is not empty
   then
      repeat for each key tProperty in newNodeData[0]
         set the  tProperty of me to newNodeData[0][tProperty]
      end repeat
      if newNodeData[0]["children"] is not empty then put newNodeData[0]["children"] into gRootNodeIDs
      set the globalRootNodeIDs of me to gRootNodeIDs
   end if
   switch
      case theKeys is empty
         put newNodeData into gNodeDataA
         break
      case the number of items of theKeys is 1
         repeat for each key tKey in newNodeData
            put newNodeData[tKey] into gNodeDataA[item 1 of theKeys][tKey]
         end repeat
         break
      case the number of items of theKeys is 2
         put newNodeData into gNodeDataA[item 1 of theKeys][item 2 of theKeys]
         switch
            case item 2 of theKeys is "label"
               set the label_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "name"
               set the name_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "styledText"
               set the styledText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "htmlText"
               set the htmlText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "rtfText"
               set the rtfText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "unicodeText"
               set the unicodeText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "text" and gNodeDataA[item 1 of theKeys]["htmlText"] is empty
               set the text_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "expanded" or item 2 of theKeys is "visible"
               break
            case item 2 of theKeys is "children"
               break
         end switch
         break
      case the number of items of theKeys is 3
         put newNodeData into gNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
         switch
            case item 2 of theKeys is "expanded" or item 2 of theKeys is "visible"
               break
         end switch
         break
   end switch
   pass globalNodeData
end globalNodeData

setProp nodeData[theKeys] newNodeData
   local tNodeID
   
   -- put the millisec into ms ###
   if the keys of newNodeData[0] is not empty
   then
      repeat for each key tProperty in newNodeData[0]
         if tProperty is "children"
         then
            put newNodeData[0]["children"] into sRootNodeIDs
            next repeat
         end if
         set the tProperty of me to newNodeData[0][tProperty]
      end repeat
      -- if newNodeData[0]["children"] is not empty then put newNodeData[0]["children"] into sRootNodeIDs
      set the rootNodeIDs of me to sRootNodeIDs
   end if
   switch
      case theKeys is empty
         put newNodeData into sNodeDataA
         break
      case the number of items of theKeys is 1
         repeat for each key tKey in newNodeData
            put newNodeData[tKey] into sNodeDataA[item 1 of theKeys][tKey]
         end repeat
         break
      case the number of items of theKeys is 2
         put newNodeData into sNodeDataA[item 1 of theKeys][item 2 of theKeys]
         switch
            case item 2 of theKeys is "label"
               set the label_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "name"
               set the name_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "styledText"
               set the styledText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "htmlText"
               set the htmlText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "rtfText"
               set the rtfText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "unicodeText"
               set the unicodeText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "depth"
               set the depth_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "number"
               set the number_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "text" and sNodeDataA[item 1 of theKeys]["htmlText"] is empty
               set the text_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "expanded"
               switch
                  case newNodeData is true
                     if there is a control id the nodeContainerID_of_node_ID_[item 1 of theKeys] of me
                     then
                        dispatch "nodeExpanded" to control id the nodeContainerID_of_node_ID_[item 1 of theKeys] of me with item 1 of theKeys
                     else
                        dispatch "nodeExpanded" to me with item 1 of theKeys
                     end if
                     break
                  case newNodeData is false
                     if there is a control id the nodeContainerID_of_node_ID_[item 1 of theKeys] of me
                     then
                        dispatch "nodeCollapsed" to control id the nodeContainerID_of_node_ID_[item 1 of theKeys] of me with item 1 of theKeys
                     else
                        dispatch "nodeCollapsed" to me with item 1 of theKeys
                     end if
                     break
               end switch
               break
            case item 2 of theKeys is "visible"
               break
            case item 2 of theKeys is "children"
               replace comma with cr in newNodeData
               if character 1 of newNodeData is cr then delete character 1 of newNodeData
               if character - 1 of newNodeData is cr then delete character - 1 of newNodeData
               repeat for each line tChildID in newNodeData
                  -- set the parent_of_node_ID_[tChildID] of me to tNodeID
                  put tNodeID into sNodeDataA[tChildID]["parent"]
               end repeat
               break
         end switch
         break
      case the number of items of theKeys is 3
         put newNodeData into sNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
         switch
            case item 2 of theKeys is "expanded" or item 2 of theKeys is "visible"
               break
         end switch
         break
   end switch
   -- put the millisec - ms ###
   set the nodeData of me to sNodeDataA
   -- pass nodeData
end nodeData

on new_node tParams
   send "create_node" && tParams to me
end new_node

function TheNewNodeID
   local tNodeIDsSorted
   switch
      case sLastNodeID is an integer
         put sLastNodeID + 1 into sNewNodeID
         break
      case sLastNodeID is not an integer
         put sNodeIDs into tNodeIDsSorted
         sort tNodeIDsSorted numeric descending
         if line 1 of tNodeIDsSorted is an integer
         then
            put line 1 of tNodeIDsSorted + 1 into sNewNodeID
         else
            put the number of lines of tNodeIDsSorted + 1 into sNewNodeID
         end if
         break
   end switch
   put sNewNodeID into sLastNodeID
   return sNewNodeID
end TheNewNodeID

on create_node tParams
   local tRelativeToID
   local tPosition
   local tParentID
   local tChildren
   local tNewNodeID
   local tNofChildren
   local tPositionOldID
   local tProcessingNewNode
   local tNewNodeIDs
   local tName
   local tNodeIDsSorted
   local tRefPos
   local tRelativeToNumber
   local tRelativeToName
   local tIdOrName
   
   
   if tParams is not empty
   then
      set the wholematches to true
      -- replace quote with empty in tParams
      if "before node" is in tParams # Example: send "create_node" && "before node ID 1"
      then
         replace "- " with "-" in tParams
         put wordOffset("before",tParams) into tRefPos
            if word 1 of tParams is "ID"
            then
               put word 2 to tRefPos - 1 of tParams into tNewNodeID
               put "ID" && tNewNodeID into tIdOrName
            else
               put TheNewNodeID() into tNewNodeID
               if word 1 of tParams is not "before"
               then
                  put word 1 to tRefPos - 1 of tParams into sNodeDataA[tNewNodeID]["name"]
                  put sNodeDataA[tNewNodeID]["name"] into tIdOrName
               end if
            end if
            if word tRefPos to tRefPos + 2 of tParams is "before node ID"
            then
               put word tRefPos + 3 to - 1 of tParams into tRelativeToID
            else
               if word tRefPos + 2 to - 1 of tParams is an integer
               then
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToNumber
                  put line tRelativeToNumber of sNodeIDs into tRelativeToID
               else
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToName
                  put the ID_of_node_[tRelativeToName] of me into tRelativeToID
               end if
            end if
            if sNodeDataA[tRelativeToID]["number"] is not an integer # Check if Root ID exists.
            then
               answer error "Root Node can not be created." & cr &  "No such Root" && "(" & tRelativeToID & ")."
               exit "create_node"
            end if
            if the effectiveNodeData[tRelativeToID,"parent"] of me is empty
            then
               put lineOffset(tRelativeToID,the rootNodeIDs of me) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "create_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" before word tRefPos of tParams
                  */
               end if
               send "create_node" && tIdOrName && "as root" && tPosition to me
            else
               put the effectiveNodeData[tRelativeToID,"parent"] of me into tParentID
               put the effectiveNodeData[tParentID,"children"] of me into tChildren
               put lineOffset(tRelativeToID,tChildren) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "create_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" before word tRefPos of tParams
               */
            end if
            send "create_node" && tIdOrName && "as child" && tPosition && "of node ID" && tParentID to me
         end if
      end if
      if "after node" is in tParams # Example: send "create_node" && "after node ID 1"
      then
         replace "- " with "-" in tParams
         put wordOffset("after",tParams) into tRefPos
            if word 1 of tParams is "ID"
            then
               put word 2 to tRefPos - 1 of tParams into tNewNodeID
               put "ID" && tNewNodeID into tIdOrName
            else
               put TheNewNodeID() into tNewNodeID
               if word 1 of tParams is not "after"
               then
                  put word 1 to tRefPos - 1 of tParams into sNodeDataA[tNewNodeID]["name"]
                  put sNodeDataA[tNewNodeID]["name"] into tIdOrName
               end if
            end if
            if word tRefPos to tRefPos + 2 of tParams is "after node ID"
            then
               put word tRefPos + 3 to - 1 of tParams into tRelativeToID
            else
               if word tRefPos + 2 to - 1 of tParams is an integer
               then
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToNumber
                  put line tRelativeToNumber of sNodeIDs into tRelativeToID
               else
                  put word tRefPos + 2 to - 1 of tParams into tRelativeToName
                  put the ID_of_node_[tRelativeToName] of me into tRelativeToID
               end if
            end if
            if sNodeDataA[tRelativeToID]["number"] is not an integer # Check if Root ID exists.
            then
               answer error "Root Node can not be created." & cr &  "No such Root" && "(" & tRelativeToID & ")."
               exit "create_node"
            end if
            if the effectiveNodeData[tRelativeToID,"parent"] of me is empty
            then
               put lineOffset(tRelativeToID,the rootNodeIDs of me) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "create_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" after word tRefPos of tParams
                  */
               end if
               send "create_node" && tIdOrName && "as root" && tPosition + 1 to me
            else
               put the effectiveNodeData[tRelativeToID,"parent"] of me into tParentID
               put the effectiveNodeData[tParentID,"children"] of me into tChildren
               put lineOffset(tRelativeToID,tChildren) into tPosition
               if tPosition is not an integer
               then
                  answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
                  exit "create_node"
                  /* # This would allow no position and place it last.
                  put - 1 into tPosition
                  put " -1" after word tRefPos of tParams
               */
            end if
            send "create_node" && tIdOrName && "as child" && tPosition + 1 && "of node ID" && tParentID to me
         end if
      end if
      if "as child" is in tParams # Example: dispatch "create_node" to group "Tree" of me with "as child 7 of node ID 1"
      then
         replace "- " with "-" in tParams
         put wordOffset("child",tParams) into tRefPos
         if word 1 of tParams is "ID"
         then
            put word 2 to tRefPos - 2 of tParams into tNewNodeID
         else
            put TheNewNodeID() into tNewNodeID
            if word 1 of tParams is not "as"
            then
               put word 1 to tRefPos - 2 of tParams into sNodeDataA[tNewNodeID]["name"]
            end if
         end if
         put tNewNodeID into sLastNodeID
         put word tRefPos + 1 of tParams into tPosition
         if tPosition is not an integer
         then
            answer error "Child Node can not be created." & cr &  "Syntax error." & cr & "Child Node has no position." & cr &  "(" & tParams & ")"
            exit "create_node"
            /* # This would allow no position and place it last.
            put - 1 into tPosition
            put " -1" after word tRefPos of tParams
            */
         end if
         if tPosition = 0 then put - 1 into tPosition
         if word tRefPos + 2 to tRefPos + 4 of tParams is "of node ID"
         then
            put word tRefPos + 5 to - 1 of tParams into tRelativeToID
         else
            if word tRefPos + 4 to - 1 of tParams is an integer
            then
               put word tRefPos + 4 to - 1 of tParams into tRelativeToNumber
               put line tRelativeToNumber of sNodeIDs into tRelativeToID
            else
               put word tRefPos + 4 to - 1 of tParams into tRelativeToName
               put the ID_of_node_[tRelativeToName] of me into tRelativeToID
            end if
         end if
         if sNodeDataA[tRelativeToID]["number"] is not an integer # Check if Parent ID exists.
         then
            answer error "Child Node can not be created." & cr &  "No such Parent" && "(" & tRelativeToID & ")."
            exit "create_node"
         end if
         put sNodeDataA[tRelativeToID]["children"] into tChildren
         put the number of lines of tChildren into tNofChildren
         switch
            case tNofChildren = 0
               put tNewNodeID into sNodeDataA[tRelativeToID]["children"]
               break
            case tPosition < 0
               put line tPosition of tChildren into tPositionOldID
               if tPositionOldID is empty
               then
                  put tNewNodeID & cr before line tPosition of sNodeDataA[tRelativeToID]["children"]
               else
                  put cr & tNewNodeID after line tPosition of sNodeDataA[tRelativeToID]["children"]
               end if
               break
            case tPosition = 1
               put tNewNodeID & cr before sNodeDataA[tRelativeToID]["children"]
               break
            case tPosition > tNofChildren
               put cr & tNewNodeID after line tNofChildren of sNodeDataA[tRelativeToID]["children"]
               break
            case tPosition > 1
               put cr & tNewNodeID after line tPosition - 1 of sNodeDataA[tRelativeToID]["children"]
               break
         end switch
      end if
      if "as root" is in tParams # Example: dispatch "create_node" to group "Tree" of me with "as root 2"
      then
         replace "- " with "-" in tParams
         put wordOffset("root",tParams) into tRefPos
         if word 1 of tParams is "ID"
         then
            put word 2 to tRefPos - 2 of tParams into tNewNodeID
         else
            put TheNewNodeID() into tNewNodeID
            if word 1 of tParams is not "as"
            then
               put word 1 to tRefPos - 2 of tParams into sNodeDataA[tNewNodeID]["name"]
            end if
         end if
         put tNewNodeID into sLastNodeID
         put word tRefPos + 1 of tParams into tPosition
         if tPosition is not an integer
         then
            answer error "Root Node can not be created." & cr &  "Syntax error." & cr & "Root Node has no position." & cr &  "(" & tParams & ")"
            exit "create_node"
            /* # This would allow no position and place it last.
            put - 1 into tPosition
            put " -1" after word tRefPos of tParams
            */
         end if
         if tPosition = 0 then put - 1 into tPosition
         switch
            case sRootNodeIDs is empty
               put tNewNodeID into sRootNodeIDs
               break
            case tPosition < - (the number of lines of sRootNodeIDs)
               put tNewNodeID & cr before sRootNodeIDs
               break
            case tPosition < 0
               put cr & tNewNodeID after line tPosition of sRootNodeIDs
               break
            case tPosition > the number of lines of sRootNodeIDs
               put cr & tNewNodeID after sRootNodeIDs
               break
            case tPosition = 1
               put tNewNodeID & cr before sRootNodeIDs
               break
            case tPosition > 1
               put cr & tNewNodeID after line tPosition - 1 of sRootNodeIDs
               break
         end switch
         put sRootNodeIDs into sNodeDataA[0]["children"]
         -- dispatch "newNode" to me with tNewNodeID, the ID of me
         put false into tHandlerBusy
         -- return tNewNodeID
      end if
   end if
   if tParams is empty
   then
      -- put cr & sLastNodeID after sNodeIDs
      -- if character 1 of sNodeIDs is cr then delete character 1 of sNodeIDs
      -- put the number of lines of sNodeIDs into sNodeDataA[sLastNodeID]["number"]
      send "create_node" && "as root - 1" to me
   end if
   -- break
   get TheLocalNodeIDs()
   dispatch "newNode" to me with tNewNodeID, the ID of me
   return sLastNodeID
end create_node

getProp ID_of_the_last_node
   return sLastNodeID
end ID_of_the_last_node

getProp localNodeData[theKeys]
   switch
      case theKeys is empty
         return sNodeDataA
         break
      case the number of items of theKeys is 1
         return sNodeDataA[item 1 of theKeys]
         break
      case the number of items of theKeys is 2
         switch
            case  item 2 of theKeys is "leaf"
               if sNodeDataA[item 1 of theKeys]["children"] is empty then return true else return false
               break
            case  item 2 of theKeys is "depth"
               return TheDepth(item 1 of theKeys)
               break
            case  item 2 of theKeys is "family"
               return TheFamily(item 1 of theKeys)
               break
            case  item 2 of theKeys is "IDpath"
               return TheIDpath(item 1 of theKeys)
               break
            default
               return sNodeDataA[item 1 of theKeys][item 2 of theKeys]
         end switch
         break
      case the number of items of theKeys is 3
         return sNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
         break
   end switch
end localNodeData

setProp localNodeData[theKeys] newNodeData
   -- put the millisec into ms ###
   if the keys of newNodeData[0] is not empty
   then
      repeat for each key tProperty in newNodeData[0]
         set the  tProperty of me to newNodeData[0][tProperty]
      end repeat
      if newNodeData[0]["children"] is not empty then put newNodeData[0]["children"] into sRootNodeIDs
      set the rootNodeIDs of me to sRootNodeIDs
   end if
   switch
      case theKeys is empty
         put newNodeData into sNodeDataA
         break
      case the number of items of theKeys is 1
         repeat for each key tKey in newNodeData
            put newNodeData[tKey] into sNodeDataA[item 1 of theKeys][tKey]
         end repeat
         break
      case the number of items of theKeys is 2
         put newNodeData into sNodeDataA[item 1 of theKeys][item 2 of theKeys]
         switch
            case item 2 of theKeys is "label"
               set the label_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "name"
               set the name_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "styledText"
               set the styledText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "htmlText"
               set the htmlText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "rtfText"
               set the rtfText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "unicodeText"
               set the unicodeText_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "depth"
               set the depth_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "number"
               set the number_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "text" and sNodeDataA[item 1 of theKeys]["htmlText"] is empty
               set the text_of_node_ID_[item 1 of theKeys] of me to newNodeData
               break
            case item 2 of theKeys is "expanded" or item 2 of theKeys is "visible"
               break
            case item 2 of theKeys is "children"
               break
         end switch
         break
      case the number of items of theKeys is 3
         put newNodeData into sNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
         switch
            case item 2 of theKeys is "expanded" or item 2 of theKeys is "visible"
               break
         end switch
         break
   end switch
   -- put the millisec - ms ###
   pass localNodeData
end localNodeData

getProp nodeContainerID_of_node_ID_[tNodeID]
   return sNodeDataA[tNodeID]["nodeContainerID"]
end nodeContainerID_of_node_ID_

getProp nodeData[theKeys]
   if sFirstRun is empty then pass nodeData
   switch
      case theKeys is empty
         return sNodeDataA
         break
      case the number of items of theKeys is 1
         return sNodeDataA[item 1 of theKeys]
         break
      case the number of items of theKeys is 2
         switch
            case  item 2 of theKeys is "leaf"
               if sNodeDataA[item 1 of theKeys]["children"] is empty then return true else return false
               break
            case  item 2 of theKeys is "depth"
               return TheDepth(item 1 of theKeys)
               break
            case  item 2 of theKeys is "family"
               return TheFamily(item 1 of theKeys)
               break
            case  item 2 of theKeys is "IDpath"
               return TheIDpath(item 1 of theKeys)
               break
            default
               return sNodeDataA[item 1 of theKeys][item 2 of theKeys]
         end switch
         break
      case the number of items of theKeys is 3
         return sNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
         break
   end switch
end nodeData

on closeField
   if the long ID of me is not in the long ID of the target
   then
      pass "closeField"
   end if
   if the short name of the target is "nodeText" and the cEditText of stack "rTreeEngine" is false
   then
      set the htmlText_of_node_ID_[ the nodeID of the owner of the target] of me to the htmlText of the target
      set the showborder of the target to false
      set the autoHilite of the target to false
      set the lockText of the target to true
      set the opaque of the target to false
   end if
   pass closeField
end closeField

on exitField
   if the long ID of me is not in the long ID of the target
   then
      pass "exitField"
   end if
   if the short name of the target is "nodeText" and the cEditText of stack "rTreeEngine" is false
   then
      set the htmlText_of_node_ID_[ the nodeID of the owner of the target] of me to the htmlText of the target
      set the showborder of the target to false
      set the autoHilite of the target to false
      set the lockText of the target to true
      set the opaque of the target to false
   end if
   pass exitField
end exitField

getProp effective_NodeData[theKeys]
   send "effectiveNodeData" & "[" & theKeys & "]" to me
end effective_NodeData

getProp effectiveNodeData[theKeys]
   local tProperties
   local tInheritables
   
   -- lock messages
   switch
      case theKeys is empty
         put sNodeDataA into sEffectiveNodeDataA
         union sEffectiveNodeDataA with gNodeDataA
         return sEffectiveNodeDataA
         break
      case the number of items of theKeys is 1
         put sNodeDataA[item 1 of theKeys] into sEffectiveNodeDataA[item 1 of theKeys]
         if the useGlobalData of me is true then union sEffectiveNodeDataA[item 1 of theKeys] with gNodeDataA[item 1 of theKeys]
         put the keys of sEffectiveNodeDataA[item 1 of theKeys] into tProperties
         put "firstIconCollapsed,firstIconExpanded,secondIconCollapsed,secondIconExpanded,thirdIconCollapsed,thirdIconExpanded,fileIcon,depth,IDpath,nodeLine,nodeBehavior" into tInheritables
         replace comma with cr in tInheritables
         put cr & tInheritables after tProperties
         -- filter tProperties without "children"
         
         -- put tProperties ###
         repeat for each line tProperty in tProperties
            put the effectiveNodeData2[theKeys,tProperty] of me into tE[tProperty]
         end repeat
         return tE
         
         /*
         union sNodeDataA[item 1 of theKeys] with gNodeDataA[item 1 of theKeys]
         repeat for each key tkey in sNodeDataA[item 1 of theKeys]
            put tKey into tProperty
            if sNodeDataA[item 1 of theKeys][tKey] is empty
            then
               put the tProperty of me into sNodeDataA[item 1 of theKeys][tKey]
            end if
         end repeat
         return sNodeDataA[item 1 of theKeys]
         */
         
         break
      case the number of items of theKeys is 2
         return the effectiveNodeData2[theKeys] of me
         break
      case the number of items of theKeys is 3
         switch the useGlobalData of me
            case true
               return gNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
               break
            case not true
               return sNodeDataA[item 1 of theKeys][item 2 of theKeys][item 3 of theKeys]
               break
         end switch
         break
   end switch
   -- unlock messages
end effectiveNodeData

getProp effectiveNodeData2[theKeys]
   local tInheritables
   local tValue
   local tProperty
   
   -- lock messages
   put "firstIconCollapsed,firstIconExpanded,secondIconCollapsed,secondIconExpanded,thirdIconCollapsed,thirdIconExpanded,fileIcon,depth,IDpath,nodeLine" into tInheritables
   put sNodeDataA[item 1 of theKeys][item 2 of theKeys] into tValue
   if the useGlobalData of me is true and tValue is empty then put gNodeDataA[item 1 of theKeys][item 2 of theKeys] into tValue
   put item 2 of theKeys into tProperty
   switch
      case tProperty is "number"
         if tValue is empty
         then
            if the useGlobalData of me is true
            then
               put lineOffset(item 1 of theKeys , sNodeIDs) into tValue
            end if
            if the useGlobalData of me is not true
            then
               put lineOffset(item 1 of theKeys , sNodeIDs) into tValue
            end if
         end if
         break
      case  item 2 of theKeys is "leaf"
         if sNodeDataA[item 1 of theKeys]["children"] is empty then return true else return false
         break
      case tProperty is "depth"
         put TheDepth(item 1 of theKeys) into tValue
         break
      case tProperty is "family"
         put TheFamily(item 1 of theKeys) into tValue
         break
      case tProperty is "IDpath"
         put TheIDpath(item 1 of theKeys) into tValue
         break
      case tProperty is "behavior"
         if tValue is empty then put the nodeBehavior of me into tValue
         break
      case tProperty is "expanded"
         -- if tValue is empty then put true into tValue
         break
   end switch
   if tValue is empty and tProperty is among the items of tInheritables then put the tProperty of me into tValue
   put tValue into sEffectiveNodeDataA[item 1 of theKeys][item 2 of theKeys]
   -- unlock messages
   return tValue
   break
   
end effectiveNodeData2

# getProp expanded_of_node_ID_[tNodeID]
   put sNodeDataA[tNodeID]["expanded"] into tValue
   if tValue is empty then put gNodeDataA[tNodeID]["expanded"] into tValue
   return tValue
end expanded_of_node_ID_

getProp expandedNodeIDs
   local tValue
   local tExpandedNodeIDs
   
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         repeat for each key tNodeID in gNodeDataA
            put sNodeDataA[tNodeID]["expanded"] into tValue
            if tValue is empty then put gNodeDataA[tNodeID]["expanded"] into tValue
            if tValue then put tNodeID & cr after tExpandedNodeIDs
         end repeat
         delete character - 1 of tExpandedNodeIDs
         return tExpandedNodeIDs
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         repeat for each key tNodeID in sNodeDataA
            if sNodeDataA[tNodeID]["expanded"] then put tNodeID & cr after tExpandedNodeIDs
         end repeat
         delete character - 1 of tExpandedNodeIDs
         return tExpandedNodeIDs
         break
   end switch
end expandedNodeIDs

getProp leaf_of_node_ID_[tNodeID]
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
            if gNodeDataA[tNodeID]["children"] is empty then return true else return false
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
            if sNodeDataA[tNodeID]["children"] is empty then return true else return false
   end switch
end leaf_of_node_ID_

getProp leafNodeIDs
   local tLeafNodeIDs
   
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         repeat for each key tNodeID in gNodeDataA
            if gNodeDataA[tNodeID]["children"] is empty then put tNodeID & cr after tLeafNodeIDs
         end repeat
         delete character - 1 of tLeafNodeIDs
         return tLeafNodeIDs
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         repeat for each key tNodeID in sNodeDataA
            if sNodeDataA[tNodeID]["children"] is empty then put tNodeID & cr after tLeafNodeIDs
         end repeat
         delete character - 1 of tLeafNodeIDs
         return tLeafNodeIDs
         break
   end switch
end leafNodeIDs

getProp ID_of_node_[tValue]
    local tCounter
    
    if not the dontUseIntegerKeys of me then
        if tValue is an integer and tValue > 0
        then
            if the useGlobalData of me
            then
                return line tValue of sNodeIDs
            else
                return line tValue of sNodeIDs
            end if
        else
            if the useGlobalData of me
            then
                repeat for each line tID in sNodeIDs
                    if gNodeDataA[tID]["name"] is tValue then exit repeat
                    add 1 to tCounter
                end repeat
                if tCounter = the number of lines of sNodeIDs then put empty into tID
                return tID
            else
                repeat for each line tID in sNodeIDs
                    if sNodeDataA[tID]["name"] is tValue then exit repeat
                    add 1 to tCounter
                end repeat
                if tCounter = the number of lines of sNodeIDs then put empty into tID
                return tID
            end if
        end if
    else
        repeat for each line tID in sNodeIDs
            if sNodeDataA[tID]["name"] is tValue then exit repeat
            add 1 to tCounter
        end repeat
        if tCounter = the number of lines of sNodeIDs then put empty into tID
        return tID
    end if
end ID_of_node_

on globalNodeData newNodeData
   put newNodeData into gNodeDataA
   if the keys of newNodeData[0] is not empty
   then
      repeat for each key tProperty in newNodeData[0]
         set the  tProperty of me to newNodeData[0][tProperty]
      end repeat
      if newNodeData[0]["children"] is not empty then put newNodeData[0]["children"] into gRootNodeIDs
      set the globalRootNodeIDs of me to gRootNodeIDs
   end if
end globalNodeData

on nodeData newNodeData
   put newNodeData into sNodeDataA
   if the keys of newNodeData[0] is not empty
   then
      repeat for each key tProperty in newNodeData[0]
         set the  tProperty of me to newNodeData[0][tProperty]
      end repeat
      if newNodeData[0]["children"] is not empty then put newNodeData[0]["children"] into sRootNodeIDs
      set the rootNodeIDs of me to sRootNodeIDs
   end if
end nodeData

function TheNodeIDs tNodeID
   dispatch "startCalculateNodeIDs" to me with the long ID of me
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         get TheGlobalNodeIDs(tNodeID)
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         get TheLocalNodeIDs(tNodeID)
         break
   end switch
end TheNodeIDs

function TheGlobalNodeIDs tNodeID
   local sNodeIDsSorted
   
   put empty into tNumber
   put empty into sNodeIDs
   replace comma with cr in gRootNodeIDs
   repeat for each line tRootNodeID in gRootNodeIDs
      add 1 to tNumber
      if gNodeDataA[tRootNodeID]["name"] is empty then put tRootNodeID into gNodeDataA[tRootNodeID]["name"]
      put tNumber into gNodeDataA[tRootNodeID]["number"]
      put empty into gNodeDataA[tRootNodeID]["parent"]
      put cr & tRootNodeID after sNodeIDs
      get TheGlobalDescendants(tRootNodeID)
   end repeat
   if character 1 of sNodeIDs is cr
   then
      delete character 1 of sNodeIDs
   end if
   put sNodeIDs into sNodeIDsSorted
   sort sNodeIDsSorted numeric descending
   put line 1 of sNodeIDsSorted into sLastNodeID
end TheGlobalNodeIDs

function TheLocalNodeIDs tNodeID
   local sNodeIDsSorted
   
   put empty into tNumber
   put empty into sNodeIDs
   -- if sNodeDataA[0] is not empty then put sNodeDataA[0] into sRootNodeIDs
   replace comma with cr in sRootNodeIDs
   repeat for each line tRootNodeID in sRootNodeIDs
      add 1 to tNumber
      if sNodeDataA[tRootNodeID]["name"] is empty then put tRootNodeID into sNodeDataA[tRootNodeID]["name"]
      put tNumber into sNodeDataA[tRootNodeID]["number"]
      put empty into sNodeDataA[tRootNodeID]["parent"]
      put cr & tRootNodeID after sNodeIDs
      get TheLocalDescendants(tRootNodeID)
   end repeat
   if character 1 of sNodeIDs is cr
   then
      delete character 1 of sNodeIDs
   end if
   put sNodeIDs into sNodeIDsSorted
   sort sNodeIDsSorted numeric descending
   put line 1 of sNodeIDsSorted into sLastNodeID
   break
end TheLocalNodeIDs

function TheGlobalDescendants tNodeID
   replace comma with cr in gNodeDataA[tNodeID]["children"]
   repeat for each line tChildNodeID in gNodeDataA[tNodeID]["children"]
      add 1 to tNumber
      if gNodeDataA[tChildNodeID]["name"] is empty then put tChildNodeID into gNodeDataA[tChildNodeID]["name"]
      put tNumber into gNodeDataA[tChildNodeID]["number"]
      put tNodeID into gNodeDataA[tChildNodeID]["parent"]
      put cr & tChildNodeID after sNodeIDs
      get TheGlobalDescendants(tChildNodeID)
   end repeat
end TheGlobalDescendants

function TheLocalDescendants tNodeID
   replace comma with cr in sNodeDataA[tNodeID]["children"]
   repeat for each line tChildNodeID in sNodeDataA[tNodeID]["children"]
      if tChildNodeID is empty
      then
         next repeat
      end if
      add 1 to tNumber
      if sNodeDataA[tChildNodeID]["name"] is empty then put tChildNodeID into sNodeDataA[tChildNodeID]["name"]
      put tNumber into sNodeDataA[tChildNodeID]["number"]
      put tNodeID into sNodeDataA[tChildNodeID]["parent"]
      put cr & tChildNodeID after sNodeIDs
      get TheLocalDescendants(tChildNodeID)
   end repeat
end TheLocalDescendants

function TheVisibleNodeIDs tNodeID
   dispatch "startCalculateVisibleNodeIDs" to me with the long ID of me
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         get TheGlobalVisibleNodeIDs(tNodeID)
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         get TheLocalVisibleNodeIDs(tNodeID)
         break
   end switch
end TheVisibleNodeIDs

function TheGlobalVisibleNodeIDs tNodeID
   put empty into sVisibleNodeIDs
   put 0 into sNodeLineCounter
   repeat for each line tRootNodeID in gRootNodeIDs
      if sNodeDataA[tRootNodeID]["visible"] is false and the showInvisibleNodes of me is not true
      then
         next repeat
      end if
      add 1 to sNodeLineCounter
      put sNodeLineCounter into sNodeDataA[tRootNodeID]["nodeLine"]
      put cr & tRootNodeID after sVisibleNodeIDs
      get TheGlobalVisibleDescendants(tRootNodeID)
   end repeat
   if character 1 of sVisibleNodeIDs is cr
   then
      delete character 1 of sVisibleNodeIDs
   end if
end TheGlobalVisibleNodeIDs

function TheLocalVisibleNodeIDs tNodeID
   put empty into sVisibleNodeIDs
   put 0 into sNodeLineCounter
   repeat for each line tRootNodeID in sRootNodeIDs
      if sNodeDataA[tRootNodeID]["visible"] is false and the showInvisibleNodes of me is not true
      then
         next repeat
      end if
      add 1 to sNodeLineCounter
      put sNodeLineCounter into sNodeDataA[tRootNodeID]["nodeLine"]
      put cr & tRootNodeID after sVisibleNodeIDs
      get TheLocalVisibleDescendants(tRootNodeID)
   end repeat
   if character 1 of sVisibleNodeIDs is cr
   then
      delete character 1 of sVisibleNodeIDs
   end if
end TheLocalVisibleNodeIDs

function TheVisibleDescendants tNodeID
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         get TheGlobalVisibleDescendants(tNodeID)
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         get TheLocalVisibleDescendants(tNodeID)
         break
   end switch
end TheVisibleDescendants

function TheGlobalVisibleDescendants tNodeID
   if sNodeDataA[tNodeID]["expanded"] is false
   then
      exit TheGlobalVisibleDescendants
   end if
   replace comma with cr in gNodeDataA[tNodeID]["children"]
   repeat for each line tChildNodeID in gNodeDataA[tNodeID]["children"]
      if sNodeDataA[tChildNodeID]["visible"] is empty
      then
         put gNodeDataA[tChildNodeID]["visible"] into sNodeDataA[tChildNodeID]["visible"]
      end if
      if tChildNodeID is empty or sNodeDataA[tChildNodeID]["visible"] is false and the showInvisibleNodes of me is not true
      then
         next repeat
      end if
      add 1 to sNodeLineCounter
      put sNodeLineCounter into sNodeDataA[tChildNodeID]["nodeLine"]
      put cr & tChildNodeID after sVisibleNodeIDs
      if sNodeDataA[tChildNodeID]["expanded"] is empty
      then
         put gNodeDataA[tChildNodeID]["expanded"] into sNodeDataA[tChildNodeID]["expanded"]
      end if
      if sNodeDataA[tChildNodeID]["expanded"] is false
      then
         next repeat
      end if
      get TheGlobalVisibleDescendants(tChildNodeID)
   end repeat
end TheGlobalVisibleDescendants

function TheLocalVisibleDescendants tNodeID
   if sNodeDataA[tNodeID]["expanded"] is false
   then
      exit TheLocalVisibleDescendants
   end if
   replace comma with cr in sNodeDataA[tNodeID]["children"]
   repeat for each line tChildNodeID in sNodeDataA[tNodeID]["children"]
      if tChildNodeID is empty or sNodeDataA[tChildNodeID]["visible"] is false and the showInvisibleNodes of me is not true
      then
         next repeat
      end if
      add 1 to sNodeLineCounter
      put sNodeLineCounter into sNodeDataA[tChildNodeID]["nodeLine"]
      put cr & tChildNodeID after sVisibleNodeIDs
      if sNodeDataA[tChildNodeID]["expanded"] is false
      then
         next repeat
      end if
      get TheLocalVisibleDescendants(tChildNodeID)
   end repeat
end TheLocalVisibleDescendants

function TheIDpath tNodeID
   local tParent
   local tIDpath
   
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         put gNodeDataA[tNodeID]["parent"] into tParent
         put tNodeID into tParent
         repeat until tParent is empty -- not an integer
            put tParent & cr before tIDpath
            put gNodeDataA[tParent]["parent"] into tParent
         end repeat
         return tIDpath
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         put sNodeDataA[tNodeID]["parent"] into tParent
         put tNodeID into tIDpath
         repeat until tParent is empty -- not an integer
            put tParent & cr before tIDpath
            put sNodeDataA[tParent]["parent"] into tParent
         end repeat
         return tIDpath
         break
   end switch
end TheIDpath

function TheFamily tNodeID
      put tNodeID into sFamily
      get TheFamilyDescendants(tNodeID)
      return sFamily
end TheFamily

function TheFamilyDescendants tNodeID
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         replace comma with cr in gNodeDataA[tNodeID]["children"]
         repeat for each line tChildNodeID in gNodeDataA[tNodeID]["children"]
            if tChildNodeID is empty
            then
               next repeat
            end if
            put cr & tChildNodeID after sFamily
            get TheFamilyDescendants(tChildNodeID)
         end repeat
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         replace comma with cr in sNodeDataA[tNodeID]["children"]
         repeat for each line tChildNodeID in sNodeDataA[tNodeID]["children"]
            if tChildNodeID is empty
            then
               next repeat
            end if
            put cr & tChildNodeID after sFamily
            get TheFamilyDescendants(tChildNodeID)
         end repeat
         break
   end switch
end TheFamilyDescendants

function TheDepth tNodeID
   local tParent
   local tDepth
   
   switch
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         put gNodeDataA[tNodeID]["parent"] into tParent
         repeat until tParent is empty -- not an integer
            add 1 to tDepth
            put gNodeDataA[tParent]["parent"] into tParent
         end repeat
         return tDepth
         break
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         put sNodeDataA[tNodeID]["parent"] into tParent
         put 0 into tDepth
         repeat until tParent is empty
            add 1 to tDepth
            put sNodeDataA[tParent]["parent"] into tParent
         end repeat
         return tDepth
         break
   end switch
end TheDepth

function rTree_prevSibling pTree, pNode, pSetHilite
   local tData
   local tIDPath,tParent,tSiblings,tPosition,tPreviousSibling
   put the idPath_of_node_id_[pNode] of pTree into tIDPath
   put line -2 of tIDPath into tParent
   put the nodeData[tParent] of pTree into tData
   put tData["children"] into tSiblings
   put lineOffset(pNode,tSiblings) into tPosition
   if tPosition=1 then
      return empty
   end if
   put line tPosition -1 of tSiblings into tPreviousSibling
   if pSetHilite then
      set the hilitedNodeIDs of pTree to tPreviousSibling
   end if
   return tPreviousSibling
end rTree_prevSibling

function rTree_nextSibling pTree, pNode,pSetHilite
   local tData
   local tIDPath,tParent,tSiblings,tPosition,tNextSibling
   put the idPath_of_node_id_[pNode] of pTree into tIDPath
   put line -2 of tIDPath into tParent
   put the nodeData[tParent] of pTree into tData
   put tData["children"] into tSiblings
   put lineOffset(pNode,tSiblings) into tPosition
   if tPosition=the number of lines of tSiblings then
      return empty
   end if
   put line tPosition +1 of tSiblings into tNextSibling
   if pSetHilite then
      set the hilitedNodeIDs of pTree to tNextSibling
   end if
   return tNextSibling
end rTree_nextSibling

on delete_globalNodeData
   -- local sHilitedNodeIDs
   
   -- set the customPropertySets of me to empty
   put empty into gRootNodeIDs
   put empty into gNodeDataA
   put empty into sNodeIDs
   put empty into sLastNodeID
   put empty into sHilitedNodeIDs
   put empty into sVisibleNodeIDs
   set the globalRootNodeIDs of me to empty
   set the globalNodeData of me to empty
   set the nodeIDs of me to empty
   set the lastNodeID of me to empty
   set the visibleNodeIDs of me to empty
   set the hilitedNodeIDs of me to empty
end delete_globalNodeData

on delete_nodeData
   -- set the customPropertySets of me to empty
   put empty into sRootNodeIDs
   put empty into sNodeDataA
   put empty into sNodeIDs
   put empty into sLastNodeID
   put empty into sHilitedNodeIDs
   put empty into sVisibleNodeIDs
   set the rootNodeIDs of me to empty
   set the nodeData of me to empty
   set the nodeIDs of me to empty
   set the lastNodeID of me to empty
   set the visibleNodeIDs of me to empty
   set the hilitedNodeIDs of me to empty
   -- send "delete_nodeContainers" to me
   break
end delete_nodeData

on delete_allNodeData
   send "delete_nodeData" to me
   send "delete_globalNodeData" to me
   put empty into sRootNodeIDs
   put empty into sNodeDataA
   put empty into gRootNodeIDs
   put empty into gNodeDataA
end delete_allNodeData

on delete_globalTreeData
   send "delete_globalNodeData" to me
   set the customProperties of me to empty
end delete_globalTreeData

on delete_treeData
   send "delete_nodeData" to me
   set the customProperties of me to empty
end delete_treeData

on delete_allTreeData
   send "delete_allNodeData" to me
   set the customProperties of me to empty
   set the customPropertySets of me to empty
end delete_allTreeData

on delete_nodeContainers
   local tGroupsToDelete
   
   lock screen
   lock messages
   -- set the lockLoc of me to true
   repeat for each line tContainerID in the nodeContainerIDs of me
      if there is a control id tContainerID of me then delete control id tContainerID of me
   end repeat
   repeat with i = 1 to the number of groups of me
      if word 1 of the short name of grp i of me is "nodeContainer" then put the long id of grp i of me & cr after tGroupsToDelete
   end repeat
   repeat for each line tGroupToDelete in tGroupsToDelete
      delete tGroupToDelete
   end repeat
   put empty into tNodeContainerIDs
   set the nodeContainerIDs of me to empty
   unlock messages
   unlock screen
end delete_nodeContainers

on dragDrop
   local tLongMouseControlID
   local tLineNum
   local tBelowNodeID
   local tAboveNodeID
   local tSide
   local tLongDragStartControlID
   local tStack
   local tLongTreeIDs
   local tGlobalDrag
   local tIDpath
   local tClickNodeID
   local tDropNodeID
   local tParentNodeID
   local tPosition
   if the long ID of me is in the long ID of the target
   then
      lock screen
      -- switched from owner of the mouseControl to the owner of the target to avoid havoc if the mouse has been moved MB
      dispatch "nodeUp" to the target with 1 , the nodeID of the owner of the target , the ID of me
      put true into tHandlerBusy
      put the long ID of the mouseControl into tLongMouseControlID
      set the wholeMatches to true
      put false into tBetweenNodes
      put (lineOffset(the nodeID of the owner of the target , sVisibleNodeIDs)) into tLineNum
      if the mouseV - the top of the owner of the target < the betweenNodesDelta of me
      then
         put line tLineNum of the visibleNodeIDs of me into tBelowNodeID
         put line tLineNum -1 of the visibleNodeIDs of me into tAboveNodeID
         put true into tBetweenNodes
         put "below" into tSide
      end if
      if the bottom of the owner of the target - the mouseV < the betweenNodesDelta of me
      then
         put line tLineNum + 1 of the visibleNodeIDs of me into tBelowNodeID
         put line tLineNum of the visibleNodeIDs of me into tAboveNodeID
         put true into tBetweenNodes
         put "above" into tSide
      end if
      put the LongDragStartControlID of stack "rTreeEngine" into tLongDragStartControlID
      dispatch "dragNodeDrop" to the target with the nodeID of the owner of the target , the nodeID of tLongMouseControlID , the ID of me
      repeat for each line tStack in revLoadedStacks("application")
         repeat with i = 1 to the number of cards of stack tStack
            repeat for each line tGroup in the groupIDs of card i of stack tStack
               if the behavior of group id tGroup of card i of stack tStack is "button id 2135 of stack" && quote & "rTreeEngine" & quote
               then
                  put the long id of group id tGroup of card i of stack tStack & cr after tLongTreeIDs
               end if
            end repeat
         end repeat
      end repeat
      if character -1 of tLongTreeIDs is cr then delete character -1 of tLongTreeIDs
      if item 2 of the dragData is not among the lines of tLongTreeIDs
      then
         if the mouseNode of me is empty
         then
            send "new_node" && "as root -1" to me
         else
            send "new_node" && "as child -1 of node ID" && the mouseNode of me to me
         end if
         switch
            case the useGlobalData of me is true
               put the dragData into gNodeDataA[the lastNodeID of me]["sourcePath"]
               set the itemDelimiter to slash
               put item -1 of the dragData into gNodeDataA[the lastNodeID of me]["label"]
               set the itemDelimiter to comma
               send "scan_node_ID" && the lastNodeID of me to me
               break
            case the useGlobalData of me is not true
               put the dragData into sNodeDataA[the lastNodeID of me]["sourcePath"]
               set the itemDelimiter to slash
               put item -1 of the dragData into sNodeDataA[the lastNodeID of me]["label"]
               set the itemDelimiter to comma
               send "scan_node_ID" && the lastNodeID of me to me
               break
         end switch
      end if
      if there is a the dragSource
      then
         if the long ID of me is not tLongDragStartControlID and the behavior of the owner of the dragSource is "button id 2135 of stack" && quote & "rTreeEngine" & quote and the useGlobalData of me is true
         then
            put true into tGlobalDrag
         end if
      end if
      if (the tDrag of stack "rTreeEngine" is true and the long ID of me is tLongDragStartControlID) or tGlobalDrag is true # Drag & Drop Nodes within the same Tree or in global trees.
      then
         put TheIDpath(the nodeID of the owner of tLongMouseControlID) into tIDpath
         replace cr with comma in tIDpath
         if the clickNode of tLongDragStartControlID is not among the items of tIDpath # Prevent drop inside family.
         then
            switch
               case the short name of the target is "backgroundField"
                  if the mouseV - the top of me < the topMargin of me
                  then
                     send "move_node" && "ID" && the clickNode of tLongDragStartControlID && "as root" && 1 to me
                  else
                     send "move_node" && "ID" && the clickNode of tLongDragStartControlID && "as root" && -1 to me
                  end if
                  break
               case tBetweenNodes is not true
                  send "move_node" && "ID" && the clickNode of tLongDragStartControlID && "as child -1 of node ID" && the nodeID of the owner of tLongMouseControlID to me
                  break
               case tBetweenNodes is true
                  put the clickNode of tLongDragStartControlID into tClickNodeID
                  put the nodeID of the owner of tLongMouseControlID into tDropNodeID
                  put the effectiveNodeData[tDropNodeID,"parent"] of me into tParentNodeID
                  if tParentNodeID is not empty
                  then
                     switch
                        case (the effectiveNodeData[tDropNodeID,"expanded"] of me is true or the effectiveNodeData[tDropNodeID,"expanded"] of me is empty) and the effectiveNodeData[tDropNodeID,"children"] of me is not empty
                           send "move_node" && "ID" && tClickNodeID && "as child 1 of node ID" && the nodeID of the owner of tLongMouseControlID to me
                           break
                        case TheDepth(tDropNodeID) = TheDepth(tBelowNodeID) and tDropNodeID is line -2 of the effectiveNodeData[tParentNodeID,"children"] of me 
                           send "move_node" && "ID" && tClickNodeID && "as child -2 of node ID" && tParentNodeID to me
                           break
                        case TheDepth(tDropNodeID) = TheDepth(tBelowNodeID) and tDropNodeID is line -1 of the effectiveNodeData[tParentNodeID,"children"] of me
                           send "move_node" && "ID" && tClickNodeID && "as child -2 of node ID" && tParentNodeID to me
                           break
                        case TheDepth(tDropNodeID) <> TheDepth(tBelowNodeID) and tDropNodeID is line -1 of the effectiveNodeData[tParentNodeID,"children"] of me
                           send "move_node" && "ID" && tClickNodeID && "as child -1 of node ID" && tParentNodeID to me
                           break
                        case TheDepth(tDropNodeID) = TheDepth(tBelowNodeID)
                           put lineOffset(tBelowNodeID,the effectiveNodeData[tParentNodeID,"children"] of me) into tPosition
                           send "move_node" && "ID" && tClickNodeID && "as child" && tPosition && "of node ID" && tParentNodeID to me
                           break
                     end switch
                  end if
                  if tParentNodeID is empty
                  then
                     put lineOffset(tDropNodeID,sRootNodeIDs) + 1 into tPosition
                     switch
                        case tSide is "above"
                           
                           break
                        case tSide is "below"
                           subtract 1 from tPosition
                           break
                     end switch
                     send "move_node" && "ID" && tClickNodeID && "as root" && tPosition to me
                  end if
                  break
            end switch
            set the tDragNodeStart of stack "rTreeEngine" to false
            set the tDrag of stack "rTreeEngine" to false
            set the LongDragStartControlID of stack "rTreeEngine" to empty
            send "renderTree" to tLongDragStartControlID
         end if
      end if
      if tLongDragStartControlID is not empty # Drag and Drop into another rTree control
      then
         if the long ID of me is not tLongDragStartControlID and the behavior of tLongDragStartControlID is "button id 2135 of stack" && quote & "rTreeEngine" & quote and the useGlobalData of me is not true
         then
            put TheNewNodeID() into sLastNodeID
            if the dontChangeNodeIDs of me is true
            then
               put the clickNode of tLongDragStartControlID into sLastNodeID
            end if
            switch
               case the short name of the target is "backgroundField"
                  if the mouseV - the top of me < the topMargin of me
                  then
                     send "move_node" && "ID" && sLastNodeID && "as root" && "1" to me
                  else
                     send "move_node" && "ID" && sLastNodeID && "as root" && "-1" to me
                  end if
                  break
               case tBetweenNodes is not true
                  send "move_node" && "ID" && sLastNodeID && "as child -1 of node ID" && the nodeID of the owner of tLongMouseControlID to me
                  break
               case tBetweenNodes is true
                  put the nodeID of the owner of tLongMouseControlID into tDropNodeID
                  put the effectiveNodeData[tDropNodeID,"parent"] of me into tParentNodeID
                  if tParentNodeID is not empty
                  then
                     switch
                        case (the effectiveNodeData[tDropNodeID,"expanded"] of me is true or the effectiveNodeData[tDropNodeID,"expanded"] of me is empty) and the effectiveNodeData[tDropNodeID,"children"] of me is not empty
                           send "move_node" && "ID" && sLastNodeID && "as child 1 of node ID" && the nodeID of the owner of tLongMouseControlID to me
                           break
                        case TheDepth(tDropNodeID) = TheDepth(tBelowNodeID) and tDropNodeID is line -2 of the effectiveNodeData[tParentNodeID,"children"] of me
                           send "move_node" && "ID" && sLastNodeID && "as child -2 of node ID" && tParentNodeID to me
                           break
                        case TheDepth(tDropNodeID) = TheDepth(tBelowNodeID) and tDropNodeID is line -1 of the effectiveNodeData[tParentNodeID,"children"] of me
                           send "move_node" && "ID" && sLastNodeID && "as child -2 of node ID" && tParentNodeID to me
                           break
                        case TheDepth(tDropNodeID) <> TheDepth(tBelowNodeID) and tDropNodeID is line -1 of the effectiveNodeData[tParentNodeID,"children"] of me
                           send "move_node" && "ID" && sLastNodeID && "as child -1 of node ID" && tParentNodeID to me
                           break
                        case TheDepth(tDropNodeID) = TheDepth(tBelowNodeID)
                           put lineOffset(tBelowNodeID,the effectiveNodeData[tParentNodeID,"children"] of me) into tPosition
                           send "move_node" && "ID" && sLastNodeID && "as child" && tPosition && "of node ID" && tParentNodeID to me
                           break
                     end switch
                  end if
                  if tParentNodeID is empty
                  then
                     put lineOffset(tBelowNodeID,sRootNodeIDs) into tPosition
                     if tPosition is 0 or tPosition is empty
                     then
                        put "-1" into tPosition
                     end if
                     send "move_node" && "ID" && sLastNodeID && "as root" && tPosition to me
                  end if
                  break
            end switch
            get TheDropNodes(line 1 of the hilitedNodeIDs of tLongDragStartControlID)
            set the hilitedNodeID of me to tMouseUpNodeID
            dispatch "renderTree" to me
            if the commandKey is not down and the copyBetweenTrees of tLongDragStartControlID is not true
            then
               dispatch "delete_node_ID" to tLongDragStartControlID with the hilitedNodeIDs of tLongDragStartControlID
               dispatch "renderTree" to tLongDragStartControlID
            end if
            set the LongDragStartControlID of stack "rTreeEngine" to empty
            exit dragDrop
         end if
      end if
      dispatch "renderTree" to me
      set the LongDragStartControlID of stack "rTreeEngine" to empty
      put false into tHandlerBusy
      unlock screen
   end if
   -- set the lockLoc of me to true
   set the visible of control "dragIndicator" of me to false
   pass dragDrop
end dragDrop

on dragEnd
   if the long ID of me is not in the long ID of the target
   then
      pass "dragEnd"
   end if
   set the visible of graphic "dragIndicator" of me to false
   pass dragEnd
end dragEnd

function TheDropNodes tNodeID
   
   /*
   add 1 to sLastNodeID
   put cr & sLastNodeID after sNodeDataA[the nodeID of the owner of the mouseControl]["children"]
   if character 1 of sNodeDataA[the nodeID of the owner of the mouseControl]["children"] is cr
   then
      delete character 1of sNodeDataA[the nodeID of the owner of the mouseControl]["children"]
   end if
   */
   
   get TheDropNodeDescendants(tNodeID)
end TheDropNodes

function TheDropNodeDescendants tNodeID
   local tParentID
   
   put sLastNodeID into tParentID
   put the nodeData[tNodeID] of the LongDragStartControlID of stack "rTreeEngine" into sNodeDataA[tParentID]
   put empty into sNodeDataA[tParentID]["children"]
   repeat for each line tChildNodeID in the nodeData[tNodeID,"children"] of the LongDragStartControlID of stack "rTreeEngine"
      if tChildNodeID is empty then next repeat
      -- add 1 to sLastNodeID
      put TheNewNodeID() into sLastNodeID
      put the nodeData[tChildNodeID] of the LongDragStartControlID of stack "rTreeEngine" into sNodeDataA[the lastNodeID of me]
      put empty into sNodeDataA[the lastNodeID of me]["children"]
      put cr & the lastNodeID of me after sNodeDataA[tParentID]["children"]
      get TheDropNodeDescendants(tChildNodeID)
   end repeat
end TheDropNodeDescendants

on dragEnter
   local sDragEnter
   
   if the long ID of me is in the long ID of the target
   then
      put true into sDragEnter
      -- put the long ID of me ###
      -- focus the target
      if "rTreeEngine" is not among the lines of the openStacks
      then
         open invisible stack "rTreeEngine"
      end if
      if word 1 of the target is "field"
      then
         set the lockText of the target to true
         if the short name of the target is not "backgroundField" then set the listBehavior of the target to true
         if there is a control "editIndicator" of me then set the visible of control "editIndicator" of me to false
      end if
   end if
   pass dragEnter
end dragEnter

on dragStart
   local tSelectedNodeID
   local tHilitedIds
   local tTestDragData
   -- put the name of the target ###
   if the long ID of me is in the long ID of the target and the short name of the target is not "backgroundfield"
   then
      if the nodeID of the owner of the target is the clickNode of me
      then
         dispatch "dragNodeStart" to the target with tSelectedNodeID , the ID of me
         if the commandKey is down
         then
            put the hilitedNodeIDs of me into tHilitedIds
            put cr & the clickNode of me after tHilitedIds
            if character 1 of tHilitedIds is cr then delete character 1 of tHilitedIds
            -- set the hilitedNodeIDs of me to tHilitedIds
            set the hilitedNodeIDs of me to tHilitedIds
         end if
         set the LongDragStartControlID of stack "rTreeEngine" to the long ID of me
         if it is "handled"
         then
            set the tDrag of stack "rTreeEngine" to false
            set the tDragNodeStart of stack "rTreeEngine" to false
         else
            # Patch with thanks to Malte! 120325
            put the dragData is not empty into tTestDragData
            repeat for each item theItem in "text,html,rtf,image,unicode,files,styles,private"
               if the dragData[theItem] is not empty then put true into tTestDragData
            end repeat
            if  not tTestDragData then
               set the dragData to the clickNode of me & comma & the long ID of me
            end if
            # End patch
            -- put the dragData ###
            -- set the dragData to the clickNode of me & comma & the long ID of me
            set the tDragNodeStart of stack "rTreeEngine" to true
            if there is a control "nodeText" of the owner of the target
            then
               if the lockText of control "nodeText" of the owner of the target is true then set the tDrag of stack "rTreeEngine" to true
            end if
            if "cell" is in the name of the target
            then
               if the lockText of control "cell" of the owner of the target is true then set the tDrag of stack "rTreeEngine" to true
            end if
            
         end if
         pass dragStart
      end if
   end if
   pass dragStart
end dragStart

on dragLeave
  if there is a grc "dragIndicator" of me then
     set the visible of grc "dragIndicator" of me to false
  end if
  pass "dragLeave"
end dragLeave

on dragMove pMouseH, pMouseV
    local tDropNodeID
    local tMouseTopDelta
    local tMouseBottomDelta
    local tDragData
    local tHeight
    
    if the long ID of me is in the long ID of the target
    then
        set the mouseNode of me to the nodeID of the owner of the target
        set the dragAction to "move"
        set the enabled of control "dragIndicator" of me to false
        if the betweenNodesDelta of me is empty then set the betweenNodesDelta of me to 4
        put false into tBetweenNodes
        if the mouseV - the top of the owner of the target < the betweenNodesDelta of me
        then
            set the rectangle of control "dragIndicator" of me to the topLeft of the owner of the target , the topRight of the owner of the target
            put true into tBetweenNodes
        end if
        if the bottom of the owner of the target - the mouseV < the betweenNodesDelta of me
        then
            set the rectangle of control "dragIndicator" of me to the bottomLeft of the owner of the target , the bottomRight of the owner of the target
            put true into tBetweenNodes
        end if
        if tBetweenNodes is false
        then
            set the rectangle of control "dragIndicator" of me to the rectangle of the owner of the target
        end if
        if the useDragIndicator of me is not false
        then
            set the visible of control "dragIndicator" of me to true
        end if
        put the nodeID of the owner of the target into tDropNodeID
        put the mouseV - the top of me into tMouseTopDelta
        put the bottom of me - the mouseV into tMouseBottomDelta
        if the mouseV < the top of me + 32
        then
            wait 0 millisec with messages
            send "dragScrollUp" to me in 500 millisec 
        end if
        put 0 into tHeight
        if the visible of sb "horizontalScrollbar" is true
        then
            put the height of sb "horizontalScrollbar" into tHeight
        end if
        if the mouseV > the bottom of me - 32 - tHeight
        then
            wait 0 millisec with messages
            send "dragScrollDown" to me in 500 millisec
        end if
    end if
    pass dragMove
end dragMove

on dragScrollUp
    local tThumbPosition
    local tMouseTopDelta
    
    if the mouseH < the left of me or the mouseH > the right of me then exit dragScrollUp
    
    put the mouseV - the top of me into tMouseTopDelta
    put the thumbposition of scrollbar "VerticalScrollbar" of me into tThumbPosition
    if the mouse is down and tMouseTopDelta < 32 and tThumbPosition > 0
    then
        set the thumbposition of scrollbar "VerticalScrollbar" of me to the thumbposition of scrollbar "VerticalScrollbar" of me - 1
        send "dragScrollUp" to me in 200 millisec
    end if
end dragScrollUp

on dragScrollDown
    local tThumbPosition
    local tThumbSize
    local tEndValue
    local tMouseBottomDelta
    
    if the mouseH < the left of me or the mouseH > the right of me then exit dragScrollDown
    
    put the bottom of me - the mouseV into tMouseBottomDelta
    put the thumbposition of scrollbar "VerticalScrollbar" of me into tThumbPosition
    put the thumbSize of scrollbar "VerticalScrollbar" of me into tThumbSize
    put the endvalue of scrollbar "VerticalScrollbar" of me into tEndValue
    if the mouse is down and tMouseBottomDelta > 0 and tMouseBottomDelta < 32 and tThumbPosition + tThumbSize < tEndValue
    then
        set the thumbposition of scrollbar "VerticalScrollbar" of me to the thumbposition of scrollbar "VerticalScrollbar" of me + 1
        send "dragScrollDown" to me in 200 millisec
    end if
end dragScrollDown


on delete_node theNodeIDs
   if word 1 of theNodeIDs is "id" then delete word 1 of theNodeIDs
   send "delete_node_ID" && theNodeIDs to me
end delete_node

on delete_node_ID theNodeIDs
   local ms
   put the millisec into ms ###
   local tParentID
   local tChildPos
   local tRootPos
   dispatch "deleteNode" to me with theNodeIDs
   
   set the wholematches to true
   replace cr with comma in theNodeIDs
   switch
      
      /*
      case gRootNodeIDs is not empty and the useGlobalData of me is not empty and the useGlobalData of me is not false
         repeat for each item tNodeID in theNodeIDs
            put empty into sHilitedA[tNodeID]
            put gNodeDataA[tNodeID]["parent"] into tParentID
            switch
               case tParentID is not empty
                  put lineOffset(tNodeID , gNodeDataA[tParentID]["children"]) into tChildPos
                  if line tChildPos of gNodeDataA[tParentID]["children"] is tNodeID
                  then
                     delete line tChildPos of gNodeDataA[tParentID]["children"]
                  end if
                  break
               case tParentID is empty
                  put lineOffset(tNodeID , gRootNodeIDs) into tRootPos
                  if line tRootPos of gRootNodeIDs is tNodeID
                  then
                     delete line tRootPos of gRootNodeIDs
                  end if
                  break
            end switch
            delete variable gNodeDataA[tNodeID]
         end repeat
         break
         */
         
      case the useGlobalData of me is empty or the useGlobalData of me is false or gRootNodeIDs is empty
         
         repeat for each item tNodeID in theNodeIDs
            put empty into sHilitedA[tNodeID]
            put sNodeDataA[tNodeID]["parent"] into tParentID
            switch
               case tParentID is not empty
                  put lineOffset(tNodeID , sNodeDataA[tParentID]["children"]) into tChildPos
                  if line tChildPos of sNodeDataA[tParentID]["children"] is tNodeID
                  then
                     delete line tChildPos of sNodeDataA[tParentID]["children"]
                  end if
                  break
               case tParentID is empty
                  put lineOffset(tNodeID , sRootNodeIDs) into tRootPos
                  if line tRootPos of sRootNodeIDs is tNodeID
                  then
                     delete line tRootPos of sRootNodeIDs
                  end if
                  break
            end switch
            repeat for each line tID in TheFamily(tNodeID)
               delete variable sNodeDataA[tID]
            end repeat
         end repeat
         break
   end switch
   put sRootNodeIDs into sNodeDataA["0"]["children"]
   set the rootNodeIDs of me to sRootNodeIDs
   -- put "deleted" && the millisec - ms ###
end delete_node_ID

function TheHilitedNodeIDsSorted tIDs
   local tSortedIDs
   local tHilitedNodeIDs
   replace comma with cr in tIDs
   repeat for each line tID in tIDs
      put sNodeDataA[tID]["number"] & comma & tID & cr after tSortedIDs
   end repeat
   delete char - 1 of tSortedIDs
   sort tSortedIDs numeric
   repeat for each line tID in tSortedIDs
      put item 2 of tID & cr after tHilitedNodeIDs
   end repeat
   delete char - 1 of tHilitedNodeIDs
   -- return tHilitedNodeIDs
   set the hilitedNodeIDs of me to tHilitedNodeIDs
end TheHilitedNodeIDsSorted

setProp hilitedNodeIDs theHilitedNodeIDs
   local tHilitedID,tIDs
   local tItems
   local tHilitedLineNum
   local tThumbPos
   local tInView
   local tNodeLine
   local tDescription
   local tLine
   local tChunk
   local theOldHilitedNodeIDs
   local theNewHilitedNodeIDs
   local tSortedIDs
   local tNumberOfLines
   local tHilitedNodeIDs,tNumOfLines
   if the long ID of me is in the long ID of the target
   then
      lock screen
      if sHilitedNodeIDsSorted is not true
      then
         put theHilitedNodeIDs into tIDs
         replace comma with cr in tIDs
         repeat for each line tID in tIDs
            put sNodeDataA[tID]["number"] & comma & tID & cr after tSortedIDs
         end repeat
         delete char - 1 of tSortedIDs
         sort tSortedIDs numeric
         repeat for each line tID in tSortedIDs
            put item 2 of tID & cr after tHilitedNodeIDs
         end repeat
         delete char - 1 of tHilitedNodeIDs
         put true into sHilitedNodeIDsSorted
         filter tHilitedNodeIDs without empty
         if char -1 of tHilitedNodeIDs=cr then delete char -1 of tHilitedNodeIDs
         set the hilitedNodeIDs of me to tHilitedNodeIDs
      end if
      put false into sHilitedNodeIDsSorted
      put the hilitedNodeIDs of me into theOldHilitedNodeIDs
      put theHilitedNodeIDs into theNewHilitedNodeIDs
      replace cr with comma in theHilitedNodeIDs
      put empty into sHilitedA
      repeat for each item tNodeID in theHilitedNodeIDs
         put true into sHilitedA[tNodeID]
      end repeat
      # Navigate to hilited.
      
      if tHandlerBusy is not true
      then
         if the expandOnHilite of me is not false and tHandlerBusy is not true
         then
            put item 1 of theHilitedNodeIDs into tHilitedID
            put line 1 to - 2 of TheIDpath(tHilitedID) into tItems
            repeat for each line tItem in tItems
               put true into sNodeDataA[tItem]["expanded"]
            end repeat
            get TheVisibleNodeIDs()
            set the visibleNodeIDs of me to sVisibleNodeIDs
            if sVisibleNodeIDs is not empty and sAverageLineHeight > 0 and tHilitedID is not among the lines of the shownNodeIDs of me
            then
               send "calibrateScrollbar" to me
               put sNodeDataA[tHilitedID]["formattedHeight"] / sAverageLineHeight into tNumOfLines
               put (sNodeDataA[tHilitedID]["formattedBottom"] / sAverageLineHeight) - tNumOfLines into tThumbPos
                set the thumbposition of scrollbar "VerticalScrollbar" of me to tThumbPos
            end if
         end if
      end if
      # END Navigate to hilited.
      repeat for each line tNodeContainerID in the nodeContainerIDs of me
         set the backgroundColor of control "nodeBackground" of control ID tNodeContainerID of me to empty
         put the nodeID of control ID tNodeContainerID of me into tNodeID
         if tNodeID is among the items of theHilitedNodeIDs
         then
            set the opaque of control "nodeBackground" of control ID tNodeContainerID of me to true
            if the hiliteColor of control "nodeBackground" of control ID tNodeContainerID of me is empty
            then
               set the backgroundColor of control "nodeBackground" of control ID tNodeContainerID of me to the hiliteColor of me
            end if
         end if
      end repeat
      send "hilitedNodeIDsChanged" && theOldHilitedNodeIDs,theNewHilitedNodeIDs to me in 1 millisec
      unlock screen
   end if
   put false into tHandlerBusy
   pass hilitedNodeIDs
end hilitedNodeIDs

getProp hilitedNodeIDs
   -- local tIDs
   
   -- put the hilitedNodeIDs of me into tIDs
   -- replace cr with comma in tIDs
   -- sort tIDs numeric
   -- return TheHilitedNodeIDsSorted(tIDs)
   pass "hilitedNodeIDs"
end hilitedNodeIDs

getProp lastNodeID
   return sLastNodeID
   -- pass lastNodeID
end lastNodeID

on render_Tree
   send "renderTree" to me
end render_Tree

on renderTree
   put true into sRenderingTree
   dispatch "startRenderTree" to me with the long ID of me
   put true into tHandlerBusy
   get TheNodeIDs ()
   set the nodeIDs of me to sNodeIDs
   get TheVisibleNodeIDs ()
   set the visibleNodeIDs of me to sVisibleNodeIDs
   dispatch "calibrateScrollbar" to me
   put false into tHandlerBusy
end renderTree

on calibrateScrollbar theThumbPosition
   local tPangeInc, tBorderWidth, tVisibleNodeIDsChunk
   local tVisibleNodeIDsChunkReversed, tNumberOfLines, tTopNodeID, tTopLineNum, tEndValue
   local tID, tFormattedHeight, tNodeTextRef, tEndV, tHscrollbarHeight, tThumbSize, tLineInc, tPageInc, ms
   local tNodeHeight, tHtmlText, tNumVisLines, tNumOfNodeLines, tLineHeight, tVisibleNumber, tAllVisibleNumber
   if the short name of this stack is "rTreeEngine" then exit "calibrateScrollbar"
   try
      lock screen
      set the lockLoc of me to true
      if sRenderingTree is not true
      then
         dispatch "startRenderTree" to me with the long id of me
         put true into sRenderingTree
      end if
      put the long name of control "nodeText" of control "nodeTemplate" of me into tNodeTextRef
      put the lineHeight of me into tLineHeight
      if tLineHeight is empty then
         put 16 into tLineHeight
     end if
     put 0 into tVisibleNumber
     put 0 into tNumberOfLines
     put 0 into tEndValue
     put 0 into tNumVisLines
      switch
         case the useFixedLineHeight of me is true
            repeat for each line tNodeID in sVisibleNodeIDs
               add 1 to tVisibleNumber
               switch
                  case sNodeDataA[tNodeID]["nodeText"]["styledText"] is not empty
                     put the number of lines of the keys of sNodeDataA[tNodeID]["nodeText"]["styledText"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["htmlText"] is not empty
                     put sNodeDataA[tNodeID]["nodeText"]["htmlText"] into tHtmlText
                     replace "<p>" with cr in tHtmlText
                     put the number of lines of tHtmlText into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["rtfText"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["nodeText"]["rtfText"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["unicodeText"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["nodeText"]["unicodeText"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["UTF8"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["nodeText"]["UTF8"] into sNodeDataA[tNodeID]["numberOfLines"]
                     
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
                  case sNodeDataA[tNodeID]["text"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["text"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["text"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["nodeText"]["text"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
                  case sNodeDataA[tNodeID]["label"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["label"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines                      
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["label"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["nodeText"]["label"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
                  case sNodeDataA[tNodeID]["name"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["name"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["name"] is not empty
                     put the number of lines of sNodeDataA[tNodeID]["nodeText"]["name"] into sNodeDataA[tNodeID]["numberOfLines"]
                     add sNodeDataA[tNodeID]["numberOfLines"] to tNumberOfLines 
                     break
               end switch
               put tLineHeight * sNodeDataA[tNodeID]["numberOfLines"] into sNodeDataA[tNodeID]["formattedHeight"]
               put sNodeDataA[tNodeID]["formattedHeight"] into sNodeDataA[tNodeID]["nodeHeight"]
               put tLineHeight * tNumberOfLines into sNodeDataA[tNodeID]["formattedBottom"]
            end repeat
            break
         case the useFixedLineHeight of me is not true
            repeat for each line tNodeID in sVisibleNodeIDs
               switch
                  case sNodeDataA[tNodeID]["nodeText"]["styledText"] is not empty
                     set the styledText of control "nodeText" of control "nodeTemplate" of me to sNodeDataA[tNodeID]["nodeText"]["styledText"]
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["htmlText"] is not empty
                     set the htmlText of control "nodeText" of control "nodeTemplate" of me to sNodeDataA[tNodeID]["nodeText"]["htmlText"]
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["rtfText"] is not empty
                     set the rtfText of control "nodeText" of control "nodeTemplate" of me to sNodeDataA[tNodeID]["nodeText"]["rtfText"]
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["unicodeText"] is not empty
                     set the unicodeText of control "nodeText" of control "nodeTemplate" of me to sNodeDataA[tNodeID]["nodeText"]["unicodeText"]
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["UTF8"] is not empty
                     set the unicodeText of control "nodeText" of control "nodeTemplate" of me to uniencode(sNodeDataA[tNodeID]["nodeText"]["UTF8"],"UTF8")
                     break
                  case sNodeDataA[tNodeID]["nodeText"]["text"] is not empty
                     set the text of control "nodeText" of control "nodeTemplate" of me to sNodeDataA[tNodeID]["nodeText"]["text"]
                     break
                  case sNodeDataA[tNodeID]["label"] is not empty
                     set the text of control "nodeText" of control "nodeTemplate" of me to sNodeDataA[tNodeID]["label"]
                     break
                  case sNodeDataA[tNodeID]["name"] is not empty
                     set the text of control "nodeText" of control "nodeTemplate" of me to sNodeDataA[tNodeID]["name"]
                     break
               end switch
               add the number of lines of control "nodeText" of control "nodeTemplate" of me to tNumberOfLines
               put sNodeDataA[tNodeID]["nodeHeight"] into tNodeHeight
               if tNodeHeight is empty
               then
                  put the nodeHeight of me into tNodeHeight
               end if
               if tNodeHeight is not empty
               then
                  put tNodeHeight into sNodeDataA[tNodeID]["formattedHeight"]
               else
                  put the formattedHeight of control "nodeText" of control "nodeTemplate" of me into sNodeDataA[tNodeID]["formattedHeight"]
               end if
               add sNodeDataA[tNodeID]["formattedHeight"] to tEndV
               put tEndV into sNodeDataA[tNodeID]["formattedBottom"]
            end repeat
      end switch
      put 0 into tHscrollbarHeight
      if the visible of scrollbar "horizontalScrollbar" of me is true then
         put the height of scrollbar "horizontalScrollbar" of me into tHscrollbarHeight
      end if
      -- patch Malte to make the proportional thumb correct size
      # Calculate endValue - Thanks to Malte!
      put the thumbsize of scrollbar "verticalScrollbar" of me into tThumbSize
      put the lineInc of scrollbar "verticalScrollbar" of me into tLineInc
      put the pageInc of scrollbar "verticalScrollbar" of me into tPageInc
      if tNumberOfLines > 0 then
         switch
            case the useFixedLineHeight of me is true
               put the height of me / tLineHeight into tNumVisLines
               put trunc(tNumVisLines) into tNumVislines
         
               put (tNumberOfLines - tNumvisLines) +2 into tEndValue
               --add the thumbsize of scrollbar "verticalScrollbar" of me to tEndValue
               add tNumVisLines to tEndValue
               
               
               break
            case the useFixedLineHeight of me is not true
               -- patch Malte to make the proportional thumb correct size 04/24/2012
               put tEndV / tNumberOfLines into sAverageLineHeight
               put the height of me / sAverageLineHeight into tNumVisLines
               put trunc(tNumVisLines) into tNumVislines
               set the thumbsize of scrollbar "verticalScrollbar" of me to tNumVisLines
               put (tNumberOfLines - tNumvisLines) +2 into tEndValue
               --add the thumbsize of scrollbar "verticalScrollbar" of me to tEndValue
               add tNumVisLines to tEndValue
               break
         end switch
      end if
      if tEndValue >= tNumVisLines then
         set the thumbsize of scrollbar "verticalScrollbar" of me to 1
         set the endvalue of scrollbar "verticalScrollbar" of me to tEndValue 
         set the thumbsize of scrollbar "verticalScrollbar" of me to tNumVisLines
      else
         set the thumbsize of scrollbar "verticalScrollbar" of me to 1
         
         set the endvalue of scrollbar "verticalScrollbar" of me to tNumVisLines
         set the thumbsize of scrollbar "verticalScrollbar" of me to tNumVisLines
         
      end if
      # END Calculate endValue - Thanks to Malte!
      set the lineInc of scrollbar "verticalScrollbar" of me to tLineInc
      set the pageInc of scrollbar "verticalScrollbar" of me to tPageInc
      dispatch "startCalibrateTree" to me with the ID of me
      dispatch "finishedCalibrateTree" to me with the long ID of me
      send "updateTree" && the thumbPosition of scrollbar "VerticalScrollbar" of me to me
      put false into sFirstRun
      unlock messages
   catch tErr
      unlock messages
      put tErr
      throw tErr
   end try
   unlock screen --adding this speeds things up!
end calibrateScrollbar

on updateGeometry
    lock screen
    lock messages
    local tH
    local tW
    set the lockLoc of me to true
    set the rectangle of graphic "backgroundGraphic" of me to the rectangle of me
    set the rectangle of field "BackgroundField" of me to the rectangle of me
    put the height of me - the height of scrollbar "HorizontalScrollbar" of me into tH
    if tH > 0 then set the height of scrollbar "VerticalScrollbar" of me to tH + 1
    set the top of scrollbar "VerticalScrollbar" of me to the top of me
    set the right of scrollbar "VerticalScrollbar" of me to the right of me
    put the width of me - the width of scrollbar "VerticalScrollbar" of me into tW
    if tW > 0 then set the width of scrollbar "HorizontalScrollbar" of me to tW + 1
    set the bottom of scrollbar "HorizontalScrollbar" of me to the bottom of me
    set the left of scrollbar "HorizontalScrollbar" of me to the left of me
    set the rectangle of graphic "CornerPiece" of me to the topRight of scrollbar "HorizontalScrollbar" of me , the bottomRight of me
    if there is a control "nodeTemplate" of me then set the bottomLeft of control "nodeTemplate" of me to the topLeft of me
    if the nodeData of me is an array then
        calibrateScrollbar
    end if
    unlock messages
end updateGeometry

on updateTree newThumbPosition newNodeIDsChunk newHorizontalThumbPosition
    local ms
    -- local tLongNodeTemplateID
    local tLeft
    local tHasCell
    local tFirstCellLeft
    local tColumnWidths
    local tNodeTemplateControlIDs
    local tCellsToDelete
    local tColumnHeadersToDelete
    local tNodeTemplateChange
    local tRightOfMe
    local tNodeIDsTEMP
    local tVscrollbarWidth
    local tHscrollbarHeight
    local tLineNum
    local tHeadersHeight
    local tPreviousBottom
    local tInheritables
    local tNodeSpacing
    local tDepthDelta
    local tControlName
    local tOneWordProperty
    local tProp
    local tExpression
    local tNodeTextRect
    local tFormattedWidths
    local tRowNumber
    local tColumnNumber
    local tPreviousNodeContainerID
    local tIDpath
    local tDepth
    local tIconName
    local tHpos
    local tVloc
    local tFormattedVdelta
    local tFormattedHdelta
    local tFormattedHleft
    local tHlength
    local tTop
    local tMiddle
    local tBottom
    local tLevel
    local tConnectionLinesPoints
    local tLastChildID
    local tLastChildNumber
    local tThisNumber
    local tLastShownBottom
    local tNodeContainerBottom
    local tBottomDelta
    local tHscrollPixels
    local tDescription
    local tLine
    local tChunk
    local tEtemp
    local tThumbPos
    local tTopNodeID
    local tLastProperties
    local tControlID
    local tShownNodeIDs
    local tFirstIcon
    local tSecondIcon
    local tThirdIcon
    local tStartRenderLineNum
    local tTopDiff
    local tEndDiff
    local tLineInc
    local tPageInc
    local tLefts, trect, tLineHeight
    lock screen
    try
        if sRenderingTree is not true
        then
            dispatch "startRenderTree" to me with the long id of me
            put true into sRenderingTree
        end if
        if newNodeIDsChunk is empty
        then
            dispatch "startUpdateTree" to me with the long id of me
        end if
        lock messages
        put the millisec into ms ###
        set the lockLoc of me to true
        set the relayerGroupedControls to true
        if the short name of this stack is "rTreeEngine" then exit "updateTree"
        if there is a control "nodeTemplate" of me
        then
            switch
                case there is a the nodeBehavior of me
                    set the behavior of control "nodeTemplate" of me to the nodeBehavior of me
                    break
                case the nodeBehavior of me is empty or the nodeBehavior of me is "empty"
                    set the behavior of control "nodeTemplate" of me  to "button" && quote & "nodeBehavior" & quote && "of card" && quote & "Engine" & quote && "of stack" && quote & "rTreeEngine" & quote
                    set the nodeBehavior of me to "button" && quote & "nodeBehavior" & quote && "of card" && quote & "Engine" & quote && "of stack" && quote & "rTreeEngine" & quote
                    break
                case there is not a the nodeBehavior of me and newNodeIDsChunk is empty
                    answer warning "Can´t set nodeBehavior!" & cr & "Not a valid control (" & the nodeBehavior of me & ")"
                    break
            end switch
        end if
        
        if newHorizontalThumbPosition is empty
        then
            put trunc(the thumbPosition of scrollbar "horizontalScrollbar" of me) into newHorizontalThumbPosition
        end if
        
        # Settings for grid style.
        if the treeStyle of me is "grid"
        then
            put the left of me into tLeft
            repeat with i = 1 to the number of controls of control "nodeTemplate" of me
                if the short name of control i of control "nodeTemplate" of me is "nodeBackground" or the short name of control i of control "nodeTemplate" of me is "rowBackground"
                then
                    set the width of control i of control "nodeTemplate" of me to the width of me
                    set the left of control i of control "nodeTemplate" of me to tLeft
                    if there is a group "columnHeaders" of me
                    then
                        if "Background" is in the name of control i of group "columnHeaders" of me then set the width of control i of group "columnHeaders" of me to the width of me
                        if "Background" is in the name of control i of group "columnHeaders" of me then set the left of control i of group "columnHeaders" of me to tLeft
                    end if
                    next repeat
                end if
                set the left of control i of control "nodeTemplate" of me to tLeft - the borderWidth of control i of control "nodeTemplate" of me
                if there is a group "columnHeaders" of me
                then
                    if there is a control i of group "columnHeaders" of me
                    then
                        set the width of control i of group "columnHeaders" of me to the width of control i of control "nodeTemplate" of me
                        set the left of control i of group "columnHeaders" of me to tLeft - the borderWidth of control i of control "nodeTemplate" of me
                    end if
                end if
                if tHasCell is not true and "cell" is in the name of control i of control "nodeTemplate" of me
                then
                    put the left of control i of control "nodeTemplate" of me into tFirstCellLeft
                    put true into tHasCell
                end if
                put the right of control i of control "nodeTemplate" of me into tLeft
                
                put the width of control i of control "nodeTemplate" of me & cr after tColumnWidths
                put the id of control i of control "nodeTemplate" of me & cr after tNodeTemplateControlIDs
                
                if "cell" is in the name of control i of control "nodeTemplate" of me and tLeft > the right of me
                then
                    put the long id of control i of control "nodeTemplate" of me & cr after tCellsToDelete
                    if there is a group "columnHeaders" of me
                    then
                        if there is a control i of group "columnHeaders" of me then put the long id of control i of group "columnHeaders" of me & cr after tColumnHeadersToDelete
                    end if
                end if
            end repeat
            if character - 1 of tColumnWidths is cr then delete character - 1 of tColumnWidths
            if character - 1 of tNodeTemplateControlIDs is cr then delete character - 1 of tNodeTemplateControlIDs
            if character - 1 of tCellsToDelete is cr then delete character - 1 of tCellsToDelete
            if character - 1 of tColumnHeadersToDelete is cr then delete character - 1 of tColumnHeadersToDelete
            delete line - 1 of tCellsToDelete
            delete line - 1 of tColumnHeadersToDelete
            repeat for each line tCell in tCellsToDelete
                delete tCell
                put true into tNodeTemplateChange
            end repeat
            repeat for each line tColumnHeader in tColumnHeadersToDelete
                delete tColumnHeader
                -- put true into tNodeTemplateChange
            end repeat
            
            
            put the right of me into tRightOfMe
            if tLeft < the right of me and tHasCell is true
            then
                repeat until tLeft > the right of me
                    copy control "cell" of control "nodeTemplate" of me to control "nodeTemplate" of me
                    set the left of it to tLeft - the borderWidth of it
                    put the right of it into tLeft
                    copy control 3 of group "columnHeaders" of me to group "columnHeaders" of me
                    set the left of it to tLeft - the borderWidth of it
                    put the right of it into tLeft
                end repeat
                put true into tNodeTemplateChange
            end if
            
            
            if tNodeTemplateChange is true
            then
                send "delete_nodeContainers" to me
            end if
        end if
        # End of settings for grid style.
        
        if there is a control "dragIndicator" of me
        then
            set the visible of control "dragIndicator" of me to false
        end if
        
        repeat for each line tNodeContainerID in tNodeContainerIDs
            -- if there is a control ID tNodeContainerID of me then set the visible of control ID tNodeContainerID of me to false
            if there is a control ID tNodeContainerID of me then set the topLeft of control ID tNodeContainerID of me to the bottomLeft of me
            if there is a control "nodeBackground" of control ID tNodeContainerID of me
            then
                set the opaque of control "nodeBackground" of control ID tNodeContainerID of me to true
                set the backgroundColor of control "nodeBackground" of control ID tNodeContainerID of me to empty
            end if
        end repeat
        
        if the useFixedLineHeight of me is true
        then
            put the lineHeight of me into tLineHeight
            if tLineHeight is not a number then
                put 16 into tLineHeight
            end if
            put tLineHeight into sAverageLineHeight
        end if
        
        repeat for each line tNodeID in sVisibleNodeIDs
            add 1 to tStartRenderLineNum
            if sNodeDataA[tNodeID]["formattedBottom"] >= newThumbPosition * sAverageLineHeight and sNodeDataA[tNodeID]["formattedBottom"] - sNodeDataA[tNodeID]["formattedHeight"] <= newThumbPosition * sAverageLineHeight
            then
                exit repeat
            end if
        end repeat
        put newThumbPosition * sAverageLineHeight - (sNodeDataA[tNodeID]["formattedBottom"] - sNodeDataA[tNodeID]["formattedHeight"]) into tTopDiff
        put line tStartRenderLineNum to tStartRenderLineNum + the height of me of sVisibleNodeIDs into tNodeIDsTEMP
        if newNodeIDsChunk is not empty then put newNodeIDsChunk into tNodeIDsTEMP
        if sVisibleNodeIDs is empty
        then
            set the endvalue of scrollbar "horizontalScrollbar" of me to the thumbSize of scrollbar "horizontalScrollbar" of me
            set the visible of control "connectionLines" of me to false
            exit updateTree
        end if
        
        if the visible of control "VerticalScrollbar" of me
        then
            put the width of control "VerticalScrollbar" of me into tVscrollbarWidth
        else
            put 0 into tVscrollbarWidth
        end if
        if the visible of control "HorizontalScrollbar" of me
        then
            put the height of control "HorizontalScrollbar" of me into tHscrollbarHeight
        else
            put 0 into tHscrollbarHeight
        end if
        put 0 into tLineNum
        put the nodeContainerIDs of me into tNodeContainerIDs
        
        if the treeStyle of me is "grid" then put the height of group "columnHeaders" of me into tHeadersHeight
        if tHeadersHeight is not an integer then put 0 into tHeadersHeight
        put the top of me + the topMargin of me + tHeadersHeight - tTopDiff into tPreviousBottom
        
        repeat for each line tNodeID in tNodeIDsTEMP
            add 1 to tLineNum
            -- put sNodeDataA[tNodeID] into tE
            put TheDepth(tNodeID) into sNodeDataA[tNodeID]["depth"]
            put TheIDpath(tNodeID) into sNodeDataA[tNodeID]["IDpath"]
            -- put TheFamily(tNodeID) into sNodeDataA[tNodeID]["family"] # Takes 0.1 ms / family descendant.
            
            put "firstIconCollapsed,firstIconExpanded,secondIconCollapsed,secondIconExpanded,thirdIconCollapsed,thirdIconExpanded,collapseSublines,fileIcon,firstIconShift,secondIconShift,thirdIconShift,fileIcon,useFirstIcon,useSecondIcon,useThirdIcon,useCheck,nodeBehavior,nodeHeight" into tInheritables
            repeat for each item tInheritable in tInheritables
                if sNodeDataA[tNodeID][tInheritable] is empty then put the tInheritable of me into sNodeDataA[tNodeID][tInheritable]
            end repeat
            
            if sNodeDataA[tNodeID]["expanded"] is empty
            then
                if the defaultExpanded of me is not false
                then
                    set the defaultExpanded of me to true
                    put true into sNodeDataA[tNodeID]["expanded"]
                    -- put true into sNodeDataA[tNodeID]["expanded"]
                else
                    put false into sNodeDataA[tNodeID]["expanded"]
                    -- put false into sNodeDataA[tNodeID]["expanded"]
                end if
            end if
            
            
            if tLineNum > the number of lines of tNodeContainerIDs
            then
                copy control "nodeTemplate" of me to me
                set the layer of it to the layer of control "backgroundGraphic" of me + 1
                set the tabGroupBehavior of it to false
                set the name of it to "nodeContainer ID" && the ID of it
                put cr & the ID of it after tNodeContainerIDs
                if character 1 of tNodeContainerIDs is cr then delete character 1 of tNodeContainerIDs
                set the nodeContainerIDs of me to tNodeContainerIDs
            end if
            put line tLineNum of tNodeContainerIDs into tNodeContainerID
            put tNodeContainerID into sNodeDataA[tNodeID]["nodeContainerID"]
            set the lockLoc of control ID tNodeContainerID of me to true
            set the visible of control ID tNodeContainerID of me to true
            set the height of control "nodeBackground" of control ID tNodeContainerID of me to 1
            set the width of control "nodeBackground" of control ID tNodeContainerID of me to 1
            set the height of control ID tNodeContainerID of me to 1
            set the width of control ID tNodeContainerID of me to 1
            set the top of control "nodeBackground" of control ID tNodeContainerID of me to the top of control ID tNodeContainerID of me
            set the left of control "nodeBackground" of control ID tNodeContainerID of me to the top of control ID tNodeContainerID of me
            set the nodeID of control ID tNodeContainerID of me to tNodeID
            set the behavior of control ID tNodeContainerID of me to sNodeDataA[tNodeID]["nodeBehavior"]
            put tNodeID & cr after tShownNodeIDs
            
            set the nodeLine of control ID tNodeContainerID of me to tStartRenderLineNum + tLineNum-- round(the thumbPosition of scrollbar "VerticalScrollbar" of me) - 1
            
            put the nodeSpacing of me into tNodeSpacing
            replace " " with "" in tNodeSpacing
            set the top of control ID tNodeContainerID of me to tPreviousBottom + tNodeSpacing
            
            
            if newNodeIDsChunk is empty
            then
                unlock messages
                dispatch "preRenderNode" to control ID tNodeContainerID of me with sNodeDataA[tNodeID]
                lock messages
            end if
            -- dispatch "preRenderNode" to control ID tNodeContainerID of me with sNodeDataA[tNodeID]
            
            /*
            # This is for speed!
            if the depthDelta of me is empty then put 10 into tDepthDelta
            put the left of control ID tNodeContainerID of me + sNodeDataA[tNodeID]["depth"] * tDepthDelta + sNodeDataA[tNodeID]["indent"] into tLeft
            repeat with i = 2 to the number of controls of control ID tNodeContainerID of me
                put the short id of control i of control ID tNodeContainerID of me into tControlID
                -- set the rect of control id tControlID to the rect of control "nodeText" of control "nodeTemplate" of me
                set the left of control id tControlID to tLeft
                set the top of control id tControlID to the top of control ID tNodeContainerID of me
                put the right of control id tControlID into tLeft
            end repeat
            # End speed.
            */
            
            put the depthDelta of me into tDepthDelta
            if tDepthDelta is empty then put 10 into tDepthDelta
            put the left of me + the leftMargin of me + sNodeDataA[tNodeID]["depth"] * tDepthDelta + sNodeDataA[tNodeID]["indent"] - (newHorizontalThumbPosition * 1) into tLeft
            repeat with i = 1 to the number of controls of control ID tNodeContainerID of me
                put the short id of control i of control ID tNodeContainerID of me into tControlID
                put the short name of control id tControlID into tControlName
                set the visible of control id tControlID to true
                if word 1 of the name of control id tControlID is "field"
                then
                    set the textFont of control id tControlID to the textFont of control tControlName of control "nodeTemplate" of me
                end if
                if sNodeDataA[tNodeID]["use" & tControlName] is false
                then
                    set the visible of control id tControlID to false
                end if
                switch
                    case word 1 of the name of control id tControlID is "button"
                        switch
                            case tControlName is "firstIcon"
                                switch 
                                    case sNodeDataA[tNodeID]["expanded"] is true
                                        put sNodeDataA[tNodeID]["firstIconExpanded"] into tFirstIcon
                                        if tFirstIcon is empty then put 0 into tFirstIcon
                                        set the icon of control "firstIcon" of control ID tNodeContainerID of me to tFirstIcon
                                        break
                                    case sNodeDataA[tNodeID]["expanded"] is not true
                                        put sNodeDataA[tNodeID]["firstIconCollapsed"] into tFirstIcon
                                        if tFirstIcon is empty then put 0 into tFirstIcon
                                        set the icon of control "firstIcon" of control ID tNodeContainerID of me to tFirstIcon
                                        break
                                end switch
                                break
                            case tControlName is "secondIcon"
                                switch 
                                    case sNodeDataA[tNodeID]["expanded"] is true
                                        put sNodeDataA[tNodeID]["secondIconExpanded"] into tSecondIcon
                                        if tSecondIcon is empty then put 0 into tSecondIcon
                                        set the icon of control "secondIcon" of control ID tNodeContainerID of me to tSecondIcon
                                        break
                                    case sNodeDataA[tNodeID]["expanded"] is not true
                                        put sNodeDataA[tNodeID]["secondIconCollapsed"] into tSecondIcon
                                        if tSecondIcon is empty then put 0 into tSecondIcon
                                        set the icon of control "secondIcon" of control ID tNodeContainerID of me to tSecondIcon
                                        break
                                end switch
                                break
                            case tControlName is "thirdIcon"
                                switch 
                                    case sNodeDataA[tNodeID]["expanded"] is true
                                        put sNodeDataA[tNodeID]["thirdIconExpanded"] into tThirdIcon
                                        if tThirdIcon is empty then put 0 into tThirdIcon
                                        set the icon of control "thirdIcon" of control ID tNodeContainerID of me to tThirdIcon
                                        break
                                    case sNodeDataA[tNodeID]["expanded"] is not true
                                        put sNodeDataA[tNodeID]["thirdIconCollapsed"] into tThirdIcon
                                        if tThirdIcon is empty then put 0 into tThirdIcon
                                        set the icon of control "thirdIcon" of control ID tNodeContainerID of me to tThirdIcon
                                        break
                                end switch
                            case the style of control id tControlID is "radiobutton"
                                if the radioBehavior of me is false and (sNodeDataA[tNodeID][tControlName][hilited] is false or sNodeDataA[tNodeID][tControlName][hilited] is true)
                                then
                                    set the hilited of control id tControlID to sNodeDataA[tNodeID][tControlName][hilited]
                                end if
                                if the radioBehavior of me is true
                                then
                                    put false into sNodeDataA[tNodeID][tControlName][hilited]
                                    if tNodeID is the hilitedRadioNodeID of me then put true into sNodeDataA[tNodeID][tControlName][hilited]
                                end if
                                break
                        end switch
                        break
                end switch
                
                set the nodeID of control ID tNodeContainerID of me to tNodeID
                
                if tControlName is "nodeText"
                then
                    delete var sNodeDataA[tNodeID][tControlName]["name"]
                    delete var sNodeDataA[tNodeID][tControlName]["label"]
                end if
                
                put the lastProperties of control id tControlID into tLastProperties
                repeat for each key tProperty in tLastProperties
                    if tLastProperties[tProperty] is not empty
                    then
                        set the tProperty of control id tControlID to the tProperty of control tControlName of control "nodeTemplate" of me
                    end if
                end repeat
                set the lastProperties of control id tControlID to sNodeDataA[tNodeID][tControlName]
                
                
                repeat for each key tP in sNodeDataA[tNodeID]
                    switch
                        case word 1 of tP is among the items of "styledText,htmlText,rtfText,unicodeText,text,textAligned,textColor,textFont,textShift,textStyle,textSize"
                            if sNodeDataA[tNodeID]["nodeText"][tP] is empty then put sNodeDataA[tNodeID][tP] into sNodeDataA[tNodeID]["nodeText"][tP]
                            break
                    end switch
                    
                    local tCounter
                    if tControlName is "nodeText"
                    then
                        if the useFixedLineHeight of me is true then
                            set the fixedlineHeight of control id tControlID to true
                            --set the textHeight of control id tControlID to tLineHeight
                        else
                            set the fixedlineHeight of control id tControlID to false
                        end if
                        switch
                            case sNodeDataA[tNodeID]["nodeText"]["styledText"] is not empty
                                set the styledText of control id tControlID to sNodeDataA[tNodeID]["nodeText"]["styledText"]
                                break
                            case sNodeDataA[tNodeID]["nodeText"]["htmlText"] is not empty
                                set the htmlText of control id tControlID to sNodeDataA[tNodeID]["nodeText"]["htmlText"]
                                break
                            case sNodeDataA[tNodeID]["nodeText"]["rtfText"] is not empty
                                set the rtfText of control id tControlID to sNodeDataA[tNodeID]["nodeText"]["rtfText"]
                                break
                            case sNodeDataA[tNodeID]["nodeText"]["unicodeText"] is not empty
                                set the unicodeText of control id tControlID to sNodeDataA[tNodeID]["nodeText"]["unicodeText"]
                                break
                            case sNodeDataA[tNodeID]["nodeText"]["UTF8"] is not empty
                                set the unicodeText of control id tControlID to uniencode(sNodeDataA[tNodeID]["nodeText"]["UTF8"],"UTF8")
                                break
                            case sNodeDataA[tNodeID]["nodeText"]["text"] is not empty
                                set the text of control id tControlID to sNodeDataA[tNodeID]["nodeText"]["text"]
                                break
                            case sNodeDataA[tNodeID]["label"] is not empty
                                set the text of control id tControlID to sNodeDataA[tNodeID]["label"]
                                break
                            case sNodeDataA[tNodeID]["name"] is not empty
                                set the text of control id tControlID of control ID tNodeContainerID of me  to sNodeDataA[tNodeID]["name"]
                                break
                        end switch
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if the number of words of tP > 1 and word 1 of tP is among the items of "text"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                switch
                                    case sNodeDataA[tNodeID][tControlName][tP] is not empty
                                        do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                                        break
                                    case sNodeDataA[tNodeID][tControlName][tP] is empty
                                        -- do "delete" && tExpression
                                        break
                                end switch
                            end if
                        end repeat
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if the number of words of tP > 1 and word 1 of tP is "unicodeText"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if the number of words of tP > 1 and word 1 of tP is "rtfText"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if the number of words of tP > 1 and word 1 of tP is "htmlText"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if the number of words of tP > 1 and word 1 of tP is "styledText"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            switch
                                case word 3 of tP is "line" and word 1 of tP is not among the items of "styledText,htmlText,rtfText,unicodeText,text"
                                    put word 1 of tP into tProp
                                    put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                    do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                                    break
                            end switch
                        end repeat
                        
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            switch
                                case word 3 of tP is "word" and word 1 of tP is not among the items of "styledText,htmlText,rtfText,unicodeText,text"
                                    put word 1 of tP into tProp
                                    put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                    do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                                    break
                            end switch
                        end repeat
                        
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            switch
                                case word 3 of tP is among the items of "char,character" and word 1 of tP is not among the items of "styledText,htmlText,rtfText,unicodeText,text"
                                    put word 1 of tP into tProp
                                    put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                    do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                                    break
                            end switch
                        end repeat
                        
                        
                        
                        /*
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if word 1 of tP is "textColor"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if word 1 of tP is "textFont"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if word 1 of tP is "textSize"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                            if word 1 of tP is "textStyle"
                            then
                                put word 1 of tP into tProp
                                put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                                do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            end if
                        end repeat
                        */
                        
                    end if
                end repeat
                
                repeat for each key tP in sNodeDataA[tNodeID][tControlName]
                    switch
                        -- case tControlName is "nodeText" and word 1 of tP is among the items of "name,label,styledText,htmlText,rtfText,unicodeText,text"
                        
                        -- break
                        case the number of words of tP = 1 and word 1 of tP is not among the items of "name,styledText,htmlText,rtfText,unicodeText,text"
                            set the tP of control id tControlID to sNodeDataA[tNodeID][tControlName][tP]
                            break
                        case the number of words of tP > 1 and word 1 of tP is not among the items of "name,styledText,htmlText,rtfText,unicodeText,text"
                            put word 1 of tP into tProp
                            put word 3 to - 1 of tP && "of control" && i && "of control ID" && tNodeContainerID && "of me" into tExpression
                            -- set the tProp of tExpression to sNodeDataA[tNodeID][tControlName][tP]
                            do "set the" && tProp && "of" && tExpression && "to" && quote & sNodeDataA[tNodeID][tControlName][tP] & quote
                            break
                    end switch
                end repeat
                
                
                if the visible of control id tControlID is true and i > 1
                then
                    if tControlName is "nodeText"
                    then
                        repeat until char - 1 of control id tControlID is not cr
                            delete char - 1 of control id tControlID
                        end repeat
                        set the width of control id tControlID to the formattedWidth control id tControlID
                        put the rect of control id tControlID into tNodeTextRect
                        put item 2 of tNodeTextRect + the formattedHeight control id tControlID into item 4 of tNodeTextRect
                        if sNodeDataA[tNodeID]["collapseSublines"] is true and sNodeDataA[tNodeID]["expanded"] is false
                        then
                            put item 2 of tNodeTextRect + the formattedHeight of line 1 of control id tControlID into item 4 of tNodeTextRect
                        end if
                        set the rect of control id tControlID to tNodeTextRect
                    end if
                    set the left of control id tControlID to tLeft - the borderWidth of control id tControlID
                    set the top of control id tControlID to the top of control ID tNodeContainerID of me
                    put the right of control id tControlID into tLeft
                end if
                
                set the left of control ID tNodeContainerID of me to the left of me
                
                -- put the formattedWidth of control ID tNodeContainerID of me - newHorizontalThumbPosition & cr after tFormattedWidths
                
                if tControlName is "firstBadge"
                then
                    if sNodeDataA[tNodeID]["firstBadge"]["label"] is empty then set the label of control id tControlID to tNodeID
                    if sNodeDataA[tNodeID]["firstBadge"]["visible"] is empty then put sNodeDataA[tNodeID]["firstBadge"]["useFirstBadge"] into sNodeDataA[tNodeID]["firstBadge"]["visible"]
                    if sNodeDataA[tNodeID]["firstBadge"]["visible"] is empty then put the useFirstBadge of me into sNodeDataA[tNodeID]["firstBadge"]["visible"]
                    if sNodeDataA[tNodeID]["firstBadge"]["visible"] is empty then put false into sNodeDataA[tNodeID]["firstBadge"]["visible"]
                    set the visible of control id tControlID to sNodeDataA[tNodeID]["firstBadge"]["visible"]
                    set the right of control id tControlID to the right of me - tVscrollbarWidth
                    set the top of control id tControlID to the top of control ID tNodeContainerID of me
                end if
                put tLeft + newHorizontalThumbPosition - the left of me & cr after tFormattedWidths
                put tLeft & cr after tLefts
                
                if the treeStyle of me is "grid"
                then
                    if there is a control 3 of control "columnHeaders" of me then set the name of control 3 of control "columnHeaders" of me to empty
                    if i > 3
                    then
                        if there is a control i of control "columnHeaders" of me then set the name of control i of control "columnHeaders" of me to "Col" && i + round(the thumbposition of scrollbar "horizontalScrollbar" of me) - 2
                    end if
                    -- put "columnHeaders" && sNodeDataA["columnHeaders"][1]["name"] ###
                    -- dispatch "renderColumnHeader" to control i of control "columnHeaders" of me with sNodeDataA["columnHeaders"][i]-- + the thumbposition of scrollbar "horizontalScrollbar" of me]
                    put sNodeDataA[tNodeID]["number"] into tRowNumber
                    put i + round(the thumbposition of scrollbar "horizontalScrollbar" of me - 2) into tColumnNumber
                    dispatch "renderCell" to control id tControlID with sNodeDataA[tNodeID][tColumnNumber] , tRowNumber , tColumnNumber
                end if
            end repeat
            
            set the height of control ID tNodeContainerID of me to the formattedHeight of control ID tNodeContainerID of me
            if sNodeDataA[tNodeID]["nodeHeight"] is not empty
            then
                set the height of control ID tNodeContainerID of me to sNodeDataA[tNodeID]["nodeHeight"]
            end if
            
            if the useFixedLineHeight of me is true
            then
                set the height of control ID tNodeContainerID of me to sNodeDataA[tNodeID]["formattedHeight"]
            end if
            
            
            put line tLineNum of tNodeContainerIDs into tPreviousNodeContainerID
            put the bottom of control ID tPreviousNodeContainerID of me into tPreviousBottom
            switch
                case the formattedWidth of control ID tNodeContainerID of me < the width of me
                    -- set the width of control ID tNodeContainerID of me to the width of me
                    break
                case the formattedWidth of control ID tNodeContainerID of me >= the width of me
                    -- set the width of control ID tNodeContainerID of me to the formattedWidth of control ID tNodeContainerID of me
                    break
            end switch
            -- set the width of control ID tNodeContainerID of me to the formattedWidth of control ID tNodeContainerID of me
            -- put the width of control ID tNodeContainerID of me && tNodeID & cr after tFormattedWidths
            set the width of control ID tNodeContainerID of me to the width of me
            set the left of control ID tNodeContainerID of me to the left of me
            
            if there is a control "nodeBackground" of control ID tNodeContainerID of me
            then
                if sHilitedA[tNodeID] is true
                then
                    set the backgroundColor of control "nodeBackground" of control ID tNodeContainerID of me to the hiliteColor of me
                end if
                set the opaque of control "nodeBackground" of control ID tNodeContainerID of me to true
                set the visible of control "nodeBackground" of control ID tNodeContainerID of me to true
                set the rectangle of control "nodeBackground" of control ID tNodeContainerID of me to the rectangle of control ID tNodeContainerID of me
            end if
            
            
            
            # Set connectionLines geometry.
            if the useConnectionLines of me is true
            then
                if there is a control "connectionLines" of me
                then
                    set the visible of control "connectionLines" of me to true
                    if the useGlobalData of me is true
                    then
                        if sNodeDataA[tNodeID]["IDpath"] is empty then put gNodeDataA[tNodeID]["IDpath"] into sNodeDataA[tNodeID]["IDpath"]
                    end if
                    put sNodeDataA[tNodeID]["IDpath"] into tIDpath
                    replace cr with comma in tIDpath
                    put the number of items of tIDpath into tDepth
                    switch
                        case the visible of control "firstIcon" of control ID tNodeContainerID of me is true and the icon of control "firstIcon" of control ID tNodeContainerID of me is not 0
                            put "firstIcon" into tIconName
                            break
                        case the visible of control "secondIcon" of control ID tNodeContainerID of me is true and the icon of control "secondIcon" of control ID tNodeContainerID of me is not 0
                            put "secondIcon" into tIconName
                            break
                        case the visible of control "thirdIcon" of control ID tNodeContainerID of me is true and the icon of control "thirdIcon" of control ID tNodeContainerID of me is not 0
                            put "thirdIcon" into tIconName
                            break
                         default
                            -- set the width of control "firstIcon" of control ID tNodeContainerID of me to 1
                            set the left of control "firstIcon" of control ID tNodeContainerID of me to the left of control "nodeText" of control ID tNodeContainerID of me - 2
                            put "firstIcon" into tIconName
                            break
                      end switch
                    put the left of control ID tNodeContainerID of me + the leftMargin of me + round((the width of control tIconName of control ID tNodeContainerID of me) /2) - tDepthDelta - (newHorizontalThumbPosition * 1) into tHpos
                    put item 2 of the loc of control tIconName of control ID tNodeContainerID of me into tVloc
                    
                    switch
                        case the version < 5.5
                            -- put "< 5.5"
                            put round((the height of control tIconName of control ID tNodeContainerID of me + 2) /2) into tFormattedVdelta
                            put round((the width of control tIconName of control ID tNodeContainerID of me + 1) /2) into tFormattedHdelta
                            break
                        case the version >= 5.5
                            -- put ">= 5.5"
                            put round((the formattedHeight of control tIconName of control ID tNodeContainerID of me + 2) /2) into tFormattedVdelta
                            put round((the formattedWidth of control tIconName of control ID tNodeContainerID of me + 1) /2) into tFormattedHdelta
                            break
                    end switch
                    
                    -- put tDepthDelta + round((the formattedWidth of control tIconName of control ID tNodeContainerID of me) /2) - 11 into tHlength
                    -- put round((the formattedWidth of control tIconName of control ID tNodeContainerID of me + 1) /2) into tFormattedHdelta
                    
                    put item 1 of the loc of control tIconName of control ID tNodeContainerID of me - tFormattedHdelta - 1 into tFormattedHleft
                    if tHlength < 0 then put 0 into tHlength
                    put the top of control ID tNodeContainerID of me into tTop
                    put item 2 of the loc of control tIconName of control ID tNodeContainerID of me into tMiddle
                    put the bottom of control ID tNodeContainerID of me into tBottom
                    put 0 into tLevel
                    repeat for each item tID in tIDpath
                        add 1 to tLevel
                        add tDepthDelta to tHpos
                        if tLevel = tDepth
                        then
                            if TheDepth(line tLineNum + 1 of tNodeIDsTEMP) < tLevel-- sNodeDataA[tNodeID]["expanded"] is not true or sNodeDataA[tNodeID]["children"] is empty or sNodeDataA[line - 1 of sNodeDataA[tNodeID]["children"]]["visible"] is false
                            then
                                exit repeat
                            end if
                            put tHpos , tVloc + tFormattedVdelta & cr & tHpos , tBottom & cr & cr after tConnectionLinesPoints
                            next repeat
                        end if
                        put line - 1 of sNodeDataA[tID]["children"] into tLastChildID
                        put sNodeDataA[tLastChildID]["number"] into tLastChildNumber
                        put sNodeDataA[item - 1 of tIDpath]["number"] into tThisNumber
                        if the useGlobalData of me is true
                        then
                            if tLastChildID is empty then put line - 1 of gNodeDataA[tID]["children"] into tLastChildID
                            if tLastChildNumber is empty then put gNodeDataA[tLastChildID]["number"] into tLastChildNumber
                            if tThisNumber is empty then put gNodeDataA[item - 1 of tIDpath]["number"] into tThisNumber
                        end if
                        if tLevel = tDepth - 1
                        then
                            switch
                                case tLastChildID is item - 1 of tIDpath or TheDepth(line tLineNum + 1 of tNodeIDsTEMP) < tLevel
                                    put tHpos , tTop & cr & tHpos , tVloc & cr & tFormattedHleft , tVloc & cr & cr after tConnectionLinesPoints
                                    break
                                default
                                    put tHpos , tTop & cr & tHpos , tBottom & cr & tHpos , tVloc & cr & tFormattedHleft , tVloc & cr & cr after tConnectionLinesPoints
                            end switch
                            next repeat
                        end if
                        if tThisNumber > tLastChildNumber
                        then
                            next repeat
                        end if
                        if TheDepth(line tLineNum + 1 of tNodeIDsTEMP) >= tLevel
                        then
                            put tHpos , tTop & cr & tHpos , tBottom & cr & cr after tConnectionLinesPoints
                        end if
                    end repeat
                end if
            end if
            # End Set connectionLines geometry.
            
            /*
            # Update text properties.
            if there is a control "nodeText" of control ID tNodeContainerID of me
            then
                put the styledText of control "nodeText" of control ID tNodeContainerID of me into sNodeDataA[tNodeID]["nodeText"]["styledText"]
                put the htmlText of control "nodeText" of control ID tNodeContainerID of me into sNodeDataA[tNodeID]["nodeText"]["htmlText"]
                put the rtfText of control "nodeText" of control ID tNodeContainerID of me into sNodeDataA[tNodeID]["nodeText"]["rtfText"]
                put the unicodeText of control "nodeText" of control ID tNodeContainerID of me into sNodeDataA[tNodeID]["nodeText"]["unicodeText"]
                put the text of control "nodeText" of control ID tNodeContainerID of me into sNodeDataA[tNodeID]["nodeText"]["text"]
            end if
            */
            
            if newNodeIDsChunk is empty
            then
                unlock messages
                dispatch "renderNode" to control ID tNodeContainerID of me with sNodeDataA[tNodeID]
                lock messages
            end if
            
            /* # Experimental Parser!
            put "htmlText of control nodeText of me" into tExpression
            replace "me" with "control ID tNodeContainerID of me" in tExpression
            put word 1 of tExpression into tProperty
            put word 3 to - 1 of tExpression into tRest
            if the number of words of tExpression > 1
            then
                set the tProperty of tRest to the millisec
            end if
            */
            
            set the lockLoc of control ID tNodeContainerID of me to false
            if the bottom of control ID tNodeContainerID of me > (the bottom of me - tHscrollbarHeight) -- the height of control ID tNodeContainerID of me
            then
                exit repeat
            end if
        end repeat
        
        
        if newNodeIDsChunk is not empty
        then
            put tLineNum into sCalibratedLineNum
            return sCalibratedLineNum
        end if
        
        set the layer of grc "connectionLines" of me to the layer of scrollbar "verticalScrollbar" of me - 1
        set the points of grc "connectionLines" of me to tConnectionLinesPoints
        
        set the nodeContainerIDs of me to tNodeContainerIDs
        if char - 1 of tShownNodeIDs is cr then delete char - 1 of tShownNodeIDs
        set the shownNodeIDs of me to tShownNodeIDs
        
        if character - 1 of tFormattedWidths is cr then delete character - 1 of tFormattedWidths
        sort tFormattedWidths numeric descending
        put line 1 of tFormattedWidths into sWidestNodePixels # Widest shown.
        if line 1 of tFormattedWidths > sWidestNodePixels
        then
            -- put line 1 of tFormattedWidths into sWidestNodePixels # Widest ever showed.
        end if
        
        put the bottom of control ID tNodeContainerID of me - (the bottom of me - tHscrollbarHeight) into tEndDiff
        if the thumbPos of scrollbar "VerticalScrollbar" + the thumbSize of scrollbar "VerticalScrollbar" = the endValue of scrollbar "VerticalScrollbar" then
            if tNodeID is line - 1 of sVisibleNodeIDs and tEndDiff > 0
            then
                repeat for each line tID in tNodeContainerIDs
                    put the rect of control id tID of me into tRect
                    subtract tEndDiff from item 2 of tRect
                    subtract tEndDiff from item 4 of tRect
                    set the rect of control id tID of me to tRect
                end repeat
                set the top of grc "connectionLines" of me to the top of grc "connectionLines" of me - tEndDiff
            end if
        end if
        
        put the lineInc of scrollbar "horizontalScrollbar" of me into tLineInc
        put the pageInc of scrollbar "horizontalScrollbar" of me into tPageInc
        set the thumbSize of scrollBar "HorizontalScrollbar" of me to the width of me - tVscrollbarWidth
        -- put the thumbSize of scrollBar "HorizontalScrollbar" of me ###
        put (sWidestNodePixels) - ((the width of me - tVscrollbarWidth)) into tHscrollPixels
        put round(tHscrollPixels / 1) into sHendValue
        add the thumbSize of scrollBar "HorizontalScrollbar" of me to sHendValue
        
        if sHendValue >= the thumbSize of scrollBar "HorizontalScrollbar" of me then
            set the endvalue of scrollbar "HorizontalScrollbar" of me to sHendValue
        else
            local tHthumbPos
            put the thumbPos of scrollbar "HorizontalScrollbar" of me into tHthumbPos
            set the endvalue of scrollbar "HorizontalScrollbar" of me to the thumbSize of scrollBar "HorizontalScrollbar" of me
            if the thumbPos of scrollbar "HorizontalScrollbar" of me <> tHthumbPos then
                send "updateTree" to me in 0 millisec
            end if
        end if
        
        set the lineInc of scrollbar "horizontalScrollbar" of me to tLineInc
        set the pageInc of scrollbar "horizontalScrollbar" of me to tPageInc
        
        set the temp["vThumbPosition"] of me to round(the thumbposition of scrollbar "verticalScrollbar" of me)
        if the endValue of sb "HorizontalScrollbar" of me < the startValue of sb "HorizontalScrollbar" of me then set the endValue of sb "HorizontalScrollbar" of me to the startValue of sb "HorizontalScrollbar" of me
        
        if the autoScrollbar of me and tLineNum >= the number of lines of sVisibleNodeIDs
        then
            set the visible of scrollBar "verticalScrollbar" of me to false
            set the visible of scrollBar "horizontalScrollbar" of me to false
        else
            set the visible of scrollBar "verticalScrollbar" of me to true
            set the visible of scrollBar "horizontalScrollbar" of me to true
        end if
        
        if the treeStyle of me is "grid"
        then
            if there is a group "columnHeaders" of me
            then
                set the top of group "columnHeaders" of me to the top of me + the borderWidth of me
                set the left of group "columnHeaders" of me to the left of me + the borderWidth of me
            end if
        end if
        
        set the relayerGroupedControls to false
        
        unlock messages
        dispatch "finishedRenderTree" to me with the long ID of me
        put false into sRenderingTree
    catch tError
        unlock messages
        -- put tError
        -- put the long id of this stack & cr & "tNodeContainerID" && tNodeContainerID ###
        -- throw tError
        
    end try
    -- if the mouse is "up" then put "up" ###
    -- put the long id of this stack & cr & "tNodeContainerID" && tNodeContainerID ###
    -- put "updateTree" && the millisec - ms & cr & "Visible nodes:" && the number of lines of sVisibleNodeIDs
    -- put tFormattedWidths ###
    -- put tLefts ###
end updateTree

on upDateTreeEnd
   # Dummy
end upDateTreeEnd

on newGroup
   if the long ID of me is not in the long ID of the target
   then
      pass "newGroup"
   end if
   lock messages
   send "setPersistentData" to me
   pass newGroup
end newGroup

setProp properties_of_cell_[tColRow] newValue
   put newValue into sCellDataA[item 1 of tColRow][item 2 of tColRow]
end properties_of_cell_

getProp properties_of_cell_[tColRow]
   return sCellDataA[item 1 of tColRow][item 2 of tColRow]
end properties_of_cell_

on savePersistentData
   -- set the globalRootNodeIDs of me to gRootNodeIDs
   -- set the globalNodeData of me to gNodeDataA
   set the rootNodeIDs of me to sRootNodeIDs
   set the nodeIDs of me to sNodeIDs
   set the visibleNodeIDs of me to sVisibleNodeIDs
   set the nodeData of me to sNodeDataA
   set the nodeContainerIDs of me to tNodeContainerIDs
   -- if gRootNodeIDs is not empty then set the restoreGlobalRootNodeIDs of me to gRootNodeIDs
   -- if gNodeDataA is not empty then set the restoreGlobalNodeData of me to gNodeDataA
   -- if sRootNodeIDs is not empty then set the restoreRootNodeIDs of me to sRootNodeIDs
   -- if sNodeDataA is not empty then set the restoreNodeData of me to sNodeDataA
   put false into sFirstRun
end savePersistentData

on setPersistentData
   -- set the PersistentDataSet of me to true ###
   put the globalRootNodeIDs of me into gRootNodeIDs
   put the globalNodeData of me into gNodeDataA
   put the rootNodeIDs of me into sRootNodeIDs
   put the nodeIDs of me into sNodeIDs
   put the visibleNodeIDs of me into sVisibleNodeIDs
   put the nodeData of me into sNodeDataA
   send "delete_nodeContainers" to me
   put the nodeContainerIDs of me into tNodeContainerIDs
   -- put "sNodeIDs" & cr & sNodeIDs ###
   send "renderTree" to me
   send "calibrateScrollbar" to me
end setPersistentData

on errorDialog pExecutionError, pParseError
   if the long ID of me is not in the long ID of the target
   then
      pass "errorDialog"
   end if
    answer "An error occurred on line: " & item 2 of line 1 of pExecutionError
end errorDialog

####### SET AND GET PROP SECTION

setProp nodeBehavior_of_node_ID_[tNodeID] newValue
   if the useGlobalData of me then put newValue into gNodeDataA[tNodeID]["nodeBehavior"] else put newValue into sNodeDataA[tNodeID]["nodeBehavior"]
end nodeBehavior_of_node_ID_

getProp nodeBehavior_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"nodeBehavior"] of me else return sNodeDataA[tNodeID]["nodeBehavior"]
end nodeBehavior_of_node_ID_

setProp cached_of_node_ID_[tNodeID] newValue
   if the useGlobalData of me then put newValue into gNodeDataA[tNodeID]["cached"] else put newValue into sNodeDataA[tNodeID]["cached"]
end cached_of_node_ID_

getProp cached_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"cached"] of me else return sNodeDataA[tNodeID]["cached"]
end cached_of_node_ID_

setProp children_of_node_ID_[tNodeID] newValue
   replace comma with cr in newValue
   if character 1 of newValue is cr then delete character 1 of newValue
   if character - 1 of newValue is cr then delete character - 1 of newValue
   repeat for each line tChildID in newValue
      set the parent_of_node_ID_[tChildID] of me to tNodeID
   end repeat
end children_of_node_ID_

getProp children_of_node_ID_[tNodeID]
   if the useGlobalData of me then return gNodeDataA[tNodeID]["children"] else return sNodeDataA[tNodeID]["children"]
end children_of_node_ID_

setProp collapseSublines_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["collapseSublines"]
end collapseSublines_of_node_ID_

setProp depth_of_node_ID_[tNodeID] tNewDepth
   local tAboveNodeID
   local tIDpath
   local tAboveNodeDepth
   local tNewParent
   local tChildren
   local tPosition
   
   if tNewDepth is not an integer then exit depth_of_node_ID_
   set the wholeMatches to true
   put the effectiveNodeData[tNodeID,"number"] of me into tNumber
   
   put the ID_of_node_[tNumber - 1] of me into tAboveNodeID
   put TheIDpath(tAboveNodeID) into tIDpath
   put the effectiveNodeData[tAboveNodeID,"depth"] of me into tAboveNodeDepth
   if tIDpath is empty then put tNodeID into tIDpath
   replace cr with comma in tIDpath
   if tNewDepth < 0 then put 0 into tNewDepth
   put tNewDepth into sNodeDataA[tNodeID]["depth"]
   if tNewDepth > 0 then put item tNewDepth of tIDpath into tNewParent
   switch
      case tNewDepth > tAboveNodeDepth
         send "move_node" && tNodeID && "as child 1 of node ID" && tAboveNodeID to me
         break
      case tNewDepth = 0
            send "move_node" && "ID" && tNodeID && "as root" && lineOffset(item 1 of tIDpath , the effectiveRootNodeIDs of me) + 1 to me
         break
      case tNewDepth <= tAboveNodeDepth
         put the effectiveNodeData[item tNewDepth of tIDpath,"children"] of me into tChildren
         repeat for each line tChild in tChildren
            if the effectiveNodeData[tChild,"number"] of me > tNumber then exit repeat
            add 1 to tPosition
         end repeat
         -- put "tPosition" && tPosition & cr & "the number of lines of tChildren" && the number of lines of tChildren ###
         if tPosition = the number of lines of tChildren then put - 1 into tPosition
         if the number of lines of tChildren = 1 then put 2 into tPosition
         send "move_node" && tNodeID && "as child" && tPosition + 1 && "of node ID" && tNewParent to me
         break
   end switch
   if tNewDepth > 0 then put tNewParent into sNodeDataA[tNodeID]["parent"]
   -- unlock messages
end depth_of_node_ID_

getProp depth_of_node_ID_[tNodeID]
   return TheDepth(tNodeID)
end depth_of_node_ID_

getProp depth_of_node_[tNodeNumber]
   return TheDepth(the ID_of_node_[tNodeNumber] of me)
end depth_of_node_

setProp expanded_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["expanded"]
   switch
      case newValue is true
         if there is a control id the nodeContainerID_of_node_ID_[tNodeID] of me
         then
            dispatch "nodeExpanded" to control id the nodeContainerID_of_node_ID_[tNodeID] of me with tNodeID
         else
            dispatch "nodeExpanded" to me
         end if
         put true into sNodeExpanded
         break
      case newValue is false
         if there is a control id the nodeContainerID_of_node_ID_[tNodeID] of me
         then
            dispatch "nodeCollapsed" to control id the nodeContainerID_of_node_ID_[tNodeID] of me with tNodeID
         else
            dispatch "nodeCollapsed" to me
         end if
         put true into sNodeCollapsed
         put the thumbPosition of scrollBar "verticalScrollbar" of me into sVthumbPos
         break
   end switch
end expanded_of_node_ID_

getProp expanded_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"expanded"] of me else return sNodeDataA[tNodeID]["expanded"]
end expanded_of_node_ID_


setProp family_of_node_ID_[tNodeID]
   # Trap as read only.
end family_of_node_ID_

getProp family_of_node_ID_[tNodeID]
   return TheFamily(tNodeID)
end family_of_node_ID_


setProp firstIconCollapsed_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["firstIconCollapsed"]
end firstIconCollapsed_of_node_ID_

getProp firstIconCollapsed_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"firstIconCollapsed"] of me else return sNodeDataA[tNodeID]["firstIconCollapsed"]
end firstIconCollapsed_of_node_ID_


setProp firstIconExpanded_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["firstIconExpanded"]
end firstIconExpanded_of_node_ID_

getProp firstIconExpanded_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"firstIconExpanded"] of me else return sNodeDataA[tNodeID]["firstIconExpanded"]
end firstIconExpanded_of_node_ID_

setProp firstIconShift_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["firstIconShift"]
end firstIconShift_of_node_ID_

getProp firstIconShift_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"firstIconShift"] of me else return sNodeDataA[tNodeID]["firstIconShift"]
end firstIconShift_of_node_ID_

setProp secondIconShift_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["secondIconShift"]
end secondIconShift_of_node_ID_

getProp secondIconShift_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"secondIconShift"] of me else return sNodeDataA[tNodeID]["secondIconShift"]
end secondIconShift_of_node_ID_

setProp thirdIconShift_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["thirdIconShift"]
end thirdIconShift_of_node_ID_

getProp thirdIconShift_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"thirdIconShift"] of me else return sNodeDataA[tNodeID]["thirdIconShift"]
end thirdIconShift_of_node_ID_

setProp unicodeText_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["unicodeText"]
   put newValue into sNodeDataA[tNodeID]["nodeText"]["unicodeText"]
   send "updateTextProperties" && tNodeID to me
end unicodeText_of_node_ID_

setProp rtfText_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["rtfText"]
   put newValue into sNodeDataA[tNodeID]["nodeText"]["rtfText"]
   send "updateTextProperties" && tNodeID to me
end rtfText_of_node_ID_

setProp htmlText_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["htmlText"]
   put newValue into sNodeDataA[tNodeID]["nodeText"]["htmlText"]
   send "updateTextProperties" && tNodeID to me
end htmlText_of_node_ID_

getProp htmlText_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"htmlText"] of me else return sNodeDataA[tNodeID]["htmlText"]
end htmlText_of_node_ID_


setProp htmlText_of_the_subLines_of_node_ID_[tNodeID] newValue
   set the htmlText of field "tempField" of card "Engine" of stack "rTreeEngine" to the htmlText_of_node_ID_[tNodeID] of me
   if field "tempField" of card "Engine" of stack "rTreeEngine" is empty then put the label_of_node_ID_[tNodeID] of me into field "tempField" of card "Engine" of stack "rTreeEngine"
   set the htmlText of line 2 to - 1 of field "tempField" of card "Engine" of stack "rTreeEngine" to newValue
   put the htmlText of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["htmlText"]
   put the htmlText of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["nodeText"]["htmlText"]
   put line 1 of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["label"]
   put line 2 to - 1 of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["sublines"]
end htmlText_of_the_subLines_of_node_ID_

getProp htmlText_of_the_subLines_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"htmlText of line 2"] of me else return sNodeDataA[tNodeID]["htmlText of line 2"]
end htmlText_of_the_subLines_of_node_ID_


setProp ID_of_node_ID_[tNodeID] newValue
   # Trap as read only.
end ID_of_node_ID_

getProp ID_of_node_ID_[tNodeID]
   return tNodeID
end ID_of_node_ID_


setProp IDpath_of_node_ID_[tNodeID] newValue
   # Trap as read only.
end IDpath_of_node_ID_

getProp IDpath_of_node_ID_[tNodeID]
   return TheIDpath(tNodeID)
end IDpath_of_node_ID_


setProp indent_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["indent"]
end indent_of_node_ID_

getProp indent_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"indent"] of me else return sNodeDataA[tNodeID]["indent"]
end indent_of_node_ID_

setProp styledText_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["styledText"]
   put newValue into sNodeDataA[tNodeID]["nodeText"]["styledText"]
   send "updateTextProperties" && tNodeID to me
end styledText_of_node_ID_


setProp label_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["label"]
   put newValue into sNodeDataA[tNodeID]["label"]
   send "updateTextProperties" && tNodeID , newValue to me
end label_of_node_ID_

getProp label_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"label"] of me else return sNodeDataA[tNodeID]["label"]
end label_of_node_ID_


setProp name_of_node_ID_[tNodeID] newValue
   replace cr with "_" in newValue
   put newValue into sNodeDataA[tNodeID]["name"]
   put newValue into gNodeDataA[tNodeID]["name"]
   send "updateTextProperties" && tNodeID to me
end name_of_node_ID_

getProp name_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"name"] of me else return sNodeDataA[tNodeID]["name"]
end name_of_node_ID_

setProp nodeHeight_of_node_ID_[tNodeID] newValue
   put round(newValue) into sNodeDataA[tNodeID]["nodeHeight"]
   put round(newValue) into sNodeDataA[tNodeID]["nodeBackground"]["height"]
end nodeHeight_of_node_ID_

getProp nodeHeight_of_node_ID_[tNodeID]
   if the useGlobalData of me is true 
   then
      return the effectiveNodeData[tNodeID,"nodeHeight"] of me
   else
      return sNodeDataA[tNodeID]["nodeHeight"]
   end if
end nodeHeight_of_node_ID_

setProp nodeID_of_line_[tLineNum] newValue
   # Trap as read only.
end nodeID_of_line_

getProp nodeID_of_line_[tLineNum]
   return line tLineNum of the visibleNodeIDs of me
end nodeID_of_line_


setProp nodeLine_of_node_ID_[tNodeID] newValue
   # Trap as read only.
end nodeLine_of_node_ID_

getProp nodeLine_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"nodeLine"] of me else return sNodeDataA[tNodeID]["nodeLine"]
end nodeLine_of_node_ID_

setProp nodeType_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["nodeType"]
end nodeType_of_node_ID_

getProp nodeType_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"nodeType"] of me else return sNodeDataA[tNodeID]["nodeType"]
end nodeType_of_node_ID_


setProp number_of_node_ID_[tNodeID] tNewNumber
   local tNewDepth
   local tFamily
   local tFamilyLastNumber
   local tOldNumber
   local tFamilyDelta
   local tNewNumberTemp
   local tBelowNodeID
   local tIDpath
   local tAboveNodeDepth
   local tNewParent
   local tChildren
   local tRootNodeIDs
   
   if tNewNumber is not an integer then exit number_of_node_ID_
   set the wholeMatches to true
   put the effectiveNodeData[tNodeID,"depth"] of me into tNewDepth
   put the effectiveNodeData[tNodeID,"family"] of me into tFamily
   put the effectiveNodeData[line - 1 of tFamily,"number"] of me into tFamilyLastNumber
   put the effectiveNodeData[tNodeID,"number"] of me into tOldNumber
   if tNewNumber > tOldNumber then put the number of lines of tFamily into tFamilyDelta else put 0 into tFamilyDelta
   put tNewNumber + tFamilyDelta into tNewNumberTemp
   if tNewNumberTemp > the number of lines of sNodeIDs
   then
      put the number of lines of sNodeIDs into tNewNumberTemp
      send "move_node" && tNodeID && "as root -1" to me
      exit number_of_node_ID_
   end if
   put the ID_of_node_[tNewNumberTemp] of me into tBelowNodeID
   if tBelowNodeID is empty
   then
      send "move_node" && tNodeID && "as root 1" to me
      exit number_of_node_ID_
   end if
   put the effectiveNodeData[tBelowNodeID,"IDpath"] of me into tIDpath
   replace cr with comma in tIDpath
   put the effectiveNodeData[tBelowNodeID,"depth"] of me into tAboveNodeDepth
   put the effectiveNodeData[tBelowNodeID,"parent"] of me into tNewParent
   put the effectiveNodeData[tNewParent,"children"] of me into tChildren
   put the effectiveRootNodeIDs of me into tRootNodeIDs
   switch
      case tAboveNodeDepth = 0 or tAboveNodeDepth is empty
         send "move_node" && tNodeID && "as root" && lineOffset(tBelowNodeID , tRootNodeIDs) to me
         break
      case tAboveNodeDepth > 0
         send "move_node" && tNodeID && "as child" && lineOffset(tBelowNodeID , tChildren) && "of node ID" && tNewParent to me
         break
   end switch
end number_of_node_ID_

getProp number_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"number"] of me else return sNodeDataA[tNodeID]["number"]
end number_of_node_ID_


setProp parent_of_node_ID_[tNodeID] newValue
   send "move_node" && tNodeID && "as child -1 of node ID" && newValue to me
   if the useGlobalData of me then put newValue into gNodeDataA[tNodeID]["parent"] else put newValue into sNodeDataA[tNodeID]["parent"]
end parent_of_node_ID_

getProp parent_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"parent"] of me else return sNodeDataA[tNodeID]["parent"]
end parent_of_node_ID_


setProp secondIconCollapsed_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["secondIconCollapsed"]
end secondIconCollapsed_of_node_ID_

getProp secondIconCollapsed_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"secondIconCollapsed"] of me else return sNodeDataA[tNodeID]["secondIconCollapsed"]
end secondIconCollapsed_of_node_ID_

setProp secondIconExpanded_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["secondIconExpanded"]
end secondIconExpanded_of_node_ID_

getProp secondIconExpanded_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"secondIconExpanded"] of me else return sNodeDataA[tNodeID]["secondIconExpanded"]
end secondIconExpanded_of_node_ID_


setProp sourcePath_of_node_ID_[tNodeID] newValue
   if the useGlobalData of me then put newValue into gNodeDataA[tNodeID]["sourcePath"] else put newValue into sNodeDataA[tNodeID]["sourcePath"]
end sourcePath_of_node_ID_

getProp sourcePath_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"sourcePath"] of me else return sNodeDataA[tNodeID]["sourcePath"]
end sourcePath_of_node_ID_


setProp subLines_of_node_ID_[tNodeID] newValue
   -- put newValue into sNodeDataA[tNodeID]["nodeText"]["text of line 2 to - 1"]
   put cr & newValue into sNodeDataA[tNodeID]["nodeText"]["text"]
end subLines_of_node_ID_

getProp subLines_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"nodeText","text of line 2 to - 1"] of me else return sNodeDataA[tNodeID]["nodeText"]["text of line 2 to - 1"]
end subLines_of_node_ID_


setProp text_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["text"]
   put newValue into sNodeDataA[tNodeID]["nodeText"]["text"]
   send "updateTextProperties" && tNodeID to me
end text_of_node_ID_

on updateTextProperties tNodeID newValue
   
   put empty into field "tempField" of card "Engine" of stack "rTreeEngine"
   
   switch
      case sNodeDataA[tNodeID]["nodeText"]["styledText"] is not empty
         set the styledText of field "tempField" of card "Engine" of stack "rTreeEngine" to sNodeDataA[tNodeID]["nodeText"]["styledText"]
         break
      case sNodeDataA[tNodeID]["nodeText"]["htmlText"] is not empty
         set the htmlText of field "tempField" of card "Engine" of stack "rTreeEngine" to sNodeDataA[tNodeID]["nodeText"]["htmlText"]
         break
      case sNodeDataA[tNodeID]["nodeText"]["rtfText"] is not empty
         set the rtfText of field "tempField" of card "Engine" of stack "rTreeEngine" to sNodeDataA[tNodeID]["nodeText"]["rtfText"]
         break
      case sNodeDataA[tNodeID]["nodeText"]["unicodeText"] is not empty
         set the unicodeText of field "tempField" of card "Engine" of stack "rTreeEngine" to sNodeDataA[tNodeID]["nodeText"]["unicodeText"]
         break
      case sNodeDataA[tNodeID]["nodeText"]["text"] is not empty
         set the text of field "tempField" of card "Engine" of stack "rTreeEngine" to sNodeDataA[tNodeID]["nodeText"]["text"]
         break
      case sNodeDataA[tNodeID]["label"] is not empty
         set the text of field "tempField" of card "Engine" of stack "rTreeEngine" to sNodeDataA[tNodeID]["label"]
         break
      case sNodeDataA[tNodeID]["name"] is not empty
         set the text of field "tempField" of card "Engine" of stack "rTreeEngine" to sNodeDataA[tNodeID]["name"]
         break
   end switch
 
   
   /*
   # Set array text property values to the actual value of tempField
   put the styledText of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["nodeText"]["styledText"]
   put the htmlText of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["nodeText"]["htmlText"]
   put the rtfText of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["nodeText"]["rtfText"]
   put the unicodeText of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["nodeText"]["unicodeText"]
   put the text of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["nodeText"]["text"]
   */
   
   put the text of field "tempField" of card "Engine" of stack "rTreeEngine" into sNodeDataA[tNodeID]["label"]
   put sNodeDataA[tNodeID]["label"] into sNodeDataA[tNodeID]["label"]
end updateTextProperties

getProp text_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"text of line 1"] of me else return sNodeDataA[tNodeID]["text of line 1"]
end text_of_node_ID_


setProp textColor_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["textColor of line 1"]
end textColor_of_node_ID_

getProp textColor_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"textColor of line 1"] of me else return sNodeDataA[tNodeID]["textColor of line 1"]
end textColor_of_node_ID_


setProp textFont_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["textFont of line 1"]
end textFont_of_node_ID_

getProp textFont_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"textFont of line 1"] of me else return sNodeDataA[tNodeID]["textFont of line 1"]
end textFont_of_node_ID_


setProp textShift_of_node_ID_[tNodeID] newValue
   put round(newValue) into sNodeDataA[tNodeID]["textShift of character 1 to - 1 of line 1"]
end textShift_of_node_ID_

getProp textShift_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"textShift of character 1 to - 1 of line 1"] of me else return sNodeDataA[tNodeID]["textShift of character 1 to - 1 of line 1"]
end textShift_of_node_ID_


setProp textSize_of_node_ID_[tNodeID] newValue
   put round(newValue) into sNodeDataA[tNodeID]["textSize of character 1 to - 1 of line 1"]
end textSize_of_node_ID_

getProp textSize_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"textSize of character 1 to - 1 of line 1"] of me else return sNodeDataA[tNodeID]["textSize of character 1 to - 1 of line 1"]
end textSize_of_node_ID_


setProp textStyle_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["textStyle of character 1 to - 1 of line 1"]
end textStyle_of_node_ID_

getProp textStyle_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"textStyle of character 1 to - 1 of line 1"] of me else return sNodeDataA[tNodeID]["textStyle of character 1 to - 1 of line 1"]
end textStyle_of_node_ID_


setProp thirdIconCollapsed_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["thirdIconCollapsed"]
end thirdIconCollapsed_of_node_ID_

getProp thirdIconCollapsed_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"thirdIconCollapsed"] of me else return sNodeDataA[tNodeID]["thirdIconCollapsed"]
end thirdIconCollapsed_of_node_ID_

setProp thirdIconExpanded_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["thirdIconExpanded"]
end thirdIconExpanded_of_node_ID_

getProp thirdIconExpanded_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"thirdIconExpanded"] of me else return sNodeDataA[tNodeID]["thirdIconExpanded"]
end thirdIconExpanded_of_node_ID_

setProp useFirstIcon_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["useFirstIcon"]
   put newValue into sNodeDataA[tNodeID]["firstIcon"][visible]
end useFirstIcon_of_node_ID_

getProp useFirstIcon_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"useFirstIcon"] of me else return sNodeDataA[tNodeID]["useFirstIcon"]
end useFirstIcon_of_node_ID_

setProp useSecondIcon_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["useSecondIcon"]
   put newValue into sNodeDataA[tNodeID]["secondIcon"][visible]
end useSecondIcon_of_node_ID_

getProp useSecondIcon_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"useSecondIcon"] of me else return sNodeDataA[tNodeID]["useSecondIcon"]
end useSecondIcon_of_node_ID_

setProp useThirdIcon_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["useThirdIcon"]
   put newValue into sNodeDataA[tNodeID]["thirdIcon"]["visible"]
end useThirdIcon_of_node_ID_

getProp useThirdIcon_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"useThirdIcon"] of me else return sNodeDataA[tNodeID]["useThirdIcon"]
end useThirdIcon_of_node_ID_


setProp useFirstBadge_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["firstBadge"]["useFirstBadge"]
end useFirstBadge_of_node_ID_

getProp useFirstBadge_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"firstBadge","useFirstBadge"] of me else return sNodeDataA[tNodeID]["firstBadge"]["useFirstBadge"]
end useFirstBadge_of_node_ID_

setProp visible_of_the_badge_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["visible of the badge"]
end visible_of_the_badge_of_node_ID_

getProp visible_of_the_badge_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"visible of the badge"] of me else return sNodeDataA[tNodeID]["visible of the badge"]
end visible_of_the_badge_of_node_ID_


setProp visible_of_node_ID_[tNodeID] newValue
   put newValue into sNodeDataA[tNodeID]["visible"]
end visible_of_node_ID_

getProp visible_of_node_ID_[tNodeID]
   if the useGlobalData of me then return the effectiveNodeData[tNodeID,"visible"] of me else return sNodeDataA[tNodeID]["visible"]
end visible_of_node_ID_

getProp nodeIDs
   get TheNodeIDs()
   set the nodeIDs of me to sNodeIDs
   return sNodeIDs
end nodeIDs

getProp visibleNodeIDs
   set the visibleNodeIDs of me to sVisibleNodeIDs
   return sVisibleNodeIDs
end visibleNodeIDs

-- backwards compatible properties

getProp useNoncontiguousHilite
    return the useNoncontiguousHilites of me
end useNoncontiguousHilite

setProp useNoncontiguousHilite pVal
    set the useNoncontiguousHilites of me to pVal
end useNoncontiguousHilite

getProp useMultipleHilite
    return the useMultipleHilites of me
end useMultipleHilite

setProp useMultipleHilite pVal
    set the useMultipleHilites of me to pVal
end useMultipleHilite


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
# Callback functionality to let rTree only display data (without storing it) from an external source. (See DataGrid)
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


/*
Which Cel features will not be in there?
global
behaviors
leftbadge
connection lines
leafNodeIDs
expandeNodeIDs
Alien syntax will be working but undocumented.
So 2.0 will have all functionality and be compatible with 1.5.
And have the new features that you described in your case study.
Just the sublines syntax will have changed
*/

# IDpath bottom cached cantExpand depth expanded firstIconCollapsed firstIconExpanded htmlText iconShift indent label leaf name nodeControl nodeDataArray nodeID nodeLine nodeType number parent secondIconCollapsed secondIconExpanded sourcePath textColor textFont textShift textSize textStyle text thirdIconCollapsed thirdIconExpanded useFirstIcon useSecondIcon useThirdIcon visible

