Script "stack_SQLite_Sampler_button_id_1276"

/*
# Name: button "Show SQLITE_MASTER schema" of card "Understanding Schema" of stack "SQLite Sampler"
# ID: button id 1276 of card id 1264 of stack "SQLite Sampler"
# Hash: rb6dHtTGwiGMibO1DBaw6w==
*/


--> SCRIPT OF BTN Show SQLITE_MASTER schema

on mouseUp
  global gConID
  
  answer information "This will return a list of the SQL used to create all tables in the current database."
  
  local tSQL
  put "SELECT sql FROM sqlite_master" into tSQL
   
  local tList
  put revDataFromQuery(,,gConID,tSQL) into tList
  
  replace tab with comma in tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "Records returned: " & return & tList
end mouseUp
