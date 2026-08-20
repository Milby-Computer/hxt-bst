Script "stack_Browser_Sampler_button_id_1587"

/*
# Name: button "Set Selected Text" of card "Setting and Getting Selected Text" of stack "Browser Sampler"
# ID: button id 1587 of card id 1584 of stack "Browser Sampler"
# Hash: NJyoNjT13IPmmqr9v/rROg==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  ask "String to Select"
  revBrowserSet tBrowserId, "selected", it
end mouseUp
