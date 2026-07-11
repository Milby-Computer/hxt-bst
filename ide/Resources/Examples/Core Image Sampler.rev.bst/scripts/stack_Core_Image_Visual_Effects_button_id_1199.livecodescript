Script "stack_Core_Image_Visual_Effects_button_id_1199"

/*
# Name: button "Choose" of group "IMAGE" of card "Control Haven" of stack "Core Image Visual Effects"
# ID: button id 1199 of group id 1068 of card id 1034 of stack "Core Image Visual Effects"
# Hash: ah0H9wIQfMzzeXg6HUNPug==
*/


on mouseUp
  answer file "Please choose an image:"
  if it is not empty then
    dropFile it
  end if
end mouseUp
