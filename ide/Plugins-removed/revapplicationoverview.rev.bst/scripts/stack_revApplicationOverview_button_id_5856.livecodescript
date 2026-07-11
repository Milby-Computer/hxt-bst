Script "stack_revApplicationOverview_button_id_5856"

/*
# Name: button "No selection control popup" of card "Cards and Controls" of stack "revApplicationOverview"
# ID: button id 5856 of card id 1002 of stack "revApplicationOverview"
# Hash: 7Y6bmXydXXARnzoXUooPvg==
*/


on mouseRelease pButton
  if the clickLoc is within the rect of fld "Controls" then
    send "mouseDown pButton" to fld "Controls"
    send "mouseUp pButton" to fld "Controls"
  end if
end mouseRelease

on menuPick pWhich
  global gREVStackName
  switch pWhich
  case "Paste"
    set the defaultStack to gREVStackName
    paste
    break
  case "Refresh"
    revRefreshControls true, false
    break
  end switch
end menuPick
