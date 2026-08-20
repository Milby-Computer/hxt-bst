Script "stack_Browser_Sampler_card_id_1131"

/*
# Name: card "Locking Out Domains" of stack "Browser Sampler"
# ID: card id 1131 of stack "Browser Sampler"
# Hash: +2l+sC2O9SKT5rA3sm5RFw==
*/


local sBrowserId

function browserId
  return sBrowserId
end browserId

on browserBeforeNavigate pId, pUrl
  global browserCancel
  if "google.com" is not in pURL then
    answer warning "Won't allow you to go to a domain outside of google.com!"
    put true into browserCancel
  end if
end browserBeforeNavigate


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
  if tBrowserId is not a integer then
    answer "Failed to open browser: " & tBrowserId
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

