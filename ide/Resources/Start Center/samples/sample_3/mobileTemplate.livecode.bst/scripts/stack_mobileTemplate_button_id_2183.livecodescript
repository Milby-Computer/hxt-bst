Script "stack_mobileTemplate_button_id_2183"

/*
# Name: button "Reset" of card "template" of stack "mobileTemplate"
# ID: button id 2183 of card id 1868 of stack "mobileTemplate"
# Hash: R6u3d5B/Xuj77l0/z6YoCg==
*/


on mouseUp
   lock screen
   set the navigationItems of group "nav" of me to empty
   preOpenStack
   openCard
   unlock screen
end mouseUp
