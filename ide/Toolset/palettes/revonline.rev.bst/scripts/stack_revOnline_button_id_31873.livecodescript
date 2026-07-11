Script "stack_revOnline_button_id_31873"

/*
# Name: button "Download" of group "stack" of group "viewing pane" of card "main" of stack "revOnline"
# ID: button id 31873 of group id 31860 of group id 31859 of card id 1002 of stack "revOnline"
# Hash: D7ZmV/awCsB4pWn6dn3VGg==
*/



on mouseUp
   if the visible of me then
      rvoLaunchStack (the cStack of the owner of me)
   end if
end mouseUp

on mouseEnter
   set the backgroundColor of me to "124,193,222"
end mouseEnter

on mouseLeave
   set the backgroundColor of me to "214,214,214"
end mouseLeave
