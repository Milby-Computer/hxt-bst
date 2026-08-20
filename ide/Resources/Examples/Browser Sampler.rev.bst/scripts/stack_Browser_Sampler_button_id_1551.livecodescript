Script "stack_Browser_Sampler_button_id_1551"

/*
# Name: button "Refresh" of card "Basic Navigation" of stack "Browser Sampler"
# ID: button id 1551 of card id 1547 of stack "Browser Sampler"
# Hash: 0SEzKqJDZWQtB5J7CvWWQg==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserRefresh browserId()
end mouseUp
