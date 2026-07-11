Script "stack_Core_Image_Visual_Effects_button_id_1482"

/*
# Name: button "Choose" of group "COLOR" of card "Control Haven" of stack "Core Image Visual Effects"
# ID: button id 1482 of group id 1483 of card id 1034 of stack "Core Image Visual Effects"
# Hash: Up/RbX1icizOGCVBSj1Zag==
*/


on mouseUp
  answer color with the ciValue of me
  if it is not empty then
    set the ciValue of me to it
  end if
end mouseUp
