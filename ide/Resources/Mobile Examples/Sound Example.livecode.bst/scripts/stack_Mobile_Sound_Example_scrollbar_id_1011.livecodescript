Script "stack_Mobile_Sound_Example_scrollbar_id_1011"

/*
# Name: scrollbar "Background Volume" of group "Backgound Sound" of card id 1002 of stack "Mobile Sound Example"
# ID: scrollbar id 1011 of group id 1021 of card id 1002 of stack "Mobile Sound Example"
# Hash: d+x9M7dTRHrWI9mIQzgz6w==
*/


on scrollbarDrag
   setChannelVolume "Background", the thumbPosition of me
end scrollbarDrag
