Script "stack_Core_Image_Visual_Effects_button_id_5249"

/*
# Name: button "Choose" of group "IMAGE" of group "ciControls" of card "CIPageCurlTransition" of stack "Core Image Visual Effects"
# ID: button id 5249 of group id 5246 of group id 1051 of card id 1043 of stack "Core Image Visual Effects"
# Hash: ah0H9wIQfMzzeXg6HUNPug==
*/


on mouseUp
  answer file "Please choose an image:"
  if it is not empty then
    dropFile it
  end if
end mouseUp
