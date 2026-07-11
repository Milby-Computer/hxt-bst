Script "stack_rTreeEngine_card_id_2151"

/*
# Name: card "Engine" of stack "rTreeEngine" of stack "livecodeTestInterface"
# ID: card id 2151 of stack "rTreeEngine" of stack "livecodeTestInterface"
# Hash: CohmS14GelYRjeILrdqapA==
*/


on preOpenCard
   if the long id of this stack is in the long id of me
   then
      set the label of this stack to "rTree"
      set  the rectangle of this stack to the resizedRectangle of me
   end if
   pass preOpenCard
end preOpenCard

on resizeStack
   if the long id of this stack is in the long id of me
   then
      set the resizedRectangle of me to the rectangle of this stack
   end if
end resizeStack

on moveStack
   if the long id of this stack is in the long id of me
   then
      set the resizedRectangle of me to the rectangle of this stack
   end if
end moveStack
