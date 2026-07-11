Script "stack_revResourceCenter_button_id_579916"

/*
# Name: button "Browse..." of group "Example" of group id 584271 of group "mainContent" of card "convertinganabsolutepathtoarelativepath" of stack "revResourceCenter"
# ID: button id 579916 of group id 577049 of group id 584271 of group id 104792 of card id 104775 of stack "revResourceCenter"
# Hash: tqo9kTz2IDz4tFwDZ8qrCA==
*/


on mouseUp
  answer folder "Please choose a file:"
  if it is not empty then put it into field "Path"
end mouseUp
