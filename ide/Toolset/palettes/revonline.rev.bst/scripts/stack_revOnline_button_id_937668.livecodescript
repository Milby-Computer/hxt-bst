Script "stack_revOnline_button_id_937668"

/*
# Name: button "Browse" of group "Linux" of group "external upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937668 of group id 937665 of group id 937669 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: QSm6qU/hM4MfyuLatEsaMQ==
*/


on mouseUp
   answer file "Please select external" with filter "*.so"
   if it is not empty then
      put it into field "Path" of the owner of me
   end if
end mouseUp
