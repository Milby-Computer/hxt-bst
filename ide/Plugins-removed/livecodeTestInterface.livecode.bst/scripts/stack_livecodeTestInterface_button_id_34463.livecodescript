Script "stack_livecodeTestInterface_button_id_34463"

/*
# Name: button "ChooseOutput" of card "settings" of stack "livecodeTestInterface"
# ID: button id 34463 of card id 10862 of stack "livecodeTestInterface"
# Hash: DrqCDfHvk8FvfiDW8IiOSQ==
*/


on mouseUp
   answer folder "Please choose the folder containing your LiveCode versions"
   if the result is not "cancel" then
      put it & "/" into field "test output"              
   end if
end mouseUp


