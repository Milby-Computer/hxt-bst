Script "stack_revApplicationOverview_button_id_1609"

/*
# Name: button "VideoClip Popup" of bkgnd "common menus" of stack "revApplicationOverview"
# ID: button id 1609 of bkgnd id 1606 of stack "revApplicationOverview"
# Hash: iaAmX1AUV5JGDcNw1n5tVg==
*/


on mouseRelease pButton
  if the clickLoc is within the rect of fld "Videoclips" then
    send "mouseDown pButton" to fld "Videoclips"
    send "mouseUp pButton" to fld "Videoclips"
  end if
end mouseRelease

on menuPick pWhich
  global gREVStackName, gREVvideoclips
  put revSelvideoclips() into tvideoclips
  switch pWhich
  case "Property Inspector"
    repeat for each line l in tvideoclips
      send "revBuildPropertyPalette l" to stack "revTemplatePalette"
    end repeat
    break
  case "Edit Script"
    repeat for each line l in tvideoclips
      edit script of l
    end repeat
    break
  case "Play"
    --can't use long id
    choose browse tool
    repeat for each item i in the hilitedLines of fld "videoclips"
      play videoclip (item 1 of line i of gREVvideoclips) of stack gREVStackName
    end repeat
    break
  case "Stop"
    play stop
    break
  case "Delete"
    repeat for each line l in tvideoclips
      delete l
    end repeat
    revRefreshVideo true
    
    # OK-2008-03-20: Bug 6158
    revSetEdited (the short name of stack gREVStackName)
    
    break
  end switch
end menuPick
