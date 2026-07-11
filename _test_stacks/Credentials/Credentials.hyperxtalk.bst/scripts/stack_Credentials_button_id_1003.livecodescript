Script "stack_Credentials_button_id_1003"

/*
# Name: button "storeCredential" of card id 1002 of stack "Credentials"
# ID: button id 1003 of card id 1002 of stack "Credentials"
# Hash: 3V8vkWtOzxHGPKR5SZshKQ==
*/


on MouseUp
   if storeCredential("MyApp", "apiKey", "thursday") then
      put "API key saved securely." into field "status"
   else
      put "Could not save key: " & the result into field "status"
   end if
end MouseUp
