Script "stack_Core_Image_Visual_Effects_group_id_5115"

/*
# Name: group "POINT" of group "ciControls" of card "CIModTransition" of stack "Core Image Visual Effects"
# ID: group id 5115 of group id 1672 of card id 1047 of stack "Core Image Visual Effects"
# Hash: MhDlJqzuzM/oB9ByDqbFbg==
*/


local sgFieldValues

setProp ciValue pValue
  local tFieldIndex
  repeat with tFieldIndex = 1 to 2
    set the text of field tFieldIndex of me to item tFieldIndex of pValue
  end repeat
end ciValue
  
getProp ciValue
  return "(" & field 1 of me, field 2 of me & ")"
end ciValue

on openField
  put the text of the target into sgFieldValues[the id of the target]
end openField

on closeField
  if the text of the target is not a number then
    answer "Point co-ordinates must be a number!" with "Okay"
    set the text of the target to sgFieldValues[the id of the target]
  end if
end closeField
