Script "stack_Browser_Sampler_button_id_1600"

/*
# Name: button "Show Scrollbars" of card "Getting the Browser Image" of stack "Browser Sampler"
# ID: button id 1600 of card id 1593 of stack "Browser Sampler"
# Hash: BcscWw8texV6nob/d1QtuA==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  if the hilite of me then
    revBrowserSet tBrowserId, "scrollbars", true
  else
    revBrowserSet tBrowserId, "scrollbars", false
  end if
end mouseUp
