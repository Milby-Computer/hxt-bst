Script "stack_Font_Loading_Sampler"

/*
# Name: stack "Font Loading Sampler"
# ID: stack "Font Loading Sampler"
# Hash: sVZwWsLKPNzuF9QDLalSEA==
*/


global gMouseChecking
local sHasDividerBeenUsed

function checkHasDividerBeenUsed
  return sHasDividerBeenUsed
end checkHasDividerBeenUsed()

on setHasDividerBeenUsed pFlag
  put pFlag into sHasDividerBeenUsed
end setHasDividerBeenUsed

on doneResizing
  put false into gMouseChecking
  local tRect
  put the rect of this stack into tRect
  local tRight
  put item 3 of tRect into tRight
  local tBottom
  put item 4 of tRect into tBottom
end doneResizing

on CheckMouseState
  put true into gMouseChecking
  if the mouse is up then
    doneResizing
  else
    if "CheckMouseState" is not among the items of the pendingMessages then
      send "CheckMouseState" to me in 10 milliseconds
    end if
  end if
end CheckMouseState
