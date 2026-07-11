Script "stack_SQLite_Sampler_button_id_1240"

/*
# Name: button "Inner Join 1" of card "Reports" of stack "SQLite Sampler"
# ID: button id 1240 of card id 1110 of stack "SQLite Sampler"
# Hash: enzxfuZZETfIsuHP3e1udg==
*/


on mouseUp
  global gConID
  
  answer information "This will return a list of all users and corresponding apps they've purchased"
  
  local tSQL
  put "SELECT users.Name, apps.appName FROM users,apps WHERE users.userID=apps.appUserID" into tSQL
  
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
