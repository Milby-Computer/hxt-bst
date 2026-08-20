Script "stack_Browser_Sampler_button_id_1571"

/*
# Name: button "Stop" of card "Navigation with Feedback" of stack "Browser Sampler"
# ID: button id 1571 of card id 1574 of stack "Browser Sampler"
# Hash: I8alLivFe26UjHCWVn4jAw==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserStop tBrowserId
end mouseUp
