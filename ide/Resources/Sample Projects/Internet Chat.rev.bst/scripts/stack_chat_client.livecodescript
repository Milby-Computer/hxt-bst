Script "stack_chat_client"

/*
# Name: stack "chat client" of stack "chat server"
# ID: stack "chat client" of stack "chat server"
# Hash: LaPZ5W55XsVCYa/PhztljA==
*/


-- declaring a variable here will make it available to the entire script
-- the lChatSocket variable contains the host and port for the connection
local lChatSocket

-- this handler is called by the mouseUp handler in the
-- script of the connect button
-- it starts the connection to the chat server
on chatConnect
  -- clear the responses field
  put empty into field "responses"
  -- prevent the user from typing while waiting for the connection to open
  disable group 1
  -- open a connection to the host address specified in the host field
  -- using port 1987, a number chosen randomly.  a high port number
  -- is unlikely to conflict with another application
  -- send a message "chatConnected" when sucessfully connected to this host
  open socket field "host" & ":1987" with message "chatConnected"
end chatConnect

-- this handler is called by the mouseUp handler in the
-- script of the connect button
-- it stops the connection to the chat server
on chatDisconnect
  -- close the connection to the host and port stored in the lChatSocket variable
  close socket lChatSocket
  -- prevent the user from typing as the connection is now closed
  disable group 1
  -- change the connect button to show we are disconnected and to allow connecting
  set the label of button "connect" to "Connect"
end chatDisconnect

-- this message is sent when the stack is closed
on closeStack
  -- call the disconnection handler (above)
  chatDisconnect
end closeStack

-- this message handler is set up in the chatConnect handler above
-- it is called when a connection is established
-- the "s" variable contains the host and port of the server we
-- are now connected to
on chatConnected s
  -- activate the controls in group 1 so the user can type
  enable group 1
  -- change the connect button to show we are successfully
  -- connected and to allow disconnecting
  set the label of button "connect" to "Disconnect"
  -- store the host and port of the server we are now connected to
  put s into lChatSocket
  -- send the user name to the chat server so it can broadcast
  -- this to other chat clients
  write field "username" & return to socket lChatSocket
  -- specify the message to be sent whenever any data is received from
  -- the chat server connection
  read from socket s with message chatReceived
end chatConnected

-- this message is called when data is received from the chat server
-- it is first set up in the handler chatConnected above
-- the variable "s" contains the host that connected
-- the variable "data" contains the data that was sent
on chatReceived s,data
  -- display the data that was sent
  put data & return after field "responses"
  -- specify that this message is to be sent again when more data is received
  read from socket s with message chatReceived
end chatReceived

-- this message is sent automatically in the event of an error
-- the "s" variable contains the host and port connected
-- the data variable contains the error message
on socketerror s,data
  -- prevent the user typing
  disable group 1
  -- show we are disconnected now and make it possible to start
  -- a new connection
  set the label of button "connect" to "Connect"
  -- display a dialog on the screen with the error message
  answer data
end socketerror

-- this message handler is called in the mouseUp handler of the
-- send button.  the "data" variable contains the message to send
-- it sends that data to the chat server
on chatMessage data
  -- send the user name followed by the data to the chat server
  -- connection is stored in the lChatSocket variable
  write field "username" & ":" & data to socket lChatSocket
end chatMessage
