Script "stack_ChoosePattern"

/*
# Name: stack "ChoosePattern" of stack "SmartProperties"
# ID: stack "ChoosePattern" of stack "SmartProperties"
# Hash: H6HqKB6A7AGTLEz8zPhD5w==
*/


on preOpenStack
  repeat with i=1 to the number of groups of group "PatternsGroup"
    set the filled of group i of group "PatternsGroup" to (i = the dialogData)
  end repeat
  
  set the vScroll of group "PatternsGroup" to (the dialogData - 1) * 21
end preOpenStack

on openStack
end openStack

on closeStack
end closeStack
