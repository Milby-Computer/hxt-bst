Script "stack_Browser_Sampler_button_id_1653"

/*
# Name: button "Show Docs" of bkgnd "bgGrp" of stack "Browser Sampler"
# ID: button id 1653 of bkgnd id 1031 of stack "Browser Sampler"
# Hash: O8H87zUzAOack5dfZQmFXg==
*/


--on mouseEnter
--  set the foreColor of me to 249,156,27
--  set the opaque of me to true
--  set the showBorder of me to true
--end mouseEnter
--
--on mouseLeave
--  set the foreColor of me to 145,152,160
--  set the opaque of me to false
--end mouseLeave

on mouseUp
  --  if "InetBrowser" is among the lines of the openStacks then close stack "InetBrowser"
  --  if "FlashDemo" is among the lines of the openStacks then close stack "FlashDemo"
  --  closeAllAltBrowser
  --  --set the altHomeURL of stack "InetBrowser" to "http://www.altuit.com/webs/altuit2/AltBrowserSub/altBrowser.pdf"
  --  set the altHomeURL of stack "InetBrowser" to "http://www.runrev.com/externals/docs.php"
  --  go stack "InetBrowser" 
  lock cursor
  set the cursor to watch
  revDocumentionOpenDictionary "*browser*"
  unlock cursor
end mouseUp
