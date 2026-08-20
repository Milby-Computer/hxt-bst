Script "stack_Untitled_1_button_id_1003"

/*
# Name: button "Button" of card id 1002 of stack "Untitled 1"
# ID: button id 1003 of card id 1002 of stack "Untitled 1"
# Hash: Uf/Ejq7xav6fzqS7nCoCKQ==
*/


on MouseUp
   registerVoiceCommand "next slide"
   registerVoiceCommand "previous slide"
   startListening
   if the result is not empty then
      answer "Could not start listening: " & the result
   end if
end MouseUp
