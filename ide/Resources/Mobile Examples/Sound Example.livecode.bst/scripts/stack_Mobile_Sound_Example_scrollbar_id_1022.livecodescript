Script "stack_Mobile_Sound_Example_scrollbar_id_1022"

/*
# Name: scrollbar "Transient Volume" of group "Transient Sounds" of card id 1002 of stack "Mobile Sound Example"
# ID: scrollbar id 1022 of group id 1020 of card id 1002 of stack "Mobile Sound Example"
# Hash: /e5jErYKXERNPAdgJYbJ6A==
*/


on scrollbarDrag
   setChannelVolume "Transient", the thumbPosition of me
end scrollbarDrag
