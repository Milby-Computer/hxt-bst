Script "stack_rTreeEngine_button_id_2374"

/*
# Name: button "HorizontalScrollbarBehavior" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2374 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: ngwAt4cilvglcmrJey3wUw==
*/


on mouseMove
   -- Trap
end mouseMove

on dragStart
   -- Trap
end dragStart

on dragMove
   -- Trap
end dragMove

on mouseEnter
   -- set the thumbPosition of me to round(the thumbPosition of me) # Gets rid of decimals.
   -- Trap
end mouseEnter

on mouseDown
   -- put the lockLoc of the owner of me into sLockLoc
   -- set the lockLoc of the owner of me to true
   -- Trap
end mouseDown

on mouseUp
   -- set the lockLoc of the owner of me to sLockLoc
   -- Trap
end mouseUp

on scrollbarDrag newValue
   local tVThumbPosition
   lock screen
   lock messages
   put the thumbposition of scrollbar "verticalScrollbar" of the owner of me into tVThumbPosition
   if tVThumbPosition is empty
   then
      put 0 into tVThumbPosition
   end if
   send "updateTree" && tVThumbPosition & comma & comma & the thumbposition of me to the owner of me
   unlock messages
   lock screen
   pass scrollbarDrag
end scrollbarDrag
