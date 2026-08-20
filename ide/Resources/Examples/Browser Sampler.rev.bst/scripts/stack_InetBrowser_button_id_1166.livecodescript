Script "stack_InetBrowser_button_id_1166"

/*
# Name: button "Go" of card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: button id 1166 of card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: PM8nakEYCcCT8j1Qo30FLA==
*/


on mouseUp
  gourl
end mouseUp

on gourl 
  abLoadURL fld "browserAddress"
end gourl
