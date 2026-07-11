Script "stack_revNavigator_button_id_1149"

/*
# Name: button "Cancel" of group "CommandOptionControls" of group "CommandOption" of card "display" of stack "revNavigator"
# ID: button id 1149 of group id 1147 of group id 1137 of card id 1002 of stack "revNavigator"
# Hash: GLOTGA+IwWPWQAZa6LwvEg==
*/


global gSBThisStack
on mouseUp
  hide group "commandOption" of stack gSBThisStack with visual effect reveal up very fast
  send "cancelOptions" to group "commandControls" of stack gSBThisStack
end mouseUp
