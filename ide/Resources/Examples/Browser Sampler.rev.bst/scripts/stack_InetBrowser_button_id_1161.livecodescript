Script "stack_InetBrowser_button_id_1161"

/*
# Name: button "Home" of card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: button id 1161 of card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: 51W9PuIelx4Lgna6k+q6kA==
*/


on mouseEnter
  set the showBorder of me to true
end mouseEnter

on mouseLeave
  set the showBorder of me to false
end mouseLeave

on mouseUp
    abLoadURL the altHomeURL of this stack
end mouseUp
