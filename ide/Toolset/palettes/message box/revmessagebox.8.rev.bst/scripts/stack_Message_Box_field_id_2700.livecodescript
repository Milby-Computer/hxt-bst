Script "stack_Message_Box_field_id_2700"

/*
# Name: field "filter" of group "controls" of card "Global Variables" of stack "Message Box"
# ID: field id 2700 of group id 2704 of card id 2526 of stack "Message Box"
# Hash: bQHt+/4gqKj8JaeDYP3O+w==
*/


command revFilter
   local tSelectedLine, tTect
   put line (the hilitedLine of field "type") of field "type" into tSelectedLine
   put the cREVFullText of field "type" into tText
   filter tText with ("*" & the text of me & "*")
   put tText into field "type"
   set the wholeMatches to true
   set the hilitedLine of field "type" to lineOffset(tSelectedLine,tText)
   send "revDisplayGlobals" to field "type"
end revFilter

on rawKeyUp
   revFilter
   pass rawKeyUp
end rawKeyUp
