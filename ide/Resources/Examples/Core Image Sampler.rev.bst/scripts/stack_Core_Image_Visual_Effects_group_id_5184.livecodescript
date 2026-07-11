Script "stack_Core_Image_Visual_Effects_group_id_5184"

/*
# Name: group "COLOR" of group "ciControls" of card "CISwipeTransition" of stack "Core Image Visual Effects"
# ID: group id 5184 of group id 1787 of card id 1049 of stack "Core Image Visual Effects"
# Hash: QZZzEVcpfr4ntSu0XigPlw==
*/


setProp ciValue pValue
  set the backColor of graphic 1 of me to pValue
end ciValue

getProp ciValue
  return "(" & the backColor of graphic 1 of me & ")"
end ciValue

