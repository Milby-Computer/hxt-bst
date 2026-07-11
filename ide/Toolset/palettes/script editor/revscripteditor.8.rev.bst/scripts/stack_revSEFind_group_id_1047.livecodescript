Script "stack_revSEFind_group_id_1047"

/*
# Name: group "searchType" of group "Options" of card "Main" of stack "revSEFind" of stack "revNewScriptEditor"
# ID: group id 1047 of group id 1041 of card id 1002 of stack "revSEFind" of stack "revNewScriptEditor"
# Hash: JZE7Fji5bRGi+GN8BusOpw==
*/


on mouseUp
   sePrefSet "find,regularexpressions", the hilite of button "regEx" of me
   sePrefSet "find,wildcards", the hilite of button "wildcards" of me
   sePrefSet "find,plaintext", the hilite of button "plaintext" of me
end mouseUp
