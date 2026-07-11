Script "stack_balloon_image_id_1015"

/*
# Name: image "balloon" of card "page1" of stack "balloon"
# ID: image id 1015 of card id 1012 of stack "balloon"
# Hash: wHw9+SX1dL1nowEtIUHZEg==
*/


## The mouseUp messgae is sent by LiveCode when the user clicks and releases on a control
on mouseUp
   ## The move command moves an object smoothly along a path
   move image "balloon" to the points of graphic "path" in 3 seconds without waiting
end mouseUp

## The moveStopped message is sent when a "move" command finishes
on moveStopped
   ## Balloon has been piloted off the right side of the screen
   ## Position the balloon on the next card so it follows
   set the top of image "balloon" of card "page2" to the top of image "balloon" of this card
   set the left of image "balloon" of card "page2" to 0
   ## Go to the next card
   go next card
end moveStopped
