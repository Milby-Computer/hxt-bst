Script "stack_revOnline_button_id_937642"

/*
# Name: button "Code" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937642 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: 3wKV7wcoOipnCUKrinBpxQ==
*/


on mouseUp
   --   hide group "stack upload" of the owner of me
   --   show group "code upload" of the owner of me
   --   hide group "external upload" of the owner of me
   set the cContentType of the owner of me to "code"
end mouseUp
