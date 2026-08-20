Script "stack_Browser_Sampler_button_id_1586"

/*
# Name: button "Get Selected Text" of card "Setting and Getting Selected Text" of stack "Browser Sampler"
# ID: button id 1586 of card id 1584 of stack "Browser Sampler"
# Hash: /PMGFwEMUcTLnoD6AqbFcw==
*/


on mouseUp
  local tBrowserId
  put browserId() into tBrowserId
  if tBrowserId is not an integer then
    exit mouseUp
  end if
  
  local tMsg
  put revBrowserGet(tBrowserId, "selected") into tMsg
   
  answer information tMsg
end mouseUp
