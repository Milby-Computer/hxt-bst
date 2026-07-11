Script "stack_com.livecode.pi.customprops_field_id_1003"

/*
# Name: field "value" of group "template" of card id 1002 of stack "com.livecode.pi.customprops"
# ID: field id 1003 of group id 1004 of card id 1002 of stack "com.livecode.pi.customprops"
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
