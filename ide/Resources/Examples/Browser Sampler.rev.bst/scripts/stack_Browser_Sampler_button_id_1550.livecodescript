Script "stack_Browser_Sampler_button_id_1550"

/*
# Name: button "Go Forward" of card "Basic Navigation" of stack "Browser Sampler"
# ID: button id 1550 of card id 1547 of stack "Browser Sampler"
# Hash: 9QG2oZKcyPIDzc8fLysvQw==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserForward browserId()
end mouseUp
