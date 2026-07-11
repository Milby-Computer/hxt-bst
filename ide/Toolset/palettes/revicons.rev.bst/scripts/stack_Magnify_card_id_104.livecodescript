Script "stack_Magnify_card_id_104"

/*
# Name: card "Magnifier Card" of stack "Magnify" of stack "revIcons"
# ID: card id 104 of stack "Magnify" of stack "revIcons"
# Hash: lKpZK9YXFEYXyiOZncHIqQ==
*/


on closeStack
  set the width of this stack to 256
  set the height of this stack to 256
end closeStack

on resizeStack
  set the rect of magnifier 1 to 0,0,the width of this stack,the height of this stack
end resizeStack
