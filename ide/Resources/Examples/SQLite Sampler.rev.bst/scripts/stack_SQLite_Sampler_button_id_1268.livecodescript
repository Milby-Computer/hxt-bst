Script "stack_SQLite_Sampler_button_id_1268"

/*
# Name: button "Delete users Table" of card "Delete Tables" of stack "SQLite Sampler"
# ID: button id 1268 of card id 1112 of stack "SQLite Sampler"
# Hash: 3VKmk9IiFI4rHxaK/25mNQ==
*/


on mouseUp
  global gConID
  
  local tSQL
  put "DROP TABLE users" into tSQL
  
  local tResult
  put revdb_execute(gConID,tSQL) into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "Tables Deleted: " & tResult
end mouseUp
