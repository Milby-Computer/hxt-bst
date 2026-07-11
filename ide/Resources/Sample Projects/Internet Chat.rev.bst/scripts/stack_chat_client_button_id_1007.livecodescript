Script "stack_chat_client_button_id_1007"

/*
# Name: button "Connect" of card id 1002 of stack "chat client" of stack "chat server"
# ID: button id 1007 of card id 1002 of stack "chat client" of stack "chat server"
# Hash: p3uhZVe4QklJUhigyMY0Yg==
*/


on mouseUp
  if the label of me is "Connect" then
    chatConnect
  else
    chatDisconnect
  end if
end mouseUp
