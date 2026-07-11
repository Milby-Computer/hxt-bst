Script "stack_Core_Image_Visual_Effects_group_id_1483"

/*
# Name: group "COLOR" of card "Control Haven" of stack "Core Image Visual Effects"
# ID: group id 1483 of card id 1034 of stack "Core Image Visual Effects"
# Hash: QZZzEVcpfr4ntSu0XigPlw==
*/


setProp ciValue pValue
  set the backColor of graphic 1 of me to pValue
end ciValue

getProp ciValue
  return "(" & the backColor of graphic 1 of me & ")"
end ciValue

