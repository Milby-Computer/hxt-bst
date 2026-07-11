Script "stack_SQLite_Sampler_button_id_1232"

/*
# Name: button "Delete Row" of card "Edit Databases" of stack "SQLite Sampler"
# ID: button id 1232 of card id 1206 of stack "SQLite Sampler"
# Hash: /wuHfssEqnEOYm+esT/EAg==
*/


on mouseUp
  global gConID
  
  local tNum
  put the hilitedline of fld "users" into tNum
  if tNum is "" then
    exit mouseUp
  end if
  
  local tUserId
  set the itemDel to tab
  put item 1 of line tNum of fld "users" into tUserID
  
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
  send "mouseUp" to btn "Refresh users"
end mouseUp
