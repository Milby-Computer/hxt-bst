Script "stack_Browser_Sampler_button_id_1569"

/*
# Name: button "Go Forward" of card "Navigation with Feedback" of stack "Browser Sampler"
# ID: button id 1569 of card id 1574 of stack "Browser Sampler"
# Hash: ROjwITaKNwtWjkwTbTqzVA==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserForward tBrowserId
end mouseUp
