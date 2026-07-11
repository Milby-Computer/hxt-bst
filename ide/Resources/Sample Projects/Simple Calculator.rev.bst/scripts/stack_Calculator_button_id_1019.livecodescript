Script "stack_Calculator_button_id_1019"

/*
# Name: button "About" of card "Calculator" of stack "Calculator"
# ID: button id 1019 of card id 1002 of stack "Calculator"
# Hash: ylPoy1Vxy4flsnaAnRaBpQ==
*/


on mouseUp
  -- queue up changes to the screen without actually making them
  lock screen
  -- go to the about screen card
  go card "About"
  -- display the changes to the screen queued since the lock screen
  -- command with a visual effect
  unlock screen with visual effect scroll down
end mouseUp
