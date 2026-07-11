Script "stack_rTreeEngine_card_id_2486"

/*
# Name: card "_Start" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: card id 2486 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: vst1binDO56eYJaz29945w==
*/


local sMouse

on preOpenCard
   dispatch "resizeStack" to me
   put "rTree v." && the rTreeVersion of stack "rTreeEngine" into field "Version" of this card
   pass preOpenCard
end preOpenCard

on resizeStack
   set the rectangle of graphic "Fond" to the rectangle of me
   pass resizeStack
end resizeStack

on mouseUp
   if the mouseText is "Tapirsoft"
   then
      launch url "http://www.tapirsoft.com"
   end if
   pass "mouseUp"
end mouseUp

on mouseMove
   if sMouse is not the mouse
   then
      dispatch "resizeStack" to me
   end if
   put the mouse into sMouse
   pass "mouseMove"
end mouseMove

on dragStart
   set the dragData["private"] to empty
   pass dragStart
end dragStart

on dragEnd
   send "refreshActiveStack" to me in 1 tick
   pass "dragEnd"
end dragEnd

on refreshActiveStack
   local tLongMouseStackID
   wait 0 millisec with messages
   if there is no stack the mouseStack then
      exit "refreshActiveStack"
   end if
   if there is a stack "rIDE" then
      if the long id of stack "rIDE" is in the long id of the mouseStack then
         exit "refreshActiveStack"
      end if
   end if
   if there is a stack "rTreeEngine" then
      if the long id of stack "rTreeEngine" is in the long id of the mouseStack then
         exit "refreshActiveStack"
      end if
   end if
   if the short name of the mouseStack is among the lines of revLoadedStacks("application") then
      put the long ID of the mouseStack into tLongMouseStackID
      go tLongMouseStackID
      new_rTree
   end if
end refreshActiveStack
