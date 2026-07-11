Script "stack_Core_Image_Visual_Effects_button_id_5137"

/*
# Name: button "Choose" of group "COLOR" of group "ciControls" of card "CIFlashTransition" of stack "Core Image Visual Effects"
# ID: button id 5137 of group id 5135 of group id 1581 of card id 1046 of stack "Core Image Visual Effects"
# Hash: Up/RbX1icizOGCVBSj1Zag==
*/


on mouseUp
  answer color with the ciValue of me
  if it is not empty then
    set the ciValue of me to it
  end if
end mouseUp
