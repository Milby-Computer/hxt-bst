Script "stack_Credentials_button_id_1006"

/*
# Name: button "deleteCredential" of card id 1002 of stack "Credentials"
# ID: button id 1006 of card id 1002 of stack "Credentials"
# Hash: M2Tg/+vHoWCBZ2wVuUIDCA==
*/


on MouseUp
   if deleteCredential("MyApp", "apiKey") then
      put "Credential removed." into field "status"
   else
      put "Could not remove credential: " & the result into field "status"
   end if
end MouseUp
