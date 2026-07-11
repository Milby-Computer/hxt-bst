Script "stack_livecodeTestInterface_group_id_98874"

/*
# Name: group "test list" of card "main" of stack "livecodeTestInterface"
# ID: group id 98874 of card id 1002 of stack "livecodeTestInterface"
# Hash: B99qDEEXKiigNsiCYnchKg==
*/


on nodeUp theButton theNodeID, theTreeID
   if the depth_of_node_ID_[theNodeID] of me is 0 or the depth_of_node_ID_[theNodeID] of me is 1 or the depth_of_node_ID_[theNodeID] of me is 2  then
      send "testSelectChildren theNodeID" to this card in 0 milliseconds 
   else
      set the cSelectedNodeIDs of me to the hilitedNodeIDs of me
   end if
   send "updateDisplay" to this card in 0 milliseconds 
end nodeUp

on nodeDoubleUp theButton, theNodeID, theTreeID
   testOpen theNodeID
end nodeDoubleUp

on dragStart
   
end dragStart
