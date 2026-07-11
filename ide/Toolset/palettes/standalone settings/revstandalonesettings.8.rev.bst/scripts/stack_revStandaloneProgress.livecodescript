Script "stack_revStandaloneProgress"

/*
# Name: stack "revStandaloneProgress" of stack "revStandaloneSettings"
# ID: stack "revStandaloneProgress" of stack "revStandaloneSettings"
# Hash: vmonDRMzER7ql9ZF7YpXRQ==
*/


on preOpenStack
  
end preOpenStack

on openStack
  
end openStack

on openCard
  send "startLoading" to group "Loader" of card 1 of me
end openCard

on preOpenCard
  
end preOpenCard

on closeStack
  send "stopLoading" to group "Loader" of card 1 of me
end closeStack


