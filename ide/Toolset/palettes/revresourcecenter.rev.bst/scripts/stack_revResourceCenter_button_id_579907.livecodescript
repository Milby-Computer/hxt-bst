Script "stack_revResourceCenter_button_id_579907"

/*
# Name: button "Browse..." of group "Example" of group id 579908 of group "mainContent" of card "Convertingarelativepathtoanabsolutepath" of stack "revResourceCenter"
# ID: button id 579907 of group id 577048 of group id 579908 of group id 102592 of card id 102575 of stack "revResourceCenter"
# Hash: tqo9kTz2IDz4tFwDZ8qrCA==
*/


on mouseUp
  answer folder "Please choose a file:"
  if it is not empty then put it into field "Path"
end mouseUp
