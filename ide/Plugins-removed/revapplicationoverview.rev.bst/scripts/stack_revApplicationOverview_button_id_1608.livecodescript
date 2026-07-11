Script "stack_revApplicationOverview_button_id_1608"

/*
# Name: button "Audioclip Popup" of bkgnd "common menus" of stack "revApplicationOverview"
# ID: button id 1608 of bkgnd id 1606 of stack "revApplicationOverview"
# Hash: Hdl0u2CVHqdal42G5GSfcA==
*/


on mouseRelease pButton
  if the clickLoc is within the rect of fld "Audioclips" then
    send "mouseDown pButton" to fld "Audioclips"
    send "mouseUp pButton" to fld "Audioclips"
  end if
end mouseRelease

on menuPick pWhich
  global gREVStackName, gREVAudioclips
  put revSelAudioClips() into tAudioclips
  switch pWhich
  case "Property Inspector"
    repeat for each line l in tAudioclips
      send "revBuildPropertyPalette l" to stack "revTemplatePalette"
    end repeat
    break
  case "Edit Script"
    repeat for each line l in tAudioclips
      edit script of l
    end repeat
    break
  case "Play"
    --can't use long id
    repeat for each item i in the hilitedLines of fld "Audioclips"
      play audioclip (item 1 of line i of gREVAudioclips) of stack gREVStackName
    end repeat
    break
  case "Stop"
    play stop
    break
  case "Delete"
    repeat for each line l in tAudioclips
      delete l
    end repeat
    revRefreshAudio true
    
    # OK-2008-03-20
    revSetEdited (the short name of stack gREVStackName)
    break
  end switch
end menuPick
