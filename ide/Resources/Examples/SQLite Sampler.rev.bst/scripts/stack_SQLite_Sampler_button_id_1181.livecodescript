Script "stack_SQLite_Sampler_button_id_1181"

/*
# Name: button "Delete Row" of card "View and Delete Data" of stack "SQLite Sampler"
# ID: button id 1181 of card id 1153 of stack "SQLite Sampler"
# Hash: K7LwoUf/wbPAFgIlFwjv4Q==
*/


on mouseUp
  global gConID
  
  local tRowNumber
  put the hilitedline of fld "users" into tRowNumber
  if tRowNumber is "" then
    exit mouseUp
  end if
  
  local tUserId
  set the itemDel to tab
  put item 1 of line tRowNumber of fld "users" into tUserID
  
  local tSQL
  put "DELETE FROM users WHERE userID=" & tUserID into tSQL
  
  local tResult
  revExecuteSQL gConID, tSQL
  put the result into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "Number of rows deleted: " & tResult
  send "mouseUp" to btn "Refresh Table"
end mouseUp
