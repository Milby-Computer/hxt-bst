Script "stack_revOnline_field_id_1589285"

/*
# Name: field "sort by" of group "search order" of card "main" of stack "revOnline"
# ID: field id 1589285 of group id 78150 of card id 1002 of stack "revOnline"
# Hash: yr7XAMpJS8hsLiBCYvpLHg==
*/


on mouseEnter
   --set the showBorder of me to true
   set the textstyle of me to "underline"
   send "showMenu" to me in 300 milliseconds
end mouseEnter

command showMenu
   if the mousecontrol is not empty then
      if the long id of the mouseControl is the long id of me then
         lock screen
         if there is a field "order menu" of this card of stack "revonline" then
            if the visible of field "order menu" of this card of stack "revonline" is false then
               delete field "order menu" of this card of stack "revonline"
               copy field "order menu" of card "templates" of stack "revonline" to card "main" of stack "revonline"
               set the topleft of field "order menu" of this card to (the left of me + 7, the bottom of me - 2)
               show field "order menu" of this card
            end if
         else
            copy field "order menu" of card "templates" of stack "revonline" to card "main" of stack "revonline"
            set the topleft of field "order menu" of this card to (the left of me + 7, the bottom of me - 2)
            show field "order menu" of this card
         end if
         unlock screen
      end if
   end if
end showMenu

on mouseleave
   send "removeMenu" to me in 300 milliseconds
end mouseleave

command removeMenu
   --set the textStyle of me to empty
   if there is a field "order menu" of card "main" of stack "revonline" then
      if the mousecontrol is not empty then
         if the long id of the mousecontrol is not the long id of field "order menu" of card "main" of stack "revonline" then
            --set the showBorder of me to false
            delete field "order menu" of card "main" of stack "revonline"
            set the textStyle of me to empty
         end if
      else
         --set the showBorder of me to false
         delete field "order menu" of card "main" of stack "revonline"
         set the textStyle of me to empty
      end if
   else
      set the textStyle of me to empty
   end if
end removeMenu

on mouseUp
   showMenu
end mouseUp

