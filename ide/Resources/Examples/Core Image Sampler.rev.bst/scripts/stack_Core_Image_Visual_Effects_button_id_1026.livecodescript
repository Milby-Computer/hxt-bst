Script "stack_Core_Image_Visual_Effects_button_id_1026"

/*
# Name: button "Source File" of group "Destination Drop Zone" of bkgnd "Background" of stack "Core Image Visual Effects"
# ID: button id 1026 of group id 1023 of bkgnd id 1031 of stack "Core Image Visual Effects"
# Hash: ah0H9wIQfMzzeXg6HUNPug==
*/


on mouseUp
  answer file "Please choose an image:"
  if it is not empty then
    dropFile it
  end if
end mouseUp
