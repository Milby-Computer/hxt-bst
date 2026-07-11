Script "stack_balloon_card_id_1012"

/*
# Name: card "page1" of stack "balloon"
# ID: card id 1012 of stack "balloon"
# Hash: 1MrlegcmJl6J3ZoeO+mZAQ==
*/


## The preOpenCard message is sent before the card is made visible to the user
## Any layout can be done here and will not be visible
on preOpenCard
   ## Declare the global variable so it can be used
   global gName
   
   ## Reposition the controls
   set the loc of image "balloon" to 85,655
   set the loc of image "foreground" to 512,694
   
   ## Put text into the field, using the gName variable to personalise the message
   put "Hi," && gName & ". Your hot air balloon is about to take off on a round the world adventure." & return & return & \
         "Click on the balloon to take off." into field "story"
end preOpenCard


