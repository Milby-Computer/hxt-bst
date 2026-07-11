Script "stack_livecodeTestInterface_group_id_96512"

/*
# Name: group "platform list" of card "main" of stack "livecodeTestInterface"
# ID: group id 96512 of card id 1002 of stack "livecodeTestInterface"
# Hash: 1oI7If7oOjn/4M667IoIMA==
*/


on nodeUp theButton theNodeID, theTreeID
   if the depth_of_node_ID_[theNodeID] of me is 0 then
      send "platformSelectChildren theNodeID" to this card in 0 milliseconds 
   else
      set the cSelectedNodeIDs of me to the hilitedNodeIDs of me
   end if
   send "updateDisplay" to this card in 0 milliseconds 
end nodeUp

on dragStart
   
end dragStart
