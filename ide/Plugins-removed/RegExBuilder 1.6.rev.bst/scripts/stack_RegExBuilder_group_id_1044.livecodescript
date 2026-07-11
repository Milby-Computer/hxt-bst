Script "stack_RegExBuilder_group_id_1044"

/*
# Name: group "Filtering" of group id 1131 of card id 1002 of stack "RegExBuilder"
# ID: group id 1044 of group id 1131 of card id 1002 of stack "RegExBuilder"
# Hash: Roc077i/6b+z6w2CumIEYg==
*/


on mouseUp
  set the enabled of group "FilterGroup" to the hilitedButtonName of me is "Filter"
  
  if the hilitedButtonName of me is "Filter"
  then
    enable line 1 of btn "Copy syntax:"
    disable line 2 of btn "Copy syntax:"
    disable line 3 of btn "Copy syntax:"
  else
    disable line 1 of btn "Copy syntax:"
    enable line 2 of btn "Copy syntax:"
    enable line 3 of btn "Copy syntax:"
  end if
end mouseUp
