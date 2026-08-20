Script "stack_Browser_Sampler_button_id_1568"

/*
# Name: button "Go Back" of card "Navigation with Feedback" of stack "Browser Sampler"
# ID: button id 1568 of card id 1574 of stack "Browser Sampler"
# Hash: 5/bKYztUNAQpyhenpkK7pg==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserBack tBrowserId
end mouseUp
