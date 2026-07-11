Script "stack_Core_Image_Visual_Effects_button_id_1021"

/*
# Name: button "Source File" of group "Source Drop Zone" of bkgnd "Background" of stack "Core Image Visual Effects"
# ID: button id 1021 of group id 1022 of bkgnd id 1031 of stack "Core Image Visual Effects"
# Hash: ah0H9wIQfMzzeXg6HUNPug==
*/


on mouseUp
  answer file "Please choose an image:"
  if it is not empty then
    dropFile it
  end if
end mouseUp
