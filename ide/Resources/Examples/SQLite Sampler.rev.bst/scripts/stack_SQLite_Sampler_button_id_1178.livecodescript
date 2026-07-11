Script "stack_SQLite_Sampler_button_id_1178"

/*
# Name: button "Refresh Table" of card "View and Delete Data" of stack "SQLite Sampler"
# ID: button id 1178 of card id 1153 of stack "SQLite Sampler"
# Hash: 2LF2DYz0LpC3cNWJG/ydSQ==
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
