Script "stack_ColorsPatterns"

/*
# Name: stack "ColorsPatterns" of stack "SmartProperties"
# ID: stack "ColorsPatterns" of stack "SmartProperties"
# Hash: VAMGWXyaWRV5K+l4g6WzxA==
*/


on preopenStack
  set itemDelimiter to "¶"
  
  set the label of this stack to line 1 of the dialogData
  
  put the cEntryRoot of fld "Values" into fld "Values"
  
  repeat with i=1 to 8
    put char 1 to -2 of line 1 of the dialogData after line i of fld "Values"
    if line 1 of the dialogData is "Patterns"
    then
      set the backgroundColor of btn i of group "BtnsGroup" to empty
      set the backgroundPattern of btn i of group "BtnsGroup" to item i of line 2 of the dialogData
    else set the backgroundColor of btn i of group "BtnsGroup" to item i of line 2 of the dialogData
  end repeat
end preopenStack

on openStack
end openStack

on closeStack
end closeStack
