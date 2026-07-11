Script "stack_rTreeEngine_button_id_2146"

/*
# Name: button "NodeMenu" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2146 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: 4D83G/z1Y1Tu0+JRCizNKg==
*/


local tClickField
local tClickLine
local tLongContainerID

on treeID tLongrTreeID tLongContID theClickLine
   put tLongContID into tLongContainerID
   put tLongrTreeID into tClickField
   put theClickLine into tClickLine
end treeID

on menuPick pItemName
   lock screen
   if tClickField is not empty
   then
      switch pItemName
         case "New Node"
            dispatch "create_node" to tClickField with "as child - 1 of node ID" && the clickNode of tClickField
            dispatch "renderTree" to tClickField
            break
         case "New|Filesystem Node"
            # Choose a directory to start in.
            answer folder "Please choose a Directory!"
            if it is empty then break
            put it into sPath
            set the itemDelimiter to "/"
            put the last item of sPath into sName
            # Create the Node and set some Node properties.
            dispatch "new_node" to tClickField
            get the lastNodeID of tClickField
            put it into sNewNodeID
            put the clickNode of tClickField into sClickNodeID
            if sClickNodeID  is not empty
            then
               set the expanded_of_node_ID_[ sClickNodeID ] of tClickField to true
               put the number_of_node_ID_[ sClickNodeID ] of tClickField into sClickNodeNum
               put the depth_of_node_ID_[ sClickNodeID ] of tClickField into sClickNodeDepth
               set the number_of_node_ID_[ sNewNodeID ] of tClickField to sClickNodeNum + 1
               set the depth_of_node_ID_[ sNewNodeID ] of tClickField to sClickNodeDepth + 1
            end if
            if the clickNode of tClickField is empty
            then
               set the number_of_node_ID_[ sNewNodeID ] of tClickField to ( the number_of_nodes of tClickField )
               set the depth_of_node_ID_[ sNewNodeID ] of tClickField to 0
            end if
            set the name_of_node_ID_[sNewNodeID] of tClickField to sName
            set the sourcePath_of_node_ID_[sNewNodeID] of tClickField to sPath
            # Render the Tree.
            dispatch "render_tree" to tClickField
            break
         case "New|Card Node"
            dispatch "new_node" to tClickField
            get the lastNodeID of tClickField
            put it into sNewNodeID
            put the clickNode of tClickField into sClickNodeID
            set the name_of_node_ID_[sNewNodeID] of tClickField to "Card Node id" && sNewNodeID
            if sClickNodeID  is not empty
            then
               set the expanded_of_node_ID_[ sClickNodeID ] of tClickField to true
               put the number_of_node_ID_[ sClickNodeID ] of tClickField into sClickNodeNum
               put the depth_of_node_ID_[ sClickNodeID ] of tClickField into sClickNodeDepth
               set the number_of_node_ID_[ sNewNodeID ] of tClickField to sClickNodeNum + 1
               set the depth_of_node_ID_[ sNewNodeID ] of tClickField to sClickNodeDepth + 1
            end if
            if the clickNode of tClickField is empty
            then
               set the number_of_node_ID_[ sNewNodeID ] of tClickField to ( the number_of_nodes of tClickField )
               set the depth_of_node_ID_[ sNewNodeID ] of tClickField to 0
            end if
            set the defaultStack to the LongStackID of stack "rTreeEngine"
            set the customPropertySet of tClickField to "nodeControl_of_node_ID_"
            put the customProperties of tClickField into tNodeControlA
            set the customPropertySet of tClickField to empty
            repeat for each element tControlID in tNodeControlA
               put "control ID" && tControlID && "and" after tList
            end repeat
            put tClickField after tList
            set the backgroundBehavior of tClickField to true
            new card
            go to card ID the LongCardID of me
            set the name of it to the name_of_node_ID_[sNewNodeID] of tClickField
            set the cardID_of_node_ID_[sNewNodeID] of tClickField to the ID of it
            dispatch "renderTree" to tClickField
            break
         case "Delete"
            send "delete_node_ID" && the hilitedNodeIDs of tClickField to tClickField
            send "renderTree" to tClickField
            break
         case "Hide"
            set the nodeData[the clickNode of tClickField,"visible"] of tClickField to false
            send "renderTree" to tClickField
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Relabel"
            ask "Please enter a new name for the Node"
            if it is not empty then set the nodeData[the clickNode of tClickField,"label"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Icons"
            put the clickNode of stack "rTreeEngine" into tNodeID
            go to card "SetIcons" of stack "rTreeEngine"
            set the visible of stack "rTreeEngine" to true
            break
         case "New Subline"
            ask "Please enter the text of the new subline."
            set the nodeData[the clickNode of tClickField,"text of line" && the number of lines of the text of tLongContainerID + 1] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Edit Subline"
            put the localNodeData[the clickNode of tClickField] of tClickField into tLocalNodeData
            put the globalNodeData[the clickNode of tClickField] of tClickField into tGlobalNodeData
            repeat for each key tKey in tLocalNodeData
               if " of line " is in tKey
               then
                  put empty into tLocalNodeData[tKey]
               end if
            end repeat
            set the nodeData[the clickNode of tClickField] of tClickField to tLocalNodeData
            repeat for each key tKey in tGlobalNodeData
               if " of line " is in tKey
               then
                  put empty into tGlobalNodeData[tKey]
               end if
            end repeat
            set the globalNodeData[the clickNode of tClickField] of tClickField to tGlobalNodeData
            if word 2 of tClickLine is not 1
            then
               put the number of items of the tabStops of tLongContainerID into tNumberOfTabs
               repeat tNumberOfTabs times
                  put tab after tTabs
               end repeat
               set the itemDelimiter to tab
               ask "Please enter new subline text." with item - 1 of line (word 2 of tClickLine) of the text of tLongContainerID
               if the result is "cancel" then put item - 1 of line (word 2 of tClickLine) of the text of tLongContainerID into it
               set the text of line (word 2 of tClickLine) of tLongContainerID to tTabs & it
               if it is empty then set the text of line (word 2 of tClickLine) of tLongContainerID to empty
               put the text of tLongContainerID into tText
               put 1 into tLineCount
               repeat with x = 2 to the number of lines of the text of tLongContainerID
                  -- put the htmlText of line x of tLongContainerID ###
                  -- put item tNumberOfTabs + 1 of line x of the text of tLongContainerID ###
                  if item tNumberOfTabs + 1 of line x of the text of tLongContainerID is empty then next repeat
                  add 1 to tLineCount
                  set the nodeData[the clickNode of tClickField,"text of line" && tLineCount] of tClickField to item - 1 of line x of the text of tLongContainerID
               end repeat
               set the itemDelimiter to comma
               dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            end if
            break
         case "Use First Badge"
            put the nodeData[the clickNode of tClickField , "visible of the badge"] of tClickField into tValue
            set the nodeData[the clickNode of tClickField , "visible of the badge"] of tClickField to not tValue
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Source Path"
            ask "Please enter a Sourcepath for the Node"
            set the nodeData[the clickNode of tClickField,"sourcePath"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Text Size"
            ask "Please enter a Text Size for the Node"
            set the nodeData[the clickNode of tClickField,"textSize"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Text Color"
            ask "Please enter a Text Color for the Node"
            set the nodeData[the clickNode of tClickField,"textColor"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Text Style"
            ask "Please enter a Text Style for the Node"
            set the nodeData[the clickNode of tClickField,"textStyle"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Indent"
            ask "Please enter a number for the indentation of the Node"
            set the nodeData[the clickNode of tClickField,"indent"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Refresh"
            set the nodeData[the clickNode of tClickField,"cached"] of tClickField to false
            switch
               case the useCache of me is not false and the sourcePath_of_node_ID_[the clickNode of tClickField] of tClickField is not empty
                  send "scanNode" && the clickNode of tClickField to tClickField
                  break
               default
                  dispatch "renderTree" to tClickField
                  break
            end switch
            break
         case "Node Properties"
            put the clickNode of stack "rTreeEngine" into tNodeID
            put the name_of_node_ID_[ tNodeID ] of tClickField into tNodeName
            set the label of stack "rTreeEngine" to "Node" && quote & tNodeName & quote && comma && "ID" && tNodeID
            
            set the visible of stack "rTreeEngine" to true
            
            break
         case "Tree Properties"
            set the visible of stack "rTreeEngine" to true
            break
      end switch
   end if
   unlock screen
end menuPick
