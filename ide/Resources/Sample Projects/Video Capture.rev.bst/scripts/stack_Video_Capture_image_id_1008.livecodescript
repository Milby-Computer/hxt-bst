Script "stack_Video_Capture_image_id_1008"

/*
# Name: image "video" of card id 1002 of stack "Video Capture"
# ID: image id 1008 of card id 1002 of stack "Video Capture"
# Hash: Te3BIXBKxylBZpD48bjH+A==
*/


on mousedown
  -- move this image underneath the cursor while the mouse is down
  grab me
end mousedown

on mouseup
  -- convert the co-ordinates from being relative to the top left of the window
  -- to being relative to the top left of the screen
  -- this is necessary because the video grabber component works from the top
  -- left of the screen.  the globalLoc function accepts pairs of co-ordinates
  -- so convert the first pair and then the second pair, join the result together
  -- with commas so we now have a rectangle in the variable tRect relative to the screen
  put globalLoc(the topLeft of me),globalLoc(the bottomRight of me) into tRect
  -- set the rectangle area to display the preview in to the variable we
  -- stored earlier
  revSetVideoGrabberRect tRect
end mouseup
