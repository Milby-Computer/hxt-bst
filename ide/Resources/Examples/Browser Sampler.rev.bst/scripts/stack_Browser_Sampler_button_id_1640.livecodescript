Script "stack_Browser_Sampler_button_id_1640"

/*
# Name: button "Embed a Flash Training viewer" of card "Things to do with revBrowser" of stack "Browser Sampler"
# ID: button id 1640 of card id 1638 of stack "Browser Sampler"
# Hash: jOSJq8qilbdYkCKcsJONLg==
*/


--> all handlers

on mouseUp
  if "FlashDemo" is among the lines of the openStacks then close stack "FlashDemo"
  if "InetBrowser" is among the lines of the openStacks then close stack "InetBrowser"
  closeAllAltBrowser
  set the altHomeURL of stack "FlashDemo" to "http://www.runrev.com/externals/flashexample.php" 
  set the width of stack "FlashDemo" to 1049
  set the height of stack "FlashDemo" to 725
  set the topLeft of stack "FlashDemo" to 100,50
  set the backColor of stack "FlashDemo" to "white"
  go stack "FlashDemo"
  send "resizeStack" to card 1 of stack "FlashDemo" in 1 seconds
end mouseUp
