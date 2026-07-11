Script "stack_Zip_Build_Sampler_button_id_1007"

/*
# Name: button "Clear" of card "Main" of stack "Zip Build Sampler"
# ID: button id 1007 of card id 1002 of stack "Zip Build Sampler"
# Hash: 6HzxDica5BZm03TY89Q4KQ==
*/


on mouseUp
  -- Clear the files list and show the instruction label
  put empty into field "Files"
  labelShow
end mouseUp
