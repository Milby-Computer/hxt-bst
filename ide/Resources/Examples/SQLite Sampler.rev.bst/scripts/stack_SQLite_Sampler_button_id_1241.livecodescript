Script "stack_SQLite_Sampler_button_id_1241"

/*
# Name: button "Inner Join 2" of card "Reports" of stack "SQLite Sampler"
# ID: button id 1241 of card id 1110 of stack "SQLite Sampler"
# Hash: emQZSHVzLY9trrdrkmn0VA==
*/


on mouseUp
  global gConID
  
  answer information "This will return a list of the applications purchased by Fred Flintstone."
  
  local tSQL
  put "SELECT users.Name, apps.appName FROM users,apps WHERE users.userID=apps.appUserID AND users.name='Fred Flintstone'" into tSQL
  
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
