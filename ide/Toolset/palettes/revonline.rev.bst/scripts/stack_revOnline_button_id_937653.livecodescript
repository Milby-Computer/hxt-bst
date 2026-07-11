Script "stack_revOnline_button_id_937653"

/*
# Name: button "paste" of group "code upload" of group "chooser" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 937653 of group id 937656 of group id 937645 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: 2zHt6wX+uDaqsPJTzgyijw==
*/


on mouseUp
   if the clipboard is "text" then
      put the clipboarddata into field "code input" of the owner of me
   end if
end mouseUp
