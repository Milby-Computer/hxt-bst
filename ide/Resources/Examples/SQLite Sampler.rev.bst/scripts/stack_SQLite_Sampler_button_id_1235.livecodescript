Script "stack_SQLite_Sampler_button_id_1235"

/*
# Name: button "Delete Row" of card "Edit Databases" of stack "SQLite Sampler"
# ID: button id 1235 of card id 1206 of stack "SQLite Sampler"
# Hash: s5W3cDHktz43MoagyMnqsA==
*/


on mouseUp
  global gConID
  
  local tNum
  put the hilitedline of fld "apps" into tNum
  if tNum is "" then
    exit mouseUp
  end if
  
  local tAppId
  set the itemDel to tab
  put item 1 of line tNum of fld "apps" into tAppID
  
   
  local tSQL
  put "DELETE FROM apps WHERE appID=" & tAppID into tSQL
   
  local tResult
  put revdb_execute(gConID,tSQL) into tResult
  
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  answer information "Number of rows deleted: " & tResult
  send "mouseUp" to btn "Refresh apps"
end mouseUp
