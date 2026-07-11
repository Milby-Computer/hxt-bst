Script "stack_DeepMaskSampler"

/*
# Name: stack "DeepMaskSampler"
# ID: stack "DeepMaskSampler"
# Hash: bIDqnGrYISGObXz2FVE80A==
*/


on preOpenStack
  set the topLeft of image 1 to 0, 0
  set the location of this stack to the screenLoc
  set the visible of image 1 to false
  set the windowShape of this stack to the id of image 1
end preOpenStack

on openStack
  set the visible of image 1 to true
end openStack

local sgDragging
local sgOffset

on preOpenStack
  set loc of this stack to the screenLoc
end preOpenStack

on mouseDown
  put true into sgDragging
  put the mouseLoc into sgOffset
end mouseDown

on mouseMove
  if sgDragging then
    set the topLeft of this stack to item 1 of the screenMouseLoc - item 1 of sgOffset, item 2 of the screenMouseLoc - item 2 of sgOffset
  end if
end mouseMove

on mouseUp
  put false into sgDragging
end mouseUp

on mouseRelease
  put false into sgDragging
end mouseRelease
