Script "stack_balloon_card_id_1079"

/*
# Name: card "page4" of stack "balloon"
# ID: card id 1079 of stack "balloon"
# Hash: SWaHv1y7BZobi3Fo5Cst8A==
*/


on preOpenCard
   global gName
   put "Congratulations" && gName & ". You have reached the end of your balloon adventure." into field "story"
end preOpenCard
