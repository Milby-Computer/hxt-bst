Script "stack_SQLite_Sampler_button_id_1236"

/*
# Name: button "Add Row" of card "Edit Databases" of stack "SQLite Sampler"
# ID: button id 1236 of card id 1206 of stack "SQLite Sampler"
# Hash: Yhh/mMgshAIIO3YljE8feQ==
*/


on mouseUp
  global gConID
  
  local tColumnItems
  put "appName,appRegCode" into tColumnItems
  
  local tRowData
  repeat for each item I in tColumnItems
    ask question "New value for column: " & I
    if it is empty or the result is "cancel" then
      exit to top
    end if
    put "'" & cleanSQL(it) & "'" & "," after tRowData
  end repeat
  
  ask question "Please enter a valid userID from table 'users':" with "1"
  if it is empty or the result is "cancel" then
    exit to top
  end if
  put "'" & cleanSQL(it) & "'" after tRowData
  
  local tSQL
  put "INSERT INTO apps(appID,appName,appRegCode,appUserID) VALUES(null," & tRowData & ")" into tSQL
  
  local tResult
  put revdb_execute(gConID,tSQL) into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  answer information "Number of rows added: " & return & tResult
  send "mouseUp" to btn "Refresh apps"
end mouseUp

function cleanSQL pSQL
  replace "'" with "''" in pSQL
  return pSQL
end cleanSQL
