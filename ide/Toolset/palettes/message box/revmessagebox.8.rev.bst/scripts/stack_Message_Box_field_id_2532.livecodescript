Script "stack_Message_Box_field_id_2532"

/*
# Name: field "contents" of group "controls" of card "Global Properties" of stack "Message Box"
# ID: field id 2532 of group id 2535 of card id 2525 of stack "Message Box"
# Hash: OZZtW7qCRafNRbK9fYRu5A==
*/


on revSetDiscreteProperty
   if the cREVFieldStyle of this card is "List" then
      put line (the hilitedLine of field "type") of field "type" into tSelected
      put line (the hilitedLine of field "contents") of field "contents" into tProperty
      do "set the" && tSelected && "to" && quote & tProperty & quote
   end if
end revSetDiscreteProperty

on mouseUp
   revSetDiscreteProperty
   pass mouseUp
end mouseUp

on arrowKey
   send "revSetDiscreteProperty" to me in 10 milliseconds
   pass arrowKey
end arrowKey

on closeField
   put line (the hilitedLine of field "type") of field "type" into tSelected
   if the cREVFieldStyle of this card is "Editable" and tSelected is not empty
   then do "set the" && tSelected && "to field" && quote & "contents" & quote
   pass closeField
end closeField
