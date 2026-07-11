Script "stack_Mobile_Sound_Example_group_id_1020"

/*
# Name: group "Transient Sounds" of card id 1002 of stack "Mobile Sound Example"
# ID: group id 1020 of card id 1002 of stack "Mobile Sound Example"
# Hash: gRDwEkarCevF0fAz5i6ZLQ==
*/


on mouseUp
   if word 1 of the name of the target is "button" then
      playTransientSound the short name of the target
   end if
end mouseUp
