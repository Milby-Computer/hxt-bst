Script "stack_SQLite_Sampler_button_id_1138"

/*
# Name: button "CREATE TABLE users" of card "Create Tables" of stack "SQLite Sampler"
# ID: button id 1138 of card id 1102 of stack "SQLite Sampler"
# Hash: PA66Ay2Sb+OvHIL4yNSFKA==
*/


on mouseUp
  global gConID
  if gConID is "" then
    answer information "No Database is Connected to, please go back 1 step and connect to the Database!"
    exit mouseUp
  end if
  
  local tSQL, tResult
  put "CREATE TABLE users(userID integer primary key, name text,email text,emailList boolean)" into tSQL
  revExecuteSQL gConID, tSQL
  put the result into tResult
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  answer information "Number of Tables Added: " & tResult
end mouseUp
