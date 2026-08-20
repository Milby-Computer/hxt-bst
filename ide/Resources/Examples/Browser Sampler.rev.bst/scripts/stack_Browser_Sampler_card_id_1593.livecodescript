Script "stack_Browser_Sampler_card_id_1593"

/*
# Name: card "Getting the Browser Image" of stack "Browser Sampler"
# ID: card id 1593 of stack "Browser Sampler"
# Hash: ibjjOGdSrw7GeRUfCWbnYg==
*/


local sBrowserId

function browserId
  return sBrowserId
end browserId

on closeCard
  if the hilite of btn "Browser ON" then
    unhilite btn "Browser ON"
    unhilite btn "Show Scrollbars"
  end if
  set the vScroll of fld "theText" to 0
  fillImage the id of img "thumbnail","0,0,0"
  pass closeCard
end closeCard

on openCard
  altBrowserOn
  pass openCard
end openCard

on mouseEnter
  pass mouseEnter
end mouseEnter


on FillImage imgID,RGB
  
  local newImageData,tPos,timagedatalength,timagedata,R,G,B
  put item 1 of RGB into R
  put item 2 of RGB into G
  put item 3 of RGB into B
  put 0 into tPos
  put the length of imagedata of img id imgID/4 into timagedatalength
  put imagedata of img id imgID into timagedata
  
  if the platform is "MacOS" or version()>"2.4.2" then
    repeat for timagedatalength times
      put tPos + 4 into tPos
      put binaryEncode("CCCC",0,R,G,B) after newImageData
    end repeat
  else
    repeat for timagedatalength times
      put tPos + 4 into tPos
      put binaryEncode("CCCC",B,G,R,0) after newImageData
    end repeat
  end if
  
  set the imageData of img id imgID to newImageData
  
end FillImage

on altBrowserOn
  local tWinID
  put the windowid of this stack into tWinID
   
  local tBrowserId
  put revBrowserOpen(tWinId, "http://www.google.com") into tBrowserId
  if tBrowserId is not an integer then
    answer "Failed to open browser: " & tBrowserId
    exit altBrowserOn
  end if
   
  put tBrowserId into sBrowserId
  revBrowserSet sBrowserId, "showborder", true
  revBrowserSet sBrowserId, "rect", the rect of image "browserimage"
  
  if the platform is "MacOS" then
    send "altBrowserDisableScrollbars" to me in 1 second
  else
    revBrowserSet sBrowserId, "scrollbars", false
  end if
end altBrowserOn

on altBrowserOff
  if sBrowserId is an integer then
    revBrowserClose sBrowserId
  end if
end altBrowserOff

on altBrowserDisableScrollbars
  if the short name of this card is not the short name of me then
    exit top top
  end if
  if sBrowserId is an integer then
    revBrowserSet sBrowserId, "scrollbars", false
    set the hilite of button "Show Scrollbars" of me to false
  end if
end altBrowserDisableScrollbars




