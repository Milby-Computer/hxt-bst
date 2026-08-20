Script "stack_Browser_Sampler_card_id_1547"

/*
# Name: card "Basic Navigation" of stack "Browser Sampler"
# ID: card id 1547 of stack "Browser Sampler"
# Hash: S0UxX3O7aREY87oc4RfMQA==
*/


local sBrowserId

on closeCard
  if the hilite of btn "Browser ON" then
    unhilite btn "Browser ON"
  end if
  set the vScroll of fld "theText" to 0
  put "http://www.google.com" into fld "theURL"
  pass closeCard
end closeCard

on openCard
  altBrowserOn
  pass openCard
end openCard

on mouseEnter
  pass mouseEnter
end mouseEnter

on altBrowserOn
  local tWinID
  put the windowid of this stack into tWinID
   
  local tBrowserId
  put revBrowserOpen(tWinId, "http://www.google.com") into tBrowserId
  if tBrowserId is not an integer then
    answer "Error opening browser: " & tBrowserId
    exit altBrowserOn
  end if
  
  put tBrowserId into sBrowserId
  revBrowserSet sBrowserId, "showborder", true
  revBrowserSet sBrowserid, "rect", the rect of image "browserimage"
end altBrowserOn

on altBrowserOff
  if sBrowserId is an integer then
    revBrowserClose sBrowserId
  end if
  put empty into sBrowserId
end altBrowserOff

# Because buttons call the revBrowser commands directly, they need access to the browser id
function browserId
  return sBrowserId
end browserId

