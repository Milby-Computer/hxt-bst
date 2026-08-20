Script "stack_Browser_Sampler_button_id_1554"

/*
# Name: button "GO" of card "Basic Navigation" of stack "Browser Sampler"
# ID: button id 1554 of card id 1547 of stack "Browser Sampler"
# Hash: vvtyBRuA8CR0Sdz8tV3C7w==
*/


on mouseUp
  abLoadURL fld "theURL"
end mouseUp

on abLoadURL pURL
  if char 1 to 7 of pURL is not "http://" then
    answer warning "Please put 'http://' in front of your URL!"
    exit to top
  end if
   
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit abLoadUrl
  end if
  
  revBrowserSet tBrowserId, "url", pUrl
end abLoadURL


