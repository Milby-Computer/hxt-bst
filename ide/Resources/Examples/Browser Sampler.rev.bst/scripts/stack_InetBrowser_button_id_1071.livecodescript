Script "stack_InetBrowser_button_id_1071"

/*
# Name: button "Forward" of card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: button id 1071 of card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: DxuM9SpzF+3qGp9AgWHbXQ==
*/


on mouseEnter
  set the showBorder of me to true
end mouseEnter

on mouseLeave
  set the showBorder of me to false
end mouseLeave

on mouseUp
  #XBrowser_forward the altBrowserID of this stack
  revBrowserForward the altBrowserId of this stack
end mouseUp
