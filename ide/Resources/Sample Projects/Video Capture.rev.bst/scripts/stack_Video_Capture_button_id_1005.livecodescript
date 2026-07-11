Script "stack_Video_Capture_button_id_1005"

/*
# Name: button "Stop Preview" of card id 1002 of stack "Video Capture"
# ID: button id 1005 of card id 1002 of stack "Video Capture"
# Hash: s7sY8Lj3nPjclfGYh3qKSw==
*/


on mouseUp
  -- declare the variable recordVideo so we can access it
  global recordVideo
  -- allow the user to start recording or previewing
  enable button "start preview"
  enable button "start recording..."
  -- set it to false so that no more previewing will take place
  -- in the handlers contained within the objects on this card
  put false into recordVideo
  -- call the command to stop displaying the preview
  revStopPreviewingVideo
end mouseUp
