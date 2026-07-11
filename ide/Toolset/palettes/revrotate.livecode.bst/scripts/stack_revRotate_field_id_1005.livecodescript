Script "stack_revRotate_field_id_1005"

/*
# Name: field "Rotate" of card id 1002 of stack "revRotate"
# ID: field id 1005 of card id 1002 of stack "revRotate"
# Hash: 1Y35TUWEQ2R1OwvFMsiRRw==
*/


on keydown pKey
  if pKey is not a number then
    beep
    exit keyDown
  else pass keyDown
end keydown

on closeField
  if me > 360 then put 360 into me
  if me < 0 then put 0 into me
end closeField
