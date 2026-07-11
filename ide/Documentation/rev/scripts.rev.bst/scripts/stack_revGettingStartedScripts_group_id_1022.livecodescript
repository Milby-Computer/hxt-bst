Script "stack_revGettingStartedScripts_group_id_1022"

/*
# Name: group "Inserting some text before each line in a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: group id 1022 of card id 1002 of stack "revGettingStartedScripts"
# Hash: v9zS87NbJvdKW0Ham4t1cA==
*/


on preOpenBackground
  put empty into field "Prefix"
  put empty into field "List"
  select text of field "Prefix"
end preOpenBackground
