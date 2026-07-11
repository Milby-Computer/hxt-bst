Script "stack_SQLite_Sampler_button_id_1155"

/*
# Name: button "Add Data to users" of card "Add Data" of stack "SQLite Sampler"
# ID: button id 1155 of card id 1106 of stack "SQLite Sampler"
# Hash: X7gT0TKg/Cq3VRFS+PWQ6Q==
*/


on mouseUp
  global gConID
  
  local tColumnItems
  put "name,email" into tColumnItems
  
  local tRowData
  repeat for each item I in tColumnItems
    ask question "New value for column: " & I
    if it is empty or the result is "cancel" then exit to top
    put "'" & cleanSQL(it) & "'" & "," after tRowData
  end repeat
  
  ask question "New value for column: emailList" with "true"
  if it is empty or the result is "cancel" then exit to top
  put "'" & cleanSQL(it) & "'" after tRowData
  
  local tSQL
  put "INSERT INTO users(userID,name,email,emailList)" & \
      " VALUES(null," & tRowData & ")" into tSQL
   
  local tResult
  revExecuteSQL gConID, tSQL
  put the result into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  answer information "Number of rows added: " & return & tResult
end mouseUp

function cleanSQL pSQL
  replace "'" with "''" in pSQL
  return pSQL
end cleanSQL
