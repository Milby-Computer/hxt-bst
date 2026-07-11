Script "stack_SmartProperties_group_id_11391"

/*
# Name: group "Text color:" of group "Preferences" of card id 1002 of stack "SmartProperties"
# ID: group id 11391 of group id 11392 of card id 1002 of stack "SmartProperties"
# Hash: 9UOmMfgRjjNuQ8to2o06Hw==
*/


on mouseUp
  answer color with the backgroundColor of the target
  if the result is not "Cancel"
  then set the backgroundColor of the target to it

  DisplayProps
end mouseUp
