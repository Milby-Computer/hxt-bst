Script "stack_File_Attribs_card_id_1113"

/*
# Name: card "Play Movie" of stack "File Attribs"
# ID: card id 1113 of stack "File Attribs"
# Hash: mIEZKz4qdkDe05BxTRgwxw==
*/


on preOpenCard
end preOpenCard

on openCard
end openCard

on closeCard
   playerDelete
end closeCard

on movieTouched
   play stop
end movieTouched

////////////

on playerCreate
   if "testplayer" is among the lines of iphoneControls() then
      playerDelete
   end if
   
   iphoneControlCreate "player", "testplayer"
   iphoneControlSet "testplayer", "filename", specialFolderPath("engine") & slash & "quicktime.mp4"
   iphoneControlSet "testplayer", "rect", the rect of graphic "PlayerRect"
   iphoneControlSet "testplayer", "opaque", false
   iphoneControlSet "testplayer", "alpha", 127
   iphoneControlSet "testplayer", "backgroundColor", "127,0,0"
   iphoneControlSet "testplayer", "visible", true
end playerCreate

on playerDelete
   iphoneControlDelete "testplayer"
end playerDelete

on playerPlay
   iphoneControlDo "testplayer", "play"
end playerPlay

on playerStop
   iphoneControlDo "testplayer", "stop"
end playerStop

on playerPause
   iphoneControlDo "testplayer", "pause"
end playerPause

on playerSetPreserveAspect
   iphoneControlSet "testplayer", "preserveaspect", the hilite of button "Preserve Aspect"
end playerSetPreserveAspect

on playerSetShowController
   iphoneControlSet "testplayer", "showcontroller", the hilite of button "Show Controller"
end playerSetShowController

on playerSetFullscreen
   iphoneControlSet "testplayer", "fullscreen", the hilite of button "Fullscreen"
end playerSetFullscreen

on playerSetStartTime
   iphoneControlSet "testplayer", "starttime", the thumbPosition of scrollbar "Start Time"
end playerSetStartTime

on playerSetEndTime
   iphoneControlSet "testplayer", "endtime", the thumbPosition of scrollbar "End Time"
end playerSetEndTime

on playerSetCurrentTime
   iphoneControlSet "testplayer", "currenttime", the thumbPosition of scrollbar "Current Time"
end playerSetCurrentTime

on playerSnapshot
   set the name of the templateImage to "snapshot"
   iphoneControlDo "testplayer", "snapshot", the thumbPosition of scrollbar "Current Time", 0, 0
end playerSnapshot

/////////

on playerPropertyAvailable pProperty
   log pProperty && "available"
end playerPropertyAvailable

on playerProgressChanged
   log "progressChanged"
end playerProgressChanged

on playerEnterFullscreen
   log "enterFullscreen"
end playerEnterFullscreen

on playerLeaveFullscreen
   log "leaveFullscreen"
end playerLeaveFullscreen

on playerMovieChanged
   log "movieChanged"
end playerMovieChanged

on playerFinished
   log "finished"
end playerFinished

on playerStopped
   log "stopped"
end playerStopped

on playerError
   log "error"
end playerError

on playerStateChanged
   log "stateChanged"
end playerStateChanged

/////////

on log pMessage
   put pMessage & return before field "Log"
end log
