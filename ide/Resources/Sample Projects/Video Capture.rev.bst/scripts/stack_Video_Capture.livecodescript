Script "stack_Video_Capture"

/*
# Name: stack "Video Capture"
# ID: stack "Video Capture"
# Hash: obvNeETPWkS5nw4jWK9rqQ==
*/


-- when the stack is opened, but before it is displayed on screen
on preOpenStack
  -- check the platform, if it is not Windows then
  if the platform is not "Win32" then 
    -- disable the Windows specific capture option
    disable btn "Video for Windows radio"
  else
    -- otherwise enable the Windows specific capture option
    enable btn "Video for Windows radio"
  end if
  -- set up the default check video capture radio buttons
  -- by activating the QuickTime check box
  set the hilite of btn "Video for Windows radio" to false
  set the hilite of btn "QuickTime radio" to true
end preOpenStack

-- when the stack has been opened and right after it is
-- displayed on screen
on openStack
  -- read in the rectangluar area of the "video" image
  -- used to place the video capture area
  put rect of image "video" into tRect
  -- check to see if we are to use QuickTime or Video for Windows
  if hilite of button "quicktime radio" is false then
    -- the command to initialize the video grabber, using video for windows
    revInitializeVideoGrabber short name of this stack,"vfw",tRect
  else
    -- the command to initialize the video grabber, using QuickTime
    revInitializeVideoGrabber short name of this stack,"qt",tRect
  end if
  -- set the rectangle area to display the preview in to the variable we
  -- stored earlier
  revSetVideoGrabberRect tRect
  -- the video grabber component requires us to declare a variable to use
  -- to store or retrieve settings
  local myvar
  -- load the videoSettings custom property of this stack into the myVar variable
  put the videoSettings of this stack into myVar
  -- set the video grabber to use the settings we just loaded from the stack
  revSetVideoGrabSettings "myvar"
end openStack

-- send when the stack is closed
on closeStack
  -- declare the variable recordVideo so we can access it
  global recordVideo
  -- set it to false so that no more recording will take place
  -- in the handlers contained within the objects on this card
  put false into recordvideo
  -- call the command to shut down the video grabber component
  revCloseVideoGrabber
end closeStack
