Script "stack_livecodeTestInterface_button_id_247423"

/*
# Name: button "ChooseEvalDatabase" of card "settings" of stack "livecodeTestInterface"
# ID: button id 247423 of card id 10862 of stack "livecodeTestInterface"
# Hash: Rrr29j+i9cNWAIVEcbAGBg==
*/


on mouseUp
   answer folder "Please choose the folder that is to hold the evaluation database files"
   if the result is not "cancel" then
      put it & "/" into field "eval database"              
   end if
end mouseUp


