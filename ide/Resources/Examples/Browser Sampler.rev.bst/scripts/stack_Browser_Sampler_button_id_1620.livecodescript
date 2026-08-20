Script "stack_Browser_Sampler_button_id_1620"

/*
# Name: button "Browser 2 ON" of card "Multiple Instances" of stack "Browser Sampler"
# ID: button id 1620 of card id 1617 of stack "Browser Sampler"
# Hash: OpUqqmBGTGwPcXePo6tLDg==
*/


on mouseUp
  if the hilite of me then
    altBrowserOn
  else
    altBrowserOff the altBrowserID of me
  end if
end mouseUp

on altBrowserOn
  local tWinID
  put the windowid of this stack into tWinID
   
  local tBrowserID
  put revBrowserOpen(tWinID, "http://www.google.com") into tBrowserId
  if tBrowserID contains "error" or tBrowserId is not an integer then
    answer "Failed to open browser: " & tBrowserId
    exit altBrowserOn
  end if
  
  set the altBrowserID of me to tBrowserID
  isBusy tBrowserID
  
  revBrowserSet tBrowserId, "showborder", true
  revBrowserSet tBrowserId, "rect", the rect of image "browserimage2"
  
  get the label of me
  put "ON" into word -1 of it
  set the label of me to it
end altBrowserOn

on altBrowserOff pID
  isNotBusy pID
  revBrowserClose pId
  set the altBrowserID of me to empty
  
  get the label of me
  put "OFF" into word -1 of it
  set the label of me to it
end altBrowserOff


