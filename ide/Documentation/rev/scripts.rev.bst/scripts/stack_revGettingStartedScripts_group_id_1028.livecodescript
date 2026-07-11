Script "stack_revGettingStartedScripts_group_id_1028"

/*
# Name: group "Show or hide a scrollbar automatically as text is entered in a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: group id 1028 of card id 1002 of stack "revGettingStartedScripts"
# Hash: Tkjh9h1pXDhSv+0mwyOe/A==
*/


on preOpenBackground
  put the originalText of field "Example" into field "Example"
end preOpenBackground

on openBackGround
  select after text of field "Example"
end openBackGround
