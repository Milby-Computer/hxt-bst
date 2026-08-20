Script "stack_Browser_Sampler_card_id_1584"

/*
# Name: card "Setting and Getting Selected Text" of stack "Browser Sampler"
# ID: card id 1584 of stack "Browser Sampler"
# Hash: cAl8CiqLhDNyKYN8IQn5MQ==
*/


local sBrowserId

function browserId
  return sBrowserId
end browserId

on closeCard
  if the hilite of btn "Browser ON" then
    unhilite btn "Browser ON"
  end if
  set the vScroll of fld "theText" to 0
  pass closeCard
end closeCard

on openCard
  altBrowserOn
  pass openCard
end openCard

on altBrowserOn
  local tWinID
  put the windowid of this stack into tWinID
   
  local tBrowserId
  put revBrowserOpen(tWinId, "http://www.google.com") into tBrowserId
  if tBrowserId is not an integer then
    answer "Failed to open browser: " & tBrowserid
    exit altBrowserOn
  end if
  
  put tBrowserid into sBrowserId
  
  revBrowserSet sBrowserId, "showborder", true
  revBrowserSet sBrowserId, "rect", the rect of image "browserimage"
  
end altBrowserOn

on altBrowserOff
 
  if sBrowserId is an integer then
    revBrowserClose sBrowserId
  end if
  
  put empty into sBrowserId
end altBrowserOff

