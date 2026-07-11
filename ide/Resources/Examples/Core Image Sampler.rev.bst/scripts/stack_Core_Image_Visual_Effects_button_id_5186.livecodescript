Script "stack_Core_Image_Visual_Effects_button_id_5186"

/*
# Name: button "Choose" of group "COLOR" of group "ciControls" of card "CISwipeTransition" of stack "Core Image Visual Effects"
# ID: button id 5186 of group id 5184 of group id 1787 of card id 1049 of stack "Core Image Visual Effects"
# Hash: Up/RbX1icizOGCVBSj1Zag==
*/


on mouseUp
  answer color with the ciValue of me
  if it is not empty then
    set the ciValue of me to it
  end if
end mouseUp
