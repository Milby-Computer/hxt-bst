Script "stack_Browser_Sampler_button_id_1549"

/*
# Name: button "Go Back" of card "Basic Navigation" of stack "Browser Sampler"
# ID: button id 1549 of card id 1547 of stack "Browser Sampler"
# Hash: FSlslT+pxTczm1bMqhardw==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserBack browserId()
end mouseUp
