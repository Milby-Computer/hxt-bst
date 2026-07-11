Script "stack_revSearch_button_id_1342"

/*
# Name: button "Browse..." of bkgnd "Folder" of stack "revSearch"
# ID: button id 1342 of bkgnd id 1321 of stack "revSearch"
# Hash: uAHkrEhUTQfwHkFHfuANtQ==
*/


on mouseUp
  answer folder "Select a Folder"
  if it is not empty then
    set the cDirectory of stack "revSearch" to it
    set the itemDel to "/"
    put the last item of it into fld "folder" of stack "revSearch"
  end if
end mouseUp
