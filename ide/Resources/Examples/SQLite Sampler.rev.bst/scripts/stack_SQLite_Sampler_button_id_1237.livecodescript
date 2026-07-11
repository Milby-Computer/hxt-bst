Script "stack_SQLite_Sampler_button_id_1237"

/*
# Name: button "Default Data" of card "Edit Databases" of stack "SQLite Sampler"
# ID: button id 1237 of card id 1206 of stack "SQLite Sampler"
# Hash: BtKpmCSUV5/cMrrH+ULxlw==
*/


on mouseUp
  global gConID
  
  answer "This will delete all existing data in this database!" with "Cancel" or "OK"
  if it is "cancel" then
    exit mouseUp
  end if
  
  local tSQL, tResult
  put "DROP TABLE users" into tSQL
  revExecuteSQL gConID, tSQL
  put the result into tResult
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  put "DROP TABLE apps" into tSQL
  revExecuteSQL gConID, tSQL
  put the result into tResult
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  put "CREATE TABLE users(userID integer primary key, name text,email text,emailList boolean)" into tSQL
  revExecuteSQL gConID, tSQL
  put the result into tResult
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  put "CREATE TABLE apps(appID integer primary key, appName text,appRegCode text,appUserID integer)" into tSQL
  revExecuteSQL gConID,tSQL
  put the result into tResult
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "New tables: users and apps created"
  
  local tList
  put the altDefaultUsersData of me into tList 
  repeat for each line tLine in tList
    put "INSERT INTO users(userID,name,email,emailList) VALUES(null," & tLine & ")" into tSQL
    revExecuteSQL gConID, tSQL
    put the result into tResult
    
    handleRevDBerror tResult
    if the result is not empty then 
      answer warning the result
      exit mouseUp
    end if
  end repeat
  
  put the altDefaultAppsData of me into tList
  
  repeat for each line tLine in tList
    put "INSERT INTO apps(appID,appName,appRegCode,appUserID) VALUES(null," & tLine & ")" into tSQL
     
    revExecuteSQL gConID, tSQL
    put the result into tResult
     
    handleRevDBerror tResult
    if the result is not empty then 
      answer warning the result
      exit mouseUp
    end if
  end repeat
  
  send "mouseUp" to btn "Refresh users"
  send "mouseUp" to btn "Refresh apps"
  
end mouseUp

function cleanSQL pSQL
  replace "'" with "''" in pSQL
  replace quote with quote & quote in pSQL
  replace cr with "*CR*" in pSQL
  replace tab with "*TAB*" in pSQL
  return pSQL
end cleanSQL
