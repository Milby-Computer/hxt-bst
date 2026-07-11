Script "stack_quality_card_id_1002"

/*
# Name: card "qualityTestUI" of stack "quality" of stack "livecodeTestInterface"
# ID: card id 1002 of stack "quality" of stack "livecodeTestInterface"
# Hash: 1iIsKZKSzPRvhSaAS4SZuw==
*/


on qualityHandleWorkListMessage pMessage
   local tChangeDetails
   put pMessage & return after field "CallbackResults"
   if item 1 of pMessage is "worklist Changed" then
      qualityWorkListGetItemDetails item 2 of pMessage, item 3 of pMessage
      put the result into tChangeDetails
      get displayArrayData (tChangeDetails, "")
      put the result into field "Results"
   end if
end qualityHandleWorkListMessage
