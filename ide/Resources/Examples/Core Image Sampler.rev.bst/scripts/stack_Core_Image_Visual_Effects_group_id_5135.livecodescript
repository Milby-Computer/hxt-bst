Script "stack_Core_Image_Visual_Effects_group_id_5135"

/*
# Name: group "COLOR" of group "ciControls" of card "CIFlashTransition" of stack "Core Image Visual Effects"
# ID: group id 5135 of group id 1581 of card id 1046 of stack "Core Image Visual Effects"
# Hash: QZZzEVcpfr4ntSu0XigPlw==
*/


setProp ciValue pValue
  set the backColor of graphic 1 of me to pValue
end ciValue

getProp ciValue
  return "(" & the backColor of graphic 1 of me & ")"
end ciValue

