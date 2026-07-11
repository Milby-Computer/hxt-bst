Script "stack_ChoosePattern_group_id_1350"

/*
# Name: group "PatternsGroup" of card id 1002 of stack "ChoosePattern" of stack "SmartProperties"
# ID: group id 1350 of card id 1002 of stack "ChoosePattern" of stack "SmartProperties"
# Hash: U26aCDoUp3DfsSnZDgUevw==
*/


on mouseUp
  repeat with i=1 to the number of groups of me
    set the filled of group i of me to (the clickLoc is within rect of group i of me)
  end repeat
end mouseUp

on mouseDoubleUp
  click at loc of btn "Ok"
end mouseDoubleUp
