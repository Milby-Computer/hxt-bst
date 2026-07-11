Script "stack_Core_Image_Visual_Effects_button_id_5205"

/*
# Name: button "Choose" of group "IMAGE" of group "ciControls" of card "CIDisintegrateWithMaskTransition" of stack "Core Image Visual Effects"
# ID: button id 5205 of group id 5202 of group id 1829 of card id 1050 of stack "Core Image Visual Effects"
# Hash: ah0H9wIQfMzzeXg6HUNPug==
*/


on mouseUp
  answer file "Please choose an image:"
  if it is not empty then
    dropFile it
  end if
end mouseUp
