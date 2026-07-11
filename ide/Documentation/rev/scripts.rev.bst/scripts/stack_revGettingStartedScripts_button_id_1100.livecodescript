Script "stack_revGettingStartedScripts_button_id_1100"

/*
# Name: button "Browse..." of group "Converting a relative path to an absolute path Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1100 of group id 1092 of card id 1002 of stack "revGettingStartedScripts"
# Hash: tqo9kTz2IDz4tFwDZ8qrCA==
*/


on mouseUp
  answer folder "Please choose a file:"
  if it is not empty then put it into field "Path"
end mouseUp
