Script "stack_Video_Capture_button_id_1009"

/*
# Name: button "Start Preview" of card id 1002 of stack "Video Capture"
# ID: button id 1009 of card id 1002 of stack "Video Capture"
# Hash: ZBMs2bLUaMM+/IXzxXTkGw==
*/


on mouseUp
  -- declare the variable recordVideo so we can access it
  global recordvideo
  -- don't allow the user to start recording on previewing
  -- while this is in progress
  disable button "start preview"
  disable button "start recording..."
  -- call the command to start previewing video
  revPreviewVideo
  -- store the fact that we are now displaying video in a variable
  -- so that the other objects can stop the display
  put true into recordvideo
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
