Script "stack_rTreeEngine_button_id_2148"

/*
# Name: button "VerticalScrollbarBehavior" of card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: button id 2148 of card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: NYfG/Yj8+twZ9dT9JiNM0w==
*/


global gMs
local sThumbPos
local sLockLoc

on mouseMove
   -- Trap
end mouseMove

on dragStart
   -- Trap
end dragStart

on dragMove
   -- Trap
   -- pass dragMove
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

on scrollbarDrag newValue
   -- if newValue <> sThumbPos
   -- then
      -- put the millisec into gMs
      send "updateTree" && newValue to the owner of me
   -- end if
   -- put newValue into sThumbPos
end scrollbarDrag

on mouseUp
   -- set the lockLoc of the owner of me to sLockLoc
   -- Trap
end mouseUp
