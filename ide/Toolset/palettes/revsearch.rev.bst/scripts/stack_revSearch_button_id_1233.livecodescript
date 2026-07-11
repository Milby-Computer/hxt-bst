Script "stack_revSearch_button_id_1233"

/*
# Name: button "Search Marked Cards Only" of bkgnd "Options" of stack "revSearch"
# ID: button id 1233 of bkgnd id 1371 of stack "revSearch"
# Hash: kWihGo3zEweJX9g//rMgjw==
*/


on mouseUp
  if the hilite of me then enable btn "Marked or Unmarked" of stack "revSearch"
  else disable btn "Marked or Unmarked" of stack "revSearch"
end mouseUp
