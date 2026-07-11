Script "stack_rTreeEngine_button_id_2465"

/*
# Name: button "BadgeMenu" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2465 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: 1gfTwBXMv4gnyZQAYYBzyQ==
*/


local tClickField
local tTarget

on treeID theID theTarget
   -- put "control ID" && theID into tClickField
   put theID into tClickField
   put theTarget into tTarget
end treeID

on menuPick pItemName
   lock screen
   if tFieldID is not empty
   then
      put the nodeID of the owner of tTarget into tNodeID
      switch pItemName
         case "Set Label"
            ask "Please enter a new label for the badge"
            -- put tTarget ###
            if it is not empty
            then
               set the nodeData[tNodeID,"firstBadge","label"] of tClickField to it
               -- set the nodeData[tNodeID,"label of the firstBadge"] of tClickField to it
               -- set the nodeData[tNodeID,"label of control firstBadge"] of tClickField to it
            end if
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Color"
            ask "Please enter a new color for the badge"
            if it is not empty then set the nodeData[tNodeID,"firstBadge","backColor"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Width"
            ask "Please enter a new width for the badge"
            if it is not empty then set the nodeData[tNodeID,"firstBadge","width"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Set Height"
            ask "Please enter a new height for the badge"
            if it is not empty then set the nodeData[tNodeID,"firstBadge","height"] of tClickField to it
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "Hide"
            -- set the visible_of_the_badge_of_node_ID_[the mouseNode of tClickField] of tClickField to false
            set the nodeData[tNodeID,"firstBadge","useFirstBadge"] of tClickField to false
            dispatch "scrollbarDrag" to scrollbar "VerticalScrollbar" of tClickField with the thumbposition of scrollbar "VerticalScrollbar" of tClickField
            break
         case "SOMETHING"
            lock screen
            put lineOffset("Use Badges" , the text of me) into tLineNum
            if character 1 to 2 of line tLineNum of the text of me is "!c"
            then
               put "!n" into character 1 to 2 of line tLineNum of me
               set the useBadges of tClickField to false
            else
               put "!c" into character 1 to 2 of line tLineNum of me
               set the useBadges of tClickField to true
            end if
            dispatch "renderTree" to tClickField
            break
      end switch
   end if
   -- click at 0,0 # Needed to make field receive "mouseMove" as it loses focus when going to this menu. BUG?
   unlock screen
end menuPick
