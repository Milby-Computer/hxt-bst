Script "stack_Core_Image_Visual_Effects_group_id_5198"

/*
# Name: group "SCALAR" of group "ciControls" of card "CISwipeTransition" of stack "Core Image Visual Effects"
# ID: group id 5198 of group id 1787 of card id 1049 of stack "Core Image Visual Effects"
# Hash: 5u2TSeMlLJP14duFXBbncQ==
*/


setProp ciValue pValue
  set the thumbPosition of scrollbar "Value" of me to pValue
  set the text of field "Value Display" of me to format("%.2f", pValue)
end ciValue

getProp ciValue
  return the text of field "Value Display" of me
end ciValue

setProp ciRange pRange
  set the startValue of scrollbar "Value" of me to item 1 of pRange
  set the endValue of scrollBar "Value" of me to item 2 of pRange
end ciRange

on scrollbarDrag
  set the text of field "Value Display" of me to format("%.2f", the thumbPosition of the target) 
end scrollbarDrag
