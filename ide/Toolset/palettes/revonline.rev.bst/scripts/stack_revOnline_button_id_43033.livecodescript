Script "stack_revOnline_button_id_43033"

/*
# Name: button "Tag" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 43033 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: liOUz486iWDzhVIzZOHLVA==
*/


on mouseUp
   tagContent
end mouseUp

on mousemove
   set the textStyle of field "addtag" of the owner of me to "underline"
end mousemove

on mouseleave
   set the textStyle of field "addtag" of the owner of me to empty
end mouseleave
