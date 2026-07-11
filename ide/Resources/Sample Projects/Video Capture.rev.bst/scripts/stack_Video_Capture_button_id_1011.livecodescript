Script "stack_Video_Capture_button_id_1011"

/*
# Name: button "Start Recording..." of card id 1002 of stack "Video Capture"
# ID: button id 1011 of card id 1002 of stack "Video Capture"
# Hash: tnEs+TSxbQLzYOav7FHwsw==
*/


on mouseUp
  -- declare the variable recordVideo so we can access it
  global recordvideo
  -- don't allow the user to start recording on previewing
  -- while this is in progress
  disable button "start preview"
  disable button "start recording..."
  -- store the fact that we are now recording video in a variable
  -- so that the other objects can stop the recording
  put true into recordvideo
  -- check if we are using quickTime
  -- if we are not, then bring up the standard system save as dialog
  -- with the file types displayed using the video for windows ".avi" extension
  if hilite of button "quicktime radio" is false then ask file "record video to file:" with filter "*.avi"
  -- otherwise bring up the save as dialog with the file types displayed
  -- the quicktime ".mov" extension
else ask file "record video to file:" with filter "*.mov"
-- if a file is chosen, activate the command to direct video recording
-- to that file
if it is not empty then
  -- it contains the file path returned from the save as dialog
  revRecordVideo it
end if
-- check if we are using quickTime
if hilite of button "quicktime radio" is true then
  -- if we are then we have to run this repeat loop while the global
  -- variable we set above is true
  -- because quicktime requires processor time to be given to it
  -- when capturing video
  repeat while recordvideo is true
    -- give processor time
    revVideoGrabIdle
    -- allow other processes the chance to run
    -- needed to allow the user to click "stop preview"
    -- which will set the recordVideo handler to false
    -- and thus exit this repeat loop
    wait for 1 millisecond with messages
  end repeat
end if
end mouseUp
