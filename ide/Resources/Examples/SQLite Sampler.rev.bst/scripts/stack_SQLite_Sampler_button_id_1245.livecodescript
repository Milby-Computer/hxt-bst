Script "stack_SQLite_Sampler_button_id_1245"

/*
# Name: button "Outer Join 2" of card "Reports" of stack "SQLite Sampler"
# ID: button id 1245 of card id 1110 of stack "SQLite Sampler"
# Hash: HGZNyv1/CgPkas3LJijzGA==
*/


on mouseUp
  global gConID
  
  answer information "This will return a list of all the users and then number of application(s) purchased (if any)."
  
  local tSQL
  put "SELECT users.name, COUNT(apps.appID) FROM users LEFT JOIN apps ON users.userID=apps.appUserID GROUP BY name ORDER BY name" into tSQL
  
  local tList
  put revdb_querylist(,,gConID,tSQL) into tList
  
  replace tab with comma in tList
   
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "Records returned: " & return & tList
end mouseUp
