Script "stack_Video_Capture_button_id_1017"

/*
# Name: button "Grab image" of card id 1002 of stack "Video Capture"
# ID: button id 1017 of card id 1002 of stack "Video Capture"
# Hash: HsvOXBljwZY63MrpoCxQgw==
*/


on mouseUp
  -- the video grabber component requires us to declare a variable
  -- so that it can return data to it
  local videoImageData
  -- initialize the variable as empty
  put empty into videoimagedata
  -- send the command to grab video using the width and height
  -- of the preview image and the name of the variable we just
  -- declared above as the destination for the image data
  revVideoFrameImage width of image 1, height of image 1,"videoimagedata"
  -- store the image data returned and display it using the "videoImage" image
  -- on the right hand side of the card
  set the imagedata of image "videoimage" to videoimagedata
end mouseUp
