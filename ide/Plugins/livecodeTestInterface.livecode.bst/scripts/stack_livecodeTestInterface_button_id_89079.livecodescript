Script "stack_livecodeTestInterface_button_id_89079"

/*
# Name: button "ChooseGithub" of card "settings" of stack "livecodeTestInterface"
# ID: button id 89079 of card id 10862 of stack "livecodeTestInterface"
# Hash: PnDxXYbLJbA8Y09KN4aWFA==
*/


on mouseUp
   answer folder "Please choose the folder containing your LiveCode Git Hub repository"
   if the result is not "cancel" then
      put it & "/" into field "github"
   end if
end mouseUp
