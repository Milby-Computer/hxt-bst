Script "stack_revResourceCenter_button_id_579911"

/*
# Name: button "Browse..." of group "Example" of group id 584271 of group "mainContent" of card "convertinganabsolutepathtoarelativepath" of stack "revResourceCenter"
# ID: button id 579911 of group id 577049 of group id 584271 of group id 104792 of card id 104775 of stack "revResourceCenter"
# Hash: uhKqLDV+7vf0ZP44RNwkRQ==
*/


on mouseUp
  answer folder "Please choose a starting point for the relative path:"
  if it is not empty then put it into field "Starting Folder"
end mouseUp
