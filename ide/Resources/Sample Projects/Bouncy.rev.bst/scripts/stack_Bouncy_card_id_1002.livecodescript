Script "stack_Bouncy_card_id_1002"

/*
# Name: card id 1002 of stack "Bouncy"
# ID: card id 1002 of stack "Bouncy"
# Hash: fzJcDtx16P+57rcjP5rkhw==
*/


local tDragging -- true if dragging the window, false if not
local dx,dy -- the current x and y movement variable
local sx,sy -- the current x and y coordinates of the stack
local cx,cy -- the location at which the user clicked in the stack to start dragging
local sx0,sy0 -- when slingshotting, the start x and y
local tMessage -- the id of the message that moves the window
local tSound -- the path to the sound to play when bouncing
local leftBound,rightBound,bottomBound -- the boundaries to bounce within

-- Bouncy 1.0, copyright 2003 by Geoff Canyon
-- geoff@runrev.com
-- http://www.runrev.com
-- gcanyon@inspiredlogic.com
-- http://www.inspiredlogic.com

on openCard -- startup code
  setMeUp
end openCard

on setMeUp -- set boundaries, etc.
  put the width of this stack div 2 into leftBound
  get the screenrect
  put item 3 of it into screenright
  put item 4 of it into screenbottom
  put screenright - leftBound into rightBound
  put the height of this stack div 2 into sh
  put screenbottom - sh into bottomBound
  put "invitation.aiff" into tSound
end setMeUp

on commandKeyDown pWhat -- if the user presses cmd-c, copy the script
  if pWhat is "c" then 
    set the clipboardData["text"] to the script of me
  else
    pass commandKeyDown
  end if
end commandKeyDown

on dragEnter -- user is dragging something onto bouncy -- accept it
  set the acceptDrop to true
end dragEnter

on dragdrop -- user dropped something on bouncy -- if it is sound or graphic files then handle it
  put the dragdata["files"] into tFileList
  set the itemDelimiter to "."
  repeat for each line L in tFileList
    switch
    case (item -1 of L) is among the words of "aiff wav" 
      put L into tSound
      break
    case item -1 of L is among the words of "gif png"
    --send ("setImage" && L) to me in 10 ticks
    setImage L
    end switch
  end repeat
end dragdrop

on mouseDown -- start dragging the stack
  cancel tMessage
  if leftBound is empty then setMeUp
  get the mouseLoc
  put item 1 of it into cx
  put item 2 of it into cy
  get the loc of this stack
  put item 1 of it into sx
  put item 2 of it into sy
  put sx into sx0
  put sy into sy0
  put true into tDragging
end mouseDown

on mouseMove x,y -- handle dragging if the user is dragging the stack
  if not tDragging then exit mouseMove
  put (x - cx) + (dx div 2) into dx
  add (x - cx) to sx
  put (y - cy) + (dy div 2) into dy
  add (y - cy) to sy
  set the loc of this stack to sx,sy
end mouseMove

on mouseUp -- the mouse button is released
  put false into tDragging
  if the optionKey is "down" then -- clone on option-click
    put "bouncy" && ticks() into tName
    clone this stack
    set the name of it to tName
    put the loc of stack tName into tLoc
    set the loc of stack tName to (item 1 of tLoc),((item 2 of tLoc) - 50)
    send "setMeUp" to this cd of stack tName
    exit mouseUp
  end if
  if the commandKey is "down" then -- re-color on command-click
    choose bucket tool
    put line random(500) of the colorNames into tColor
    set the brushColor to tColor
    click at the clickLoc
    choose browse tool
    exit mouseUp
  end if
  if the shiftKey is "down" then
    put (sx0-sx) div 3 into dx
    put (sy0-sy) div 3 into dy
  end if
  dropme -- otherwise simply release the stack to bounce/be thrown
end mouseUp

on mouseRelease -- the mouse button is released outside the stack; not likely, but being sure.
  put false into tDragging
  dropme
end mouseRelease

on mouseDoubleUp -- double-click to randomly throw the stack. Shift key to do it double-strength
  put -1 * random(30) - 20 into dy
  put random(30) + 20 * (any item of "1,-1") into dx
  if the shiftkey is "down" then
    multiply dx by 2
    multiply dy by 2
  end if
  dropme
end mouseDoubleUp

on closeStack
  stopMoving
end closeStack

on closeStackRequest -- when trying to close, stop moving
  modal stack "splash"
  stopMoving
  pass closeStackRequest
end closeStackRequest

on escapeKey -- use escape to stop all the stacks
  put the windows into tWindowsList
  repeat for each line L in tWindowsList -- may have clones bouncing around
    if word 1 of the short name of stack L is "bouncy" then send "stopMoving" to this cd of stack L
  end repeat
end escapeKey

on stopMoving -- stop any movement and home the stack
  cancel tMessage
  set the loc of this stack to 300,300
end stopMoving

on shapeMe -- shapes the window to an image
    set the windowshape of this stack to the id of image 1
end shapeMe

on playSoundFile -- plays the sound file (for impact)
  if tSound is not empty then play tSound
end playSoundFile

on setImage pFilePath -- shapes to an image and displays it
  put url ("binfile:" & pFilePath) into image 1
  set the width of this stack to the width of image 1
  set the height of this stack to the height of image 1
  set the topleft of image 1 to 0,0
  shapeMe
  setMeUp
end setImage

on dropme -- handle physics to drop the window
  add 1 to dy
  add dx to sx
  add dy to sy
  set the loc of this stack to sx,sy
  if sy > bottomBound then -- hit bottom
    if dy = 1 and dx = 0 then -- stop moving
      exit dropme
    else if dy > 0 then -- check that window is moving down; if moving up don't bounce
      put - dy + 1 into dy
      if dy is not 0 then -- bouncing
        playSoundFile
      else -- rolling on bottom; apply friction to horizontal movement
        put -2 into dy
        if dx > 0 then
          subtract 1 from dx
        else if dx < 0 then
          add 1 to dx
        end if
      end if
    end if
  end if
  if (sx > rightBound and dx > 0) then -- bounce off the right edge
    put -dx + 1 into dx
    if sy > 0 then 
      playSoundFile
    end if
  else if (sx < leftBound and dx < 0) then -- bounce off the left edge
    put -dx - 1 into dx
    if sy > 0 then 
      playSoundFile
    end if
  end if
  send "dropme" to me in 1 tick
  put the result into tMessage
end dropme
