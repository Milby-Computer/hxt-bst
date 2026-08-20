Script "stack_Browser_Sampler_button_id_1537"

/*
# Name: button "Launch Browser" of card "Introduction" of stack "Browser Sampler"
# ID: button id 1537 of card id 1002 of stack "Browser Sampler"
# Hash: znq6MlGy6uUNyvryq4ZeAw==
*/


--> all handlers

on mouseUp
  if "InetBrowser" is not among the lines of the openStacks then
    set the altHomeURL of stack "InetBrowser" to "http://www.runrev.com"
    go stack "InetBrowser"
  end if
end mouseUp
