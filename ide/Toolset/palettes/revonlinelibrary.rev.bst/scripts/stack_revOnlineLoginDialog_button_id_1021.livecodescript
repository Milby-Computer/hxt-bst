Script "stack_revOnlineLoginDialog_button_id_1021"

/*
# Name: button "remember email" of card id 1002 of stack "revOnlineLoginDialog" of stack "revOnlineLibrary"
# ID: button id 1021 of card id 1002 of stack "revOnlineLoginDialog" of stack "revOnlineLibrary"
# Hash: 6br7J+kefru4pTjdCDjM4w==
*/


on mouseUp
   if the hilite of me then
      set the enabled of button "remember password" of this card to true
   else
      set the enabled of button "remember password" of this card to false
      set the hilite of button "remember password" of this card to false
   end if
end mouseUp
