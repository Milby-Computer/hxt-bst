Script "stack_SQLite_Sampler_button_id_1233"

/*
# Name: button "Add Row" of card "Edit Databases" of stack "SQLite Sampler"
# ID: button id 1233 of card id 1206 of stack "SQLite Sampler"
# Hash: G8BszyLi0KZyvkXQWMBf9A==
*/


on mouseUp
  global gConID
  
  local tColumnItems, tItem
  put "name,email" into tColumnItems
  
  local tRowData
  repeat for each item tItem in tColumnItems
    ask question "New value for column: " & tItem
    if it is empty or the result is "cancel" then exit to top
    put "'" & cleanSQL(it) & "'" & "," after tRowData
  end repeat
  
  ask question "New value for column: emailList" with "true"
  if it is empty or the result is "cancel" then
    exit to top
  end if
  put "'" & cleanSQL(it) & "'" after tRowData
  
  local tSQL
  put "INSERT INTO users(userID,name,email,emailList) VALUES(null," & tRowData & ")" into tSQL
  
  local tResult
  revExecuteSQL gConID, tSQL
  put the result into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  answer information "Number of rows added: " & return & tResult
  send "mouseUp" to btn "Refresh users"
end mouseUp

function cleanSQL pSQL
  replace "'" with "''" in pSQL
  return pSQL
end cleanSQL
