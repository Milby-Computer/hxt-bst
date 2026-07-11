Script "stack_SQLite_Sampler_button_id_1209"

/*
# Name: button "Refresh users" of card "Edit Databases" of stack "SQLite Sampler"
# ID: button id 1209 of card id 1206 of stack "SQLite Sampler"
# Hash: Tx0nt8RZeJ5EC4H80brn3w==
*/


on mouseUp
  global gConID
  
  local tSQL
  put "SELECT * FROM users" into tSQL
   
  local tList
  put revDataFromQuery(,,gConID,tSQL) into tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  put tList into fld "Users"
  
end mouseUp
