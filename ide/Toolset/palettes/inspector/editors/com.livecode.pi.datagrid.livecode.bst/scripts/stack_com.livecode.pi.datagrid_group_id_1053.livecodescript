Script "stack_com.livecode.pi.datagrid_group_id_1053"

/*
# Name: group "row template" of group "template" of card id 1002 of stack "com.livecode.pi.datagrid"
# ID: group id 1053 of group id 1012 of card id 1002 of stack "com.livecode.pi.datagrid"
# Hash: 8MmpT8C6irvvhaPVhwPyNg==
*/


on subEditorResize
   lock screen
   lock messages
   
   set the width of button 1 of me to the width of me
   set the left of button 1 of me to the left of me
   set the top of button 1 of me to the top of me
   
   unlock messages
   unlock screen
end subEditorResize
