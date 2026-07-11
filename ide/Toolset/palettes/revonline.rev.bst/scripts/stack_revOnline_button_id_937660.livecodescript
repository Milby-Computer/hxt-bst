Script "stack_revOnline_button_id_937660"

/*
# Name: button "Browse" of group "Windows" of group "external upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937660 of group id 937657 of group id 937669 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: pIx1l9lVi4kWZ7/CMxydZQ==
*/


on mouseUp
   answer file "Please select external" with filter "*.dll"
   if it is not empty then
      put it into field "Path" of the owner of me
   end if
end mouseUp
