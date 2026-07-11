Script "stack_revOnline_button_id_937640"

/*
# Name: button "Stack" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937640 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: rHVMzuDZ32S5dqnS4g6jvQ==
*/


on mouseUp
   --   show group "stack upload" of the owner of me
   --   hide group "code upload" of the owner of me
   --   hide group "external upload" of the owner of me
   set the cContentType of the owner of me to "stack"
end mouseUp
