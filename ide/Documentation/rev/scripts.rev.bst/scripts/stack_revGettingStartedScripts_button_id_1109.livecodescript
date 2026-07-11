Script "stack_revGettingStartedScripts_button_id_1109"

/*
# Name: button "Browse..." of group "Converting an absolute path to a relative path Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1109 of group id 1101 of card id 1002 of stack "revGettingStartedScripts"
# Hash: tqo9kTz2IDz4tFwDZ8qrCA==
*/


on mouseUp
  answer folder "Please choose a file:"
  if it is not empty then put it into field "Path"
end mouseUp
