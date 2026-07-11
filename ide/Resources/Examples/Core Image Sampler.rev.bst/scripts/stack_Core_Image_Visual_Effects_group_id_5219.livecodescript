Script "stack_Core_Image_Visual_Effects_group_id_5219"

/*
# Name: group "COLOR" of group "ciControls" of card "CICopyMachineTransition" of stack "Core Image Visual Effects"
# ID: group id 5219 of group id 1455 of card id 1044 of stack "Core Image Visual Effects"
# Hash: QZZzEVcpfr4ntSu0XigPlw==
*/


setProp ciValue pValue
  set the backColor of graphic 1 of me to pValue
end ciValue

getProp ciValue
  return "(" & the backColor of graphic 1 of me & ")"
end ciValue

