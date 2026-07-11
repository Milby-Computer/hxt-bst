Script "stack_revNewScriptEditor_1_button_id_56897"

/*
# Name: button "Left Resizer" of card "Main" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: button id 56897 of card id 1002 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: uGGqw4D7UlZ2uRh3o2momg==
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
   if item 1 of the mouseLoc + tOffset >= the right of this card then
      exit mouseMove
   end if
   
   if item 1 of the mouseLoc - tOffset <= the left of this card then
      # OK-2008-11-24 : Bug 7483 - If the user drags the resizer to the left very quickly, then the time taken to process the mouseMove
      # event can mean that by the time the next mouseMove is processed, the mouse is beyond the left edge of the card, but the slider
      # has still not reached it. To fix this, we check that when the mouse is being dragged left of the card, the slider is always in its left-most
      # position.
      if item 1 of the loc of me > (the left of this card + tOffset) then
         lock screen
         set the loc of me to the left of this card + tOffset, item 2 of the loc of me
         sePrefSet "leftSplit", the left of me
         actionResizeStack
         unlock screen
      end if
      exit mouseMove
   end if
   
   # Snap to edges of range if nearby
   local tHorizontalLoc
   if item 1 of the mouseLoc - tOffset - kSnapDistance <= the left of this card then
      put the left of this card + tOffset into tHorizontalLoc
   else
      put item 1 of the mouseLoc into tHorizontalLoc
   end if
   
   lock screen
   set the loc of me to tHorizontalLoc, (item 2 of the loc of me)
   sePrefSet "leftSplit", the left of me
   actionResizeStack
   unlock screen
end mouseMove

on mouseEnter
  lock cursor
  set the cursor to kCursorResize
end mouseEnter

on mouseLeave
  unlock cursor
end mouseLeave











