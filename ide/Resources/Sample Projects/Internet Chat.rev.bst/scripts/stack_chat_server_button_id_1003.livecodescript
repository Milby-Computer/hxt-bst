Script "stack_chat_server_button_id_1003"

/*
# Name: button "Start server" of card id 1002 of stack "chat server"
# ID: button id 1003 of card id 1002 of stack "chat server"
# Hash: vCZDZxd0Aa/hnrnrIt9MCA==
*/


-- declare a variable here to make it available to the entire script
local lChatterArray

-- when the mouse is clicked
on mouseUp
  -- provide visual feedback the server has been started
  disable me
  -- make it possible to stop the server
  enable button "Stop server"
  -- start accepting incoming connections
  -- the port has been chosen randomly, a high number
  -- is unlikely to be in use by anything else
  -- when a connection is received, send the message "chatConnected"
  accept connections on port 1987 with message chatConnected
end mouseUp

-- when a connection is recevied (this is first set up by mouseUp, above)
-- the "s" variable contains the address and port of the computer
-- that is connecting
on chatConnected s
  -- read in one line of data from the socket identified in the "s" variable
  read from socket s for 1 line
  -- remove any trailing return character
  put line 1 of it into tChatMessage
  -- add this new connection to the array containing a list of connections
  put tChatMessage into lChatterArray[s]
  -- call a handler to send a message to all clients informing them of the
  -- new connection
  broadcastToClients "*" & tChatMessage & " has joined the chat"
  -- put details of the new connection and a new line into the main field
  put tChatMessage && "connected" & return after field "serverstatus"
  -- start reading from the new connection contained in the "s" variable
  -- each time more data is received, call the chatMessage handler
  read from socket s with message chatMessage
end chatConnected

-- this handler is called when new data is received from a client
-- it is first set up by the chatConnected handler above
-- the variable "s" contains the host and port of the computer sending
-- the variable "data" contains the text that they sent
on chatMessage s,data
  -- put the chat message and a new line after the main field
  put data & return after field "serverstatus"
  -- send the chat message to all clients
  broadCastToClients data
  -- when more data is received from this client, send this message again
  read from socket s with message chatmessage
end chatMessage

-- this handler is called by the two handlers above
-- it sends the data contained in the "message" variable to all
-- the currently connected clients
on broadcasttoclients message
  -- get a list of all currently connected clients
  -- we add each client to this array when they connect in the handler above
  put keys(lChatterArray) into tChatterList
  -- cycle through all of the currently connected clients
  -- placing the host and port for each one into the variable "tSocket"
  repeat for each line tSocket in tChatterList
    -- send the data contained in the message variable to the client
    write message to socket tSocket
  end repeat
end broadcasttoclients

-- this message is sent when a client disconnects
-- the "s" variable contains the host and port of the client that disconnected
on socketClosed s
  -- look up the status of this client in the array we stored earlier
  put lChatterArray[s] into tChatter
  -- display this client disconnected to the main field
  put tChatter && "disconnected" & return after field "serverstatus"
  -- delete the reference to this client in the clients list array
  delete lChatterArray[s]
  -- tell all the remaining clients that this client has disconnected
  broadCastToClients "*" & tChatter && "has left"
end socketClosed
