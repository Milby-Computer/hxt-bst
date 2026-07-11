Script "stack_Mobile_Orientation_Example_group_id_1020"

/*
# Name: group "Allowed Orientations" of card "Main" of stack "Mobile Orientation Example"
# ID: group id 1020 of card id 1002 of stack "Mobile Orientation Example"
# Hash: R/sSLfL8PH7CJH+YymfzPA==
*/


on mouseUp
   get empty
   repeat with i = 1 to the number of buttons of me
      if the hilite of button i of me then
         put the short name of button i of me & comma after it
      end if
   end repeat
   delete the last char of it
   if it is empty then
      get "portrait"
   end if
   iphoneSetAllowedOrientations it
   updateOrientation
end mouseUp
