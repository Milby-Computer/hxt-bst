Script "stack_Zip_Extract_Sampler_button_id_1009"

/*
# Name: button "Clear" of card "Main" of stack "Zip Extract Sampler"
# ID: button id 1009 of card id 1002 of stack "Zip Extract Sampler"
# Hash: lt7efZVCDj3QPwVqbiqPNw==
*/


on mouseUp
  -- Clear the file list and show the instruction label
  put empty into field "Files"
  labelShow
end mouseUp
