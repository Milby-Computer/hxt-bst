Script "stack_SQLite_Sampler_button_id_1277"

/*
# Name: button "Add Columns Example" of card "Adding and Deleting Columns" of stack "SQLite Sampler"
# ID: button id 1277 of card id 1272 of stack "SQLite Sampler"
# Hash: rzQBt4Mnd4abrvhyEL5EHA==
*/


on mouseUp
  global gConID
  
  answer information "This will add the columns 'city' and 'state' to table 'users'."
  
  local tSQL
  put "BEGIN TRANSACTION;" into tSQL
  put "CREATE TEMPORARY TABLE users_backup(userID,name,email,emailList);" after tSQL
  put "INSERT INTO users_backup SELECT userID,name,email,emailList FROM users;" after tSQL
  put "DROP TABLE users;" after tSQL
  put "CREATE TABLE users(userID integer primary key, name text,email text,emailList boolean,city text,state text);" after tSQL
  put "INSERT INTO users(userID,name,email,emailList) SELECT userID,name,email,emailList FROM users_backup;" after tSQL
  put "DROP TABLE users_backup;" after tSQL
  put "COMMIT;" after tSQL
  
  local tResult
  revExecuteSQL gConID,tSQL 
  put the result into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  put "SELECT sql FROM sqlite_master" into tSQL
  
  local tList
  put revDataFromQuery(,,gConID,tSQL) into tList
  
  replace tab with comma in tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "New schema created: " & return & tList
  
  
  put "SELECT * FROM users" into tSQL
  put revDataFromQuery(,,gConID,tSQL) into tList
  
  replace tab with comma in tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "Data for new table 'users': " & return & tList
end mouseUp
