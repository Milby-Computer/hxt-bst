Script "stack_Video_Capture_button_id_1025"

/*
# Name: button "Video For Windows radio" of group "preferences" of card id 1002 of stack "Video Capture"
# ID: button id 1025 of group id 1029 of card id 1002 of stack "Video Capture"
# Hash: 2FDyCT7KGM1fEQ9nR9cZDA==
*/


on mouseUp
  -- hide the options that relate only to QuickTime
  hide button "quicktime"
  -- show the video for window settings buttons
  show group "video for windows"
  -- set the height of the group that contains the settings to the amount of space 
  -- the objects in it actually take up plus a margin of 25 pixels
  set the height of group "preferences" to the formattedHeight of group "preferences" + 25
  -- send the closeStack command to this stack to shut down the video grabber
  closeStack
  -- send the openStack command to this stack, which will restart the video grabber
  -- using the new setting - i.e. Video for Windows
  openStack
end mouseUp
