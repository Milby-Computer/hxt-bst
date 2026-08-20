Script "stack_InetBrowser_button_id_1044"

/*
# Name: button "Back" of card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: button id 1044 of card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: UsErgAB1ndTapAOfQHhQGw==
*/


on mouseEnter
  set the showBorder of me to true
end mouseEnter

on mouseLeave
  set the showBorder of me to false
end mouseLeave

on mouseUp
  #xbrowser_back the altBrowserID of this stack
  revBrowserBack the altBrowserId of this stack
end mouseUp
