Script "stack_revOnline_field_id_35287"

/*
# Name: field "website" of group "user" of group "viewing pane" of card "main" of stack "revOnline"
# ID: field id 35287 of group id 31884 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: +xEanOKB51SzrXf0vjXLhg==
*/


on mouseUp
   if the showBorder of me is false and the text of me is not empty then
      revGoUrl (the text of me)
   end if
end mouseUp


on mouseEnter
   if the showBorder of me is false and the text of me is not empty then
      set the textStyle of me to "underline"
   end if
end mouseEnter

on mouseMove
   if the showBorder of me is false and the text of me is not empty then
      set the textStyle of me to "underline"
   end if
end mouseMove

on mouseLeave
   if the showBorder of me is false then
      set the textStyle of me to empty
   end if
end mouseLeave
