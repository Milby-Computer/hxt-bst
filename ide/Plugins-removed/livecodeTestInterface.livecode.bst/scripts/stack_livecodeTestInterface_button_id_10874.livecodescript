Script "stack_livecodeTestInterface_button_id_10874"

/*
# Name: button "ChooseInstall" of card "settings" of stack "livecodeTestInterface"
# ID: button id 10874 of card id 10862 of stack "livecodeTestInterface"
# Hash: sgkyt1XGUXcS1dpELQ5U2w==
*/


on mouseUp
   answer folder "Please choose the folder containing your LiveCode versions"
   if the result is not "cancel" then
      put it & "/" into field "lc install"
   end if
end mouseUp
