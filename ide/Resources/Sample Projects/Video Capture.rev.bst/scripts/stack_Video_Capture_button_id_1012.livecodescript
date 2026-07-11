Script "stack_Video_Capture_button_id_1012"

/*
# Name: button "Stop Recording" of card id 1002 of stack "Video Capture"
# ID: button id 1012 of card id 1002 of stack "Video Capture"
# Hash: AhCFiK+2daPxt1jlwls05w==
*/


on mouseUp
  -- declare the variable recordVideo so we can access it
  global recordvideo
  -- allow the user to start recording or previewing
  enable button "start preview"
  enable button "start recording..."
  -- set recordVideo to false so that no more recording will take place
  -- in the handlers contained within the objects on this card
  put false into recordvideo
  -- call the command to stop recording video
  revStopRecordingVideo
end mouseUp
