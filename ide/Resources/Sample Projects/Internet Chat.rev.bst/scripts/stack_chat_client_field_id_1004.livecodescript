Script "stack_chat_client_field_id_1004"

/*
# Name: field "chatmessage" of group id 1010 of card id 1002 of stack "chat client" of stack "chat server"
# ID: field id 1004 of group id 1010 of card id 1002 of stack "chat client" of stack "chat server"
# Hash: 6NQaMyBEUSlhY5rUAazUFw==
*/


on returnInField
  -- send a mouseUp message to the send button
  -- we use "click at" instead of "send mouseUp" so that
  -- we get the visual feedback associated with clicking on the button
  click at the location of button "Send"
end returnInField

on enterInField
  -- activate the handler above
  -- this is short hand for writing out the handler again, but would save
  -- time if we ever made the handler above more complex
  returnInField
end enterInField
