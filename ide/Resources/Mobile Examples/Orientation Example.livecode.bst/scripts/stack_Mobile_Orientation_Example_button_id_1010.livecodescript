Script "stack_Mobile_Orientation_Example_button_id_1010"

/*
# Name: button "Lock Orientation" of card "Main" of stack "Mobile Orientation Example"
# ID: button id 1010 of card id 1002 of stack "Mobile Orientation Example"
# Hash: kPjgQ/K68cwsZ2ijrqznaw==
*/


on mouseUp
   if the hilite of me then
      iphoneLockOrientation
   else
      iphoneUnlockOrientation
   end if
   updateOrientation
end mouseUp
