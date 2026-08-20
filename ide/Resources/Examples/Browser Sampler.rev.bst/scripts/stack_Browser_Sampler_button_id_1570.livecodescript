Script "stack_Browser_Sampler_button_id_1570"

/*
# Name: button "Refresh" of card "Navigation with Feedback" of stack "Browser Sampler"
# ID: button id 1570 of card id 1574 of stack "Browser Sampler"
# Hash: HWdHBa08rHW8fhEDyjoQSQ==
*/


--on mouseUp
--     put fld "theURL" into tURL
--     abLoadURL tURL
--end mouseUp

on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserRefresh tBrowserId
end mouseUp
