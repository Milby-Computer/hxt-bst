Script "stack_Core_Image_Visual_Effects_group_id_5166"

/*
# Name: group "RECTANGLE" of group "ciControls" of card "CIRippleTransition" of stack "Core Image Visual Effects"
# ID: group id 5166 of group id 1735 of card id 1048 of stack "Core Image Visual Effects"
# Hash: +lRGwWWkYXcpB2FC0tr68A==
*/


local sgFieldValues

setProp ciValue pValue
  local tFieldIndex
  repeat with tFieldIndex = 1 to 4
    set the text of field tFieldIndex of me to item tFieldIndex of pValue
  end repeat
end ciValue
  
getProp ciValue
  return "(" & field 1 of me, field 2 of me, field 3 of me, field 4 of me & ")"
end ciValue

on openField
  put the text of the target into sgFieldValues[the id of the target]
end openField

on closeField
  if the text of the target is not a number then
    answer "Rectangle co-ordinates must be a number!" with "Okay"
    set the text of the target to sgFieldValues[the id of the target]
  end if
end closeField
