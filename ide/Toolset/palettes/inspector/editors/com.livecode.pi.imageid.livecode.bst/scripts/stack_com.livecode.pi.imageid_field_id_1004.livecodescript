Script "stack_com.livecode.pi.imageid_field_id_1004"

/*
# Name: field "value" of group "template" of card id 1002 of stack "com.livecode.pi.imageid"
# ID: field id 1004 of group id 1009 of card id 1002 of stack "com.livecode.pi.imageid"
# Hash: 7JjN0ffbPIddQwdXHp9fBQ==
*/


on keydown pKey
  if pKey is not a number then
    beep
    exit keyDown
  else pass keyDown
end keydown
