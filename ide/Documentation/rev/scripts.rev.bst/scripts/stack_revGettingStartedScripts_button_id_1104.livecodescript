Script "stack_revGettingStartedScripts_button_id_1104"

/*
# Name: button "Browse..." of group "Converting an absolute path to a relative path Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1104 of group id 1101 of card id 1002 of stack "revGettingStartedScripts"
# Hash: uhKqLDV+7vf0ZP44RNwkRQ==
*/


on mouseUp
  answer folder "Please choose a starting point for the relative path:"
  if it is not empty then put it into field "Starting Folder"
end mouseUp
