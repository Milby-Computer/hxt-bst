Script "stack_Credentials_button_id_1005"

/*
# Name: button "retrieveCredential" of card id 1002 of stack "Credentials"
# ID: button id 1005 of card id 1002 of stack "Credentials"
# Hash: wh4UkhcJunLrkN1+GBGXiA==
*/


on MouseUp
   local tApiKey
   put retrieveCredential("MyApp", "apiKey") into tApiKey
   if tApiKey is empty then
      answer "No API key stored. Please enter your key."
   end if
   put tApiKey into field "Status"
end MouseUp
