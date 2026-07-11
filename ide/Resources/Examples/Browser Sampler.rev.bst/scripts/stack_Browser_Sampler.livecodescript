Script "stack_Browser_Sampler"

/*
# Name: stack "Browser Sampler"
# ID: stack "Browser Sampler"
# Hash: T+DrsbArdO9HzU0jPkyXzQ==
*/


global gEmail,gRegCode

on linkClicked pURL
  if char 1 to 7 of pURL is "http://" then 
    revGoURL pURL
  else if pUrl is "documentation" then
    lock cursor
    set the cursor to watch
    start using stack "Documentation Library" of stack "revDocs"
    docOpenDictionaryWithFilter "*browser*"
    unlock cursor
  else
    start using stack "Documentation Library" of stack "revDocs"
    docGo pUrl
  end if
end linkClicked

on doIt
  
end doIt

on closeCard
  closeAllAltBrowser
end closeCard

on closeAllAltBrowser
  if "InetBrowser" is among the lines of the openStacks then close stack "InetBrowser"
  if "FlashDemo" is among the lines of the openStacks then close stack "FlashDemo"
  local tInstanceItems
  put revBrowserInstances() into tInstanceItems
  repeat for each item tInstance in tInstanceItems 
    revBrowserClose tInstance
  end repeat
end closeAllAltBrowser

on initMe
    # stripAndShip
    initCardCount
    #set the linkColor of this stack to 249,156,127
    #set the linkVisitedColor of this stack to 229,136,107
    #start using stack "hiddenStuff"
    #initAltBrowser
    #stop using stack "hiddenStuff"
end initMe

on initCardCount
  local tList
  repeat with x = 1 to the number of cds in this stack
    put the short name of cd x & cr into tList
  end repeat
  delete last char of tList
  set the altCardNames of me to tList
  set the altSliderMaxVal of img "slider.png" of grp "ChapterSlider" to the number of cds in this stack
  set the altValue of fld "sliderValue" of grp "ChapterSlider" to 1
end initCardCount

on stripAndShip
   
  --> altLicense STUFF
   
  set the cursor to busy
  lock screen
  lock messages
  local tTxtIsLocked
  if the shiftKey is down then
    put true into tTxtIsLocked
    show grp "debug"
  else
    put false into tTxtIsLocked
    hide grp "debug"
  end if
  
  local tW, tL, tW2, tL2, tT2
  put "" into tW
  put "" into tL
  put "" into tW2
  put "" into tL2
  put "" into tT2
  repeat with x=1 to the number of cds in this stack
    set the cursor to busy
    go cd x
    if there is a fld "theText" then 
      set the vScroll of fld "theText" to 0
      set the script of fld "theText" to ""
      if tW2 is "" then
        put the width of fld "theText" into tW2
      else
        set the width of fld "theText" to tW2
      end if
      if tL2 is "" then
        put the left of fld "theText" into tL2
      else
        set the left of fld "theText" to tL2
      end if
      if tT2 is "" then 
        put the top of fld "theText" into tT2
      else
        set the top of fld "theText" to tT2
      end if
       
    end if
    if tTxtIsLocked is not "" then
      set the lockText of fld "theText" to not tTxtIsLocked
      set the showfocusborder of fld "theText" to false
      if there is a fld "Sample" then 
        set the lockText of fld "Sample" to not tTxtIsLocked
        set the showfocusborder of fld "Sample" to false
      end if
    end if
    if there is a fld "Users" then
      if the platForm is "MacOS" then
        set the hiliteColor of fld "Users" to ""
      else
        set the hiliteColor of fld "Users" to 12,0,0
      end if
      set the width of fld "Users" to tW2
      set the left of fld "Users" to tL2
    end if
    if there is a fld "Apps" then
      if the platForm is "MacOS" then
        set the hiliteColor of fld "Apps" to ""
      else
        set the hiliteColor of fld "Apps" to 12,0,0
      end if
      set the width of fld "Apps" to tW2
      set the left of fld "Apps" to tL2
    end if
    if there is a fld "Sample" then
      set the vScroll of fld "Sample" to 0
      if tW2 is "" then
        put the width of fld "Sample" into tW2
      else
        set the width of fld "Sample" to tW2
      end if
      if tL2 is "" then
        put the left of fld "Sample" into tL2
      else
        set the left of fld "Sample" to tL2
      end if
    end if
  end repeat
  set the altValue of fld "sliderValue" of grp "ChapterSlider" to 1
  unlock messages
  go cd 1
  unlock screen
  set the defaultcursor to arrow
  --> CHAPTER SLIDER STUFF
  set the altValue of fld "sliderValue" of grp "ChapterSlider" to 1
  
  set the altSliderMaxVal of image "slider.png" to the number of cards in this stack
   
  --> STACK SPECIFIC STUFF
   
   
   
   
end stripAndShip

on preOpenCard
--    if the owner of the target is me then
--        set the vis of btn "Show Script" to there is a fld "Sample"
--    end if
end preOpenCard

on mouseDoubleUp
  local tTarget
  put the target into tTarget
  if tTarget contains "field" then Viewer the htmltext of tTarget
end mouseDoubleUp

on Viewer pHTM
  exit Viewer
  local tTitle, tR, tT, tLoc
  put the short name of this cd into tTitle
  put the right of this stack into tR
  put the top of this stack into tT
  if "Viewer" is not among the lines of the openStacks then
    put the loc of this stack into tLoc
    open inv stack "Viewer"
    set the topLeft of stack "Viewer" to tR-350,tT+100
    put tTitle into fld "title"
    set the htmlText of fld "viewer" to pHTM
    local tH
    put the formattedHeight of fld "viewer" into tH
    put tH - 198 into tH
    if tH > 0 then
      local tMaxH, tTop
      put item 4 of the windowBoundingRect - the top of stack "Viewer" -50 into tMaxH
      put the top of stack "Viewer" into tTop
      set the height of stack "Viewer" to min(tH+248,tMaxH)
      set the topLeft of stack "Viewer" to tR-350,tTop
    end if
    #modeless stack "Viewer"
    show stack "Viewer"
    #resizeStack
  else
    go stack "Viewer"
    put tTitle into fld "title" of stack "Viewer"
    set the htmlText of fld "viewer" of stack "Viewer" to pHTM
  end if
  select before char 1 of fld "viewer" of stack "Viewer"
end Viewer
