Script "stack_revStandaloneSettings_button_id_1496"

/*
# Name: button "Automatically build here" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1496 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: usiuFjJ+5knb7+XSU9ta+A==
*/


on mouseUp
   set the cRevStandaloneSettings["automaticallyBuildInDefaultFolder"] of stack (the cRevTargetStack of this stack) to the hilite of me
   revIDESetEdited the cRevTargetStack of this stack
end mouseUp
