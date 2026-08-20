Script "stack_Browser_Sampler_button_id_1639"

/*
# Name: button "Embed a PDF document Help file" of card "Things to do with revBrowser" of stack "Browser Sampler"
# ID: button id 1639 of card id 1638 of stack "Browser Sampler"
# Hash: JszfJBY7RvtIrWk+cCL/gw==
*/


on mouseUp
    if "InetBrowser" is among the lines of the openStacks then close stack "InetBrowser"
    if "FlashDemo" is among the lines of the openStacks then close stack "FlashDemo"
    closeAllAltBrowser
    set the altHomeURL of stack "InetBrowser" to "http://support.runrev.com/tutorials/videos/sharing.pdf"
    go stack "InetBrowser" 
end mouseUp
