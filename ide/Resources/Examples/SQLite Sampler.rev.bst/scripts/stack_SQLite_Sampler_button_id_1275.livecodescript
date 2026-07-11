Script "stack_SQLite_Sampler_button_id_1275"

/*
# Name: button "Delete Columns Example" of card "Adding and Deleting Columns" of stack "SQLite Sampler"
# ID: button id 1275 of card id 1272 of stack "SQLite Sampler"
# Hash: XjMXoqIkcvWCsDwVwdPL7g==
*/


--> SCRIPT OF BTN Delete Columns Example

on mouseUp
  global gConID
  
  answer information "This will delete the columns 'email' and 'emailList' from table 'users' and rename column 'name' to 'full_name'."
  
  local tSQL
  put "BEGIN TRANSACTION;" into tSQL
  put "CREATE TEMPORARY TABLE users_backup(userID,name);" after tSQL
  put "INSERT INTO users_backup SELECT userID,name FROM users;" after tSQL
  put "DROP TABLE users;" after tSQL
  put "CREATE TABLE users(userID,full_name);" after tSQL
  put "INSERT INTO users SELECT userID,name FROM users_backup;" after tSQL
  put "DROP TABLE users_backup;" after tSQL
  put "COMMIT;" after tSQL
  
  local tResult
  put revdb_execute(gConID,tSQL) into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  put "SELECT sql FROM sqlite_master" into tSQL
  
  local tList
  put revdb_querylist(,,gConID,tSQL) into tList
  
  replace tab with comma in tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "New schema created: " & return & tList
  
  put "SELECT * FROM users" into tSQL
  put revdb_querylist(,,gConID,tSQL) into tList
  
  replace tab with comma in tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "Data for new table 'users': " & return & tList
end mouseUp
