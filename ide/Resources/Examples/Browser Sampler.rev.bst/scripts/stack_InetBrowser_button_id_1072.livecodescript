Script "stack_InetBrowser_button_id_1072"

/*
# Name: button "Refresh" of card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: button id 1072 of card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: iwHuY0mj92b5NlNyeCTWxQ==
*/


on mouseEnter
  set the showBorder of me to true
end mouseEnter

on mouseLeave
  set the showBorder of me to false
end mouseLeave

on mouseUp
  #XBrowser_refresh the altBrowserID of this stack
  revBrowserRefresh the altBrowserID of this stack
end mouseUp
