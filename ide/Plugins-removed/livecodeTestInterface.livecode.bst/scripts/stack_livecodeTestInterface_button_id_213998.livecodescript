Script "stack_livecodeTestInterface_button_id_213998"

/*
# Name: button "ChooseInclude" of card "settings" of stack "livecodeTestInterface"
# ID: button id 213998 of card id 10862 of stack "livecodeTestInterface"
# Hash: mM5hmthOw3Aiw73KERJBHw==
*/


on mouseUp
   answer folder "Please choose the folder containing stacks that may be included in your tests"
   if the result is not "cancel" then
      put it & "/" into field "include"              
   end if
end mouseUp


