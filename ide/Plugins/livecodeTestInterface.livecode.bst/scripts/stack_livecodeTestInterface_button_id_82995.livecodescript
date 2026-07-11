Script "stack_livecodeTestInterface_button_id_82995"

/*
# Name: button "ChooseFruitstrap" of card "settings" of stack "livecodeTestInterface"
# ID: button id 82995 of card id 10862 of stack "livecodeTestInterface"
# Hash: tFK4/HWgdVVbnDGJIUKeow==
*/


on mouseUp
   local tFruitStrap
   answer folder "Please choose the folder containing your Fruitstrap installation"
   if the result is not "cancel" then
      put it & "/fruitstrap" into tFruitStrap
      if there is a file tFruitStrap then
         put tFruitStrap into field "fruitstrap location"
      else
         put empty into field "fruitstrap location"
      end if
   end if
end mouseUp
