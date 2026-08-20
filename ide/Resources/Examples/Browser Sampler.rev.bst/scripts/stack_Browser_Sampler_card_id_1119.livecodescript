Script "stack_Browser_Sampler_card_id_1119"

/*
# Name: card "A Simple Browser" of stack "Browser Sampler"
# ID: card id 1119 of stack "Browser Sampler"
# Hash: rSUfusXg7cBcMEGIszKAxA==
*/


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

local sBrowserId

on altBrowserOn
  local tWindowId
  put the windowid of this stack into tWindowId
  
  local tBrowserId
  put revBrowserOpen(tWindowId, "http://www.google.com") into tBrowserId
  if tBrowserId is not an integer then
    answer "Error opening browser: " & tBrowserId
    exit altBrowserOn
  end if
  
  put tBrowserId into sBrowserId
  
  revBrowserSet sBrowserId, "showborder", true
  revBrowserSet sBrowserId, "rect", the rect of image "browserimage"
  
end altBrowserOn

on altBrowserOff
  if sBrowserId is an integer then
    revBrowserClose sBrowserId
  end if
  put empty into sBrowserId
end altBrowserOff
