Script "stack_revIcons"

/*
# Name: stack "revIcons"
# ID: stack "revIcons"
# Hash: V3pITwiILjlLmdqZwQJx8w==
*/


on mouseEnter
   if word 1 of the target is "image" then set the toolTip of the target to the ID of the target
end mouseEnter
