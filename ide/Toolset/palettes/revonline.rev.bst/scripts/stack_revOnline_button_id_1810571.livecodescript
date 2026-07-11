Script "stack_revOnline_button_id_1810571"

/*
# Name: button "Direction" of group "search order" of card "main" of stack "revOnline"
# ID: button id 1810571 of group id 78150 of card id 1002 of stack "revOnline"
# Hash: 7NaltbXxJAeZfGlx6TkBdQ==
*/


on mouseUp
   if the cSelectedDirection of the owner of me is "descending" then
      set the  cSelectedDirection of the owner of me to "ascending"
   else
      set the  cSelectedDirection of the owner of me to "descending"
   end if
   updateSearchList 0
end mouseUp
