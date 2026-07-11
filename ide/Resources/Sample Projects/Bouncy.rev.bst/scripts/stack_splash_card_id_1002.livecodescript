Script "stack_splash_card_id_1002"

/*
# Name: card id 1002 of stack "splash" of stack "Bouncy"
# ID: card id 1002 of stack "splash" of stack "Bouncy"
# Hash: mv96FTg00ZQ8P84++mbLbQ==
*/


on preOpenStack
  set the loc of this stack to the screenLoc
  send "closeNow" to me in 5 seconds
end preOpenStack

on closeNow
  close this stack
end closeNow
