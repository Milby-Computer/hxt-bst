Script "stack_revResourceCenter_button_id_579902"

/*
# Name: button "Browse..." of group "Example" of group id 579908 of group "mainContent" of card "Convertingarelativepathtoanabsolutepath" of stack "revResourceCenter"
# ID: button id 579902 of group id 577048 of group id 579908 of group id 102592 of card id 102575 of stack "revResourceCenter"
# Hash: uhKqLDV+7vf0ZP44RNwkRQ==
*/


on mouseUp
  answer folder "Please choose a starting point for the relative path:"
  if it is not empty then put it into field "Starting Folder"
end mouseUp
