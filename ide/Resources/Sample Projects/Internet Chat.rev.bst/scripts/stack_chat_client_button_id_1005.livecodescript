Script "stack_chat_client_button_id_1005"

/*
# Name: button "Send" of group id 1010 of card id 1002 of stack "chat client" of stack "chat server"
# ID: button id 1005 of group id 1010 of card id 1002 of stack "chat client" of stack "chat server"
# Hash: vsev/2ycp5h6pURn61WgCg==
*/


on mouseUp
  -- chatMessage is a message handler in the stack script
  -- send this message together with the contents of the field
  -- the user typed in
  chatMessage field "chatmessage"
  -- clear the field so the user can type another message
  put empty into field "chatmessage"
end mouseUp
