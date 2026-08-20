Script "stack_Browser_Sampler_button_id_1552"

/*
# Name: button "Stop" of card "Basic Navigation" of stack "Browser Sampler"
# ID: button id 1552 of card id 1547 of stack "Browser Sampler"
# Hash: GxwT+NYPJShLC2VRJgMN8Q==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  revBrowserStop browserId()
end mouseUp

