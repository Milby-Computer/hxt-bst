Script "stack_InetBrowser_button_id_1073"

/*
# Name: button "Stop" of card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: button id 1073 of card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: tGsn/TYwd14HteeegqE77A==
*/


on mouseEnter
  set the showBorder of me to true
end mouseEnter

on mouseLeave
  set the showBorder of me to false
end mouseLeave

on mouseUp
  #XBrowser_Stop the altBrowserID of this stack
  revBrowserStop the altBrowserId of this stack
  abIamNotBusy
end mouseUp
