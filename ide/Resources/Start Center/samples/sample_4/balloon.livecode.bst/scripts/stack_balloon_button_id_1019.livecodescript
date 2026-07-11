Script "stack_balloon_button_id_1019"

/*
# Name: button "start" of card "introduction" of stack "balloon"
# ID: button id 1019 of card id 1002 of stack "balloon"
# Hash: tM+NjEdO0QCIpdbX598Agg==
*/


## The mouseUp messgae is sent by LiveCode when the user clicks and releases on a control
on mouseUp
   ## Use a global variable to store the user's name
   global gName
   
   ## The ask command displays a native dialog with a box the user can type into to answer
   ask "What is your name?"
   
   ## If the user does not cancel the dialog
   if the result is not "cancel" then
      ## Their answer is returned in the special variable "it"
      ## Put the answer into the global variable gName
      put it into gName
      ## Move to the next card
      go to the next card
   end if
end mouseUp
