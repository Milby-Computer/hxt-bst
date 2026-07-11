Script "stack_revOnline_button_id_937644"

/*
# Name: button "External" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937644 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: thVm7GkWLg/O63KoIsoc6Q==
*/


on mouseUp
   --   hide group "stack upload" of the owner of me
   --   hide group "code upload" of the owner of me
   --   show group "external upload" of the owner of me
   set the cContentType of the owner of me to "external"
end mouseUp
