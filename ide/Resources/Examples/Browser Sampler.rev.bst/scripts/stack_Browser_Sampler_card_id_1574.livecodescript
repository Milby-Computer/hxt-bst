Script "stack_Browser_Sampler_card_id_1574"

/*
# Name: card "Navigation with Feedback" of stack "Browser Sampler"
# ID: card id 1574 of stack "Browser Sampler"
# Hash: NPcnvuepTcD+ShI19cXIKg==
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
  put "http://www.google.com" into fld "theURL"
  put "" into fld "altStatus"
  pass closeCard
end closeCard

on openCard
  altBrowserOn
  pass openCard
end openCard

on browserBeforeNavigate pId, pUrl
  abIamBusy
end browserBeforeNavigate

on browserDocumentComplete pId, pUrl
  abIamNotBusy
  put pUrl into field "theUrl"
end browserDocumentComplete

on abLoadURL pURL
  if char 1 to 7 of pURL is not "http://" then
    answer warning "Please put 'http://' in front of your URL!"
    exit to top
  end if
   
  if sBrowserId is an integer then
    revBrowserSet sBrowserId, "url", pUrl
  end if
end abLoadURL


on abIamBusy
  set the repeatcount of img "spin.gif" to -1
  put "Accessing page:" && fld "theURL" into fld "altStatus"
end abIamBusy

on abIamNotBusy
  set the repeatcount of img "spin.gif" to 0
  set the currentframe of img "spin.gif" to 1
  put "Finished" into fld "altStatus"
end abIamNotBusy

on mouseEnter
  pass mouseEnter
end mouseEnter

on altBrowserOn
  local tWinID
  put the windowid of this stack into tWinID
   
  local tBrowserId
  put revBrowserOpen(tWinID, "http://www.google.com") into tBrowserId
  if tBrowserId is not an integer then
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


