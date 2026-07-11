Script "stack_com.livecode.pi.array_field_id_1012"

/*
# Name: field "value" of group "template" of card id 1002 of stack "com.livecode.pi.array"
# ID: field id 1012 of group id 1004 of card id 1002 of stack "com.livecode.pi.array"
# Hash: VIr7NARC/EAu5KCUtc7myQ==
*/


on enterInField
   doValueChanged
end enterInField

on returnInField
   if (the controlKey is down) then 
      doValueChanged
   else
      pass returnInField
   end if
end returnInField

on closeField
   doValueChanged
end closeField

on doValueChanged
   send "valueChanged" to me in 0 millisecs
end doValueChanged
