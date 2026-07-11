Script "stack_revOnline_field_id_31875"

/*
# Name: field "Name" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 31875 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: nFQF13zAaOhj1aKDGqM6Vw==
*/


on openField
   --if the text of me is "<Place a title for your code snippet here>" then
      --put empty into me
   --end if
   send "selectText" to me in 0 milliseconds
end openField

command selectText
   if the text of me is "<Place a title for your code snippet here>" then
      select the text of me
   end if
end selectText

on exitField
   if the text of me is empty then
      put "<Place a title for your code snippet here>" into me
   end if
end exitField

on closeField
   if the text of me is empty then
      put "<Place a title for your code snippet here>" into me
   end if
end closeField
