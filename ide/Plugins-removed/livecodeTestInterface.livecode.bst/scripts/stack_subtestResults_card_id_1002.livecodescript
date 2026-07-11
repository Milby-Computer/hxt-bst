Script "stack_subtestResults_card_id_1002"

/*
# Name: card id 1002 of stack "subtestResults" of stack "livecodeTestInterface"
# ID: card id 1002 of stack "subtestResults" of stack "livecodeTestInterface"
# Hash: tJRH1l/6XSdHfgS6MIcOnA==
*/



on preOpenCard
   send "layoutCard" to me in 0 milliseconds
end preOpenCard

on resizeStack
   send "layoutCard" to me in 0 milliseconds
end resizeStack

on layoutCard
   set the topLeft of field "title" to 5,5
   set the height of group "subtestResults" of me to the height of this stack - 100
   set the width of group "subtestResults" of me to the width of this stack
   set the topLeft of group "subtestResults" of me to 0,50
   set the bottomRight of button "close" of me to the width of this stack - 10, the height of this stack - 10
end layoutCard
