Script "stack_SQLite_Sampler_button_id_1231"

/*
# Name: button "Refresh apps" of card "Edit Databases" of stack "SQLite Sampler"
# ID: button id 1231 of card id 1206 of stack "SQLite Sampler"
# Hash: BMLwF+a0yNABmViZtLOMVg==
*/


on mouseUp
  global gConID
  
  local tSQL
  put "SELECT * FROM apps" into tSQL
  
  local tList
  put revDataFromQuery(,,gConID,tSQL) into tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  put tList into fld "apps"  
end mouseUp
