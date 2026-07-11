Script "stack_Video_Capture_button_id_1034"

/*
# Name: button "Video display..." of group "video for windows" of group "preferences" of card id 1002 of stack "Video Capture"
# ID: button id 1034 of group id 1032 of group id 1029 of card id 1002 of stack "Video Capture"
# Hash: 2oqJ/1y72JvOwXd7xXLGSg==
*/


on mouseUp
  -- the video grabber component requires us to declare a variable
  -- so that it can return data to it
  local myvar
  -- bring up the system video for windows video display settings dialog
  revVideoGrabDialog "display"
  -- capture the settings the user has entered to the variable myVar
  revVideoGrabSettings "myvar"
  -- set the custom property "videoSettings" of this stack to contain the
  -- data returned in the myVar variable
  set the videosettings of this stack to myvar
  -- save this stack so that the next time the user opens it
  -- the same settings will be preserved and loaded in the stack script
  save this stack
end mouseUp
