Script "stack_Core_Image_Visual_Effects_group_id_5229"

/*
# Name: group "ANGLE" of group "ciControls" of card "CICopyMachineTransition" of stack "Core Image Visual Effects"
# ID: group id 5229 of group id 1455 of card id 1044 of stack "Core Image Visual Effects"
# Hash: P8J1KAFbxBKzAmaebtJxSg==
*/


local sgLeft, sgRight

setProp ciValue pValue
  local tValue
  put pValue * 180 / PI into tValue
  set the thumbPosition of scrollbar "Value" of me to tValue - sgLeft
  set the text of field "Value Display" of me to format("%.2f", tValue)
end ciValue

getProp ciValue
  return PI * (the text of field "Value Display" of me) / 180 
end ciValue

setProp ciRange pRange
  put item 1 of pRange into sgLeft
  put item 2 of pRange into sgRight
  set the startValue of scrollbar "Value" of me to 0
  set the endValue of scrollBar "Value" of me to sgRight - sgLeft
end ciRange

on scrollbarDrag
  set the text of field "Value Display" of me to format("%.2f", the thumbPosition of the target + sgLeft) 
end scrollbarDrag
