Script "stack_Video_Capture_button_id_1036"

/*
# Name: button "Video Compression..." of group "video for windows" of group "preferences" of card id 1002 of stack "Video Capture"
# ID: button id 1036 of group id 1032 of group id 1029 of card id 1002 of stack "Video Capture"
# Hash: dqeOp8oNd8/f+Jx1dcPH1Q==
*/


on mouseUp
  -- the video grabber component requires us to declare a variable
  -- so that it can return data to it
  local myvar
  -- bring up the system video for windows video compression settings dialog
  revVideoGrabDialog "compression"
  -- capture the settings the user has entered to the variable myVar
  revVideoGrabSettings "myvar"
  -- set the custom property "videoSettings" of this stack to contain the
  -- data returned in the myVar variable
  set the videosettings of this stack to myvar
  -- save this stack so that the next time the user opens it
  -- the same settings will be preserved and loaded in the stack script
  save this stack
end mouseUp
