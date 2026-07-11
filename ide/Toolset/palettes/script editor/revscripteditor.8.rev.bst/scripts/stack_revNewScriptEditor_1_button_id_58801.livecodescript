Script "stack_revNewScriptEditor_1_button_id_58801"

/*
# Name: button "Vertical Splitter" of group "Tree Template" of card "Templates" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: button id 58801 of group id 57774 of card id 2609 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: EQ7tOlNkzw6T6uqXhKZesA==
*/


constant kCursorResize = 31
constant kSnapDistance = 20

local sMouseDown = "false"
  
on mouseDown
  put true into sMouseDown
end mouseDown

on mouseUp
  put false into sMouseDown
end mouseUp

on mouseRelease
  put false into sMouseDown
end mouseRelease

on mouseMove
   if not sMouseDown then
      exit mouseMove
   end if
   
   local tOffset
   put round(the width of me * 0.5) into tOffset
   
   # Basic restrictions on movement
   if item 1 of the mouseLoc + tOffset >= the right of the owner of me - 25 then
      exit mouseMove
   end if
   
   if item 1 of the mouseLoc - tOffset <= the left of the owner of me + 25 then
      exit mouseMove
   end if
   
   # Snap to edges of range if nearby
   local tHorizontalLoc
   if item 1 of the mouseLoc - tOffset - kSnapDistance <= the left of the owner of me then
      put the left of the owner of me + tOffset into tHorizontalLoc
   else
      put item 1 of the mouseLoc into tHorizontalLoc
   end if
   
   lock screen
   set the loc of me to tHorizontalLoc, (item 2 of the loc of me)
   setVerticalSplit the left of me
   resize
   unlock screen
end mouseMove

on mouseEnter
  lock cursor
  set the cursor to kCursorResize
end mouseEnter

on mouseLeave
  unlock cursor
end mouseLeave
