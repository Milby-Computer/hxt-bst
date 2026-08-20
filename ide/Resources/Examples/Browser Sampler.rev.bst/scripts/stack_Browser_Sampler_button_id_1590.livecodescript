Script "stack_Browser_Sampler_button_id_1590"

/*
# Name: button "Browser ON" of card "Getting the Browser Image" of stack "Browser Sampler"
# ID: button id 1590 of card id 1593 of stack "Browser Sampler"
# Hash: q67kEcWggJT39dcPhaIjVg==
*/


on mouseUp
  if the hilite of me then
    altBrowserOn
  else
    altBrowserOff
  end if
  set the hilite of btn "Show Scrollbars" to false
end mouseUp

