Script "stack_Core_Image_Visual_Effects_button_id_5221"

/*
# Name: button "Choose" of group "COLOR" of group "ciControls" of card "CICopyMachineTransition" of stack "Core Image Visual Effects"
# ID: button id 5221 of group id 5219 of group id 1455 of card id 1044 of stack "Core Image Visual Effects"
# Hash: Up/RbX1icizOGCVBSj1Zag==
*/


on mouseUp
  answer color with the ciValue of me
  if it is not empty then
    set the ciValue of me to it
  end if
end mouseUp
