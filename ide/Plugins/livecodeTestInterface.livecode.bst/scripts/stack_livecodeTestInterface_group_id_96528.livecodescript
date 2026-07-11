Script "stack_livecodeTestInterface_group_id_96528"

/*
# Name: group "version list" of card "main" of stack "livecodeTestInterface"
# ID: group id 96528 of card id 1002 of stack "livecodeTestInterface"
# Hash: heSJOsnFwasXhR+zwa5ttg==
*/


on nodeUp theButton theNodeID, theTreeID
   if the depth_of_node_ID_[theNodeID] of me is 0 then
      send "versionSelectChildren theNodeID" to this card in 0 milliseconds 
   else
      set the cSelectedNodeIDs of me to the hilitedNodeIDs of me
   end if
   send "updateDisplay" to this card in 0 milliseconds 
end nodeUp

on dragStart
   
end dragStart
