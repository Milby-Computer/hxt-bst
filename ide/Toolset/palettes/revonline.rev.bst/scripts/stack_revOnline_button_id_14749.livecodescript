Script "stack_revOnline_button_id_14749"

/*
# Name: button "Go" of group "search filter" of card "main" of stack "revOnline"
# ID: button id 14749 of group id 1007 of card id 1002 of stack "revOnline"
# Hash: 82P9NpWcWNyIZ+qUyQuPag==
*/


on mouseUp
   updateSearch
end mouseUp

on mouseEnter
   set the backgroundColor of me to rvoHiliteColor()
end mouseEnter

on mouseLeave
   set the backgroundColor of me to "214,214,214"
end mouseLeave
