Script "stack_revNewScriptEditor_1_button_id_1094"

/*
# Name: button "Resizer" of card "Main" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: button id 1094 of card id 1002 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: FaQ5FLbVT3/O7Lj9FEaWqg==
*/


constant kCursorResize = 30
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
   put round(the height of me * 0.5) into tOffset
   
   # Basic restrictions on movement
   if item 2 of the mouseLoc + tOffset >= the bottom of this card then
      exit mouseMove
   end if
   
   if the bottom of this card - item 2 of the mouseLoc > sePaneMaximumHeight() then
      exit mouseMove
   end if
   
   # Snap to edges of range if nearby
   local tVerticalLoc
   if item 2 of the mouseLoc + tOffset + kSnapDistance >= the bottom of this card then
      put the bottom of this card - tOffset into tVerticalLoc
   else
      put item 2 of the mouseLoc into tVerticalLoc
   end if
   
   lock screen
   set the loc of me to (item 1 of the loc of me), tVerticalLoc
   sePrefSet "paneHeight", the bottom of this card - the bottom of me
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











