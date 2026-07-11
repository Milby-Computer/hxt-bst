Script "stack_Message_Box_field_id_2528"

/*
# Name: field "filter" of group "controls" of card "Global Properties" of stack "Message Box"
# ID: field id 2528 of group id 2535 of card id 2525 of stack "Message Box"
# Hash: Y5p2x0DU69oTYa+bmiF0Cw==
*/


command revFilter
   local tSelectedLine, tText
   put line (the hilitedLine of field "type") of field "type" into tSelectedLine
   put the cREVFullText of field "type" into tText
   filter tText with ("*" & the text of me & "*")
   put tText into field "type"
   set the wholeMatches to true
   set the hilitedLine of field "type" to lineOffset(tSelectedLine, tText)
   send "revDisplayProperties" to field "type"
end revFilter

on rawKeyUp
   revFilter
   pass rawKeyUp
end rawKeyUp
