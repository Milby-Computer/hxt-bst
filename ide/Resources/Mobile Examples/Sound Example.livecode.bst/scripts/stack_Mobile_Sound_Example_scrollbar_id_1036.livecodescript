Script "stack_Mobile_Sound_Example_scrollbar_id_1036"

/*
# Name: scrollbar "Background Volume" of group "Queued Sounds" of card id 1002 of stack "Mobile Sound Example"
# ID: scrollbar id 1036 of group id 1035 of card id 1002 of stack "Mobile Sound Example"
# Hash: pQd1L54b3QswOp2AGfdWng==
*/


on scrollbarDrag
   setChannelVolume "Queue", the thumbPosition of me
end scrollbarDrag
