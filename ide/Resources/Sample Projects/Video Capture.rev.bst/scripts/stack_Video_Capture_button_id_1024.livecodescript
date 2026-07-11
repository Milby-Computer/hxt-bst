Script "stack_Video_Capture_button_id_1024"

/*
# Name: button "QuickTime radio" of group "preferences" of card id 1002 of stack "Video Capture"
# ID: button id 1024 of group id 1029 of card id 1002 of stack "Video Capture"
# Hash: Gi4vZ3tsvuaSFs5PEAToiw==
*/


on mouseUp
  -- hide the options that relate only to video for windows
  hide group "video for windows"
  -- show the quicktime settings buttons
  show button "quicktime"
  -- set the height of the group that contains the settings to the amount of space 
  -- the objects in it actually take up plus a margin of 25 pixels
  set the height of group "preferences" to the formattedHeight of group "preferences" + 25
  -- send the closeStack command to this stack to shut down the video grabber
  closeStack
  -- send the openStack command to this stack, which will restart the video grabber
  -- using the new setting - i.e. QuickTime
  openStack
end mouseUp
