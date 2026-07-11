Script "stack_Mobile_Sound_Example_group_id_1035"

/*
# Name: group "Queued Sounds" of card id 1002 of stack "Mobile Sound Example"
# ID: group id 1035 of card id 1002 of stack "Mobile Sound Example"
# Hash: H9sk6d1dhPldQT2BjctkyA==
*/


on mouseUp
   if word 1 of the name of the target is "button" then
      addQueuedSound the short name of the target
   end if
end mouseUp
