Script "stack_Video_Capture_button_id_1033"

/*
# Name: button "Video source..." of group "video for windows" of group "preferences" of card id 1002 of stack "Video Capture"
# ID: button id 1033 of group id 1032 of group id 1029 of card id 1002 of stack "Video Capture"
# Hash: LjW74O8s3c/3ujfVhHiwxA==
*/


on mouseUp
  -- the video grabber component requires us to declare a variable
  -- so that it can return data to it
  local myVar
  -- bring up the system video for windows video source settings dialog
  revVideoGrabDialog "source"
  -- capture the settings the user has entered to the variable myVar
  revVideoGrabSettings "mVvar"
  -- set the custom property "videoSettings" of this stack to contain the
  -- data returned in the myVar variable
  set the videoSettings of this stack to myVar
  -- save this stack so that the next time the user opens it
  -- the same settings will be preserved and loaded in the stack script
  save this stack
end mouseUp
