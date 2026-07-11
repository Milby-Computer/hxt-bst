Script "stack_Ask_Dialog_button_id_1117"

/*
# Name: button "Cancel" of card "card id 1002" of stack "Ask Dialog"
# ID: button id 1117 of card id 1002 of stack "Ask Dialog"
# Hash: kAQnz7V34tScZdTA1MNC4w==
*/


on mouseUp
  lock messages
  close this stack
  revCleanUpAskDialog--won't get closeStack
  unlock messages
end mouseUp
