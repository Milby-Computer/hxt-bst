Script "stack_revNavigator_button_id_1073"

/*
# Name: button "Close" of group "commandControls" of group "commandGroup" of card "display" of stack "revNavigator"
# ID: button id 1073 of group id 1076 of group id 1100 of card id 1002 of stack "revNavigator"
# Hash: Sfb6oq24f+D0CsYwDWSjpg==
*/


global gSBThisStack
on mouseUp
  hide group "commandGroup" with visual effect reveal up very fast
  --breakpoint
  enable fld "list"
 set the hilitedLines of fld "list" to the pHilitedLines of group "commandGroup"
end mouseUp
