Script "stack_com.livecode.pi.customprops_field_id_1009"

/*
# Name: field "key" of group "template" of card id 1002 of stack "com.livecode.pi.customprops"
# ID: field id 1009 of group id 1004 of card id 1002 of stack "com.livecode.pi.customprops"
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
