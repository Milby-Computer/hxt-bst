Script "stack_InetBrowser_button_id_1163"

/*
# Name: button "Browser ON" of card "browserTest" of stack "InetBrowser" of stack "Browser Sampler"
# ID: button id 1163 of card id 1002 of stack "InetBrowser" of stack "Browser Sampler"
# Hash: l1NYoaLmxqAtDrr9LqFvyw==
*/


on mouseUp
  toggleBrowserSwitch
end mouseUp

on toggleBrowserSwitch
  if the altBrowserID of this stack is empty then 
    set the label of me to "Browser ON"
    toggleControls "on"
    initAltBrowser
  else
    if the tool contains "pointer" then
      answer "Please choose the browse tool first!"
      exit to top
    end if
    if the hilite of me is false then
      abSuspendBrowser
    else
      abResumeBrowser
    end if
  end if
end toggleBrowserSwitch
