Script "stack_SQLite_Sampler_button_id_1242"

/*
# Name: button "Inner Join 3" of card "Reports" of stack "SQLite Sampler"
# ID: button id 1242 of card id 1110 of stack "SQLite Sampler"
# Hash: tp6f/8XKKXZLslC0WfFYlg==
*/


on mouseUp
  global gConID
  
  answer information "This will return a list of all the people who purchased Revolution Enterprise."
  
  local tSQL
  put "SELECT users.Name, apps.appName FROM users,apps WHERE users.userID=apps.appUserID AND apps.appName='Revolution Enterprise'" into tSQL
  
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
