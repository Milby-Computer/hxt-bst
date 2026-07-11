Script "stack_SQLite_Sampler_button_id_1244"

/*
# Name: button "Outer Join 1" of card "Reports" of stack "SQLite Sampler"
# ID: button id 1244 of card id 1110 of stack "SQLite Sampler"
# Hash: gRToDH+sRQogr68UDFW4jg==
*/


on mouseUp
  global gConID
  
  answer information "This will return a list of all the users and the application(s) purchased (if any)."
  
  local tSQL
  put "SELECT users.name, apps.appName FROM users LEFT JOIN apps ON users.userID=apps.appUserID" into tSQL
   
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
