Script "stack_Calculator_button_id_1031"

/*
# Name: button "OK" of card "About" of stack "Calculator"
# ID: button id 1031 of card id 1030 of stack "Calculator"
# Hash: kP4BbIhPkhOdBA5T98Z0TQ==
*/


on mouseUp
  -- queue up changes to the screen without actually making them
  lock screen
  -- go back to the calculator
  go card "Calculator"
  -- display the changes to the screen queued since the lock screen
  -- command with a visual effect
  unlock screen with visual effect reveal up
end mouseUp
