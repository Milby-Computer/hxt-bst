Script "stack_livecodeTestInterface_button_id_10872"

/*
# Name: button "ChooseTests" of card "settings" of stack "livecodeTestInterface"
# ID: button id 10872 of card id 10862 of stack "livecodeTestInterface"
# Hash: WsO1oL3tG8MwC7A5vPRtzA==
*/


on mouseUp
   answer folder "Please choose the folder containing the test stacks"
   if the result is not "cancel" then
      put it & "/" into field "test stacks"
   end if
end mouseUp
