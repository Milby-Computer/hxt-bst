Script "stack_revNewScriptEditor_1_button_id_14919"

/*
# Name: button "Case" of group "Interactive Find" of group "Editor" of card "Main" of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# ID: button id 14919 of group id 14913 of group id 1046 of card id 1002 of stack "revNewScriptEditor 1" of stack "revNewScriptEditor"
# Hash: kZe3PumuaHxXxlfu8G3/cw==
*/


on mouseUp
   # OK-2009-03-10 : Bug 7070 - The match case check box should set the current preference value,
   # as it does in the find and replace dialog.
   sePrefSet "find,casesensitive", the hilite of me
   pass mouseUp
end mouseUp
