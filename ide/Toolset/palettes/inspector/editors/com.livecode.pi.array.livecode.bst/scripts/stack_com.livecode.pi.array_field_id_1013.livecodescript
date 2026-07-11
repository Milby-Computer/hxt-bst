Script "stack_com.livecode.pi.array_field_id_1013"

/*
# Name: field "key" of group "template" of card id 1002 of stack "com.livecode.pi.array"
# ID: field id 1013 of group id 1004 of card id 1002 of stack "com.livecode.pi.array"
# Hash: K25AOyKFTX+L5UDYuEt2fA==
*/


on returnInField
   doKeyChanged
end returnInField

on enterInField
   doKeyChanged
end enterInField

on closeField
   doKeyChanged
end closeField

on doKeyChanged
   send "keyChanged" to me in 0 millisecs
end doKeyChanged
