Script "stack_chat_server_button_id_1004"

/*
# Name: button "Stop server" of card id 1002 of stack "chat server"
# ID: button id 1004 of card id 1002 of stack "chat server"
# Hash: fLDfiUVqbySvaHL/1E2uhg==
*/


on mouseUp
  -- provide visual feedback that the server is stopped
  disable me
  -- make it possible to start the server again
  enable button "Start server"
  -- the openSockets contains a list of all socket connections that are open
  -- cycle through that list, putting each item in it into the variable "a"
  -- each time we go around the loop
  repeat for each line a in the opensockets
    -- close the connection contained in the variable "a"
    close socket a
  end repeat
end mouseUp
