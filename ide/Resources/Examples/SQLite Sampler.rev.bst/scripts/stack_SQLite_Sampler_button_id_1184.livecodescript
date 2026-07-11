Script "stack_SQLite_Sampler_button_id_1184"

/*
# Name: button "Refresh Table" of card "Update Data" of stack "SQLite Sampler"
# ID: button id 1184 of card id 1108 of stack "SQLite Sampler"
# Hash: 46Gypz/mhRXlk60P2fBi+A==
*/


on mouseUp
  global gConID
  
  local tSQL
  put "SELECT * FROM users" into tSQL
   
  local tList
  put revDataFromQuery(,,gConID,tSQL) into tList
  
  handleRevDBerror tList
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  
  local tRowData
  repeat for each line tLine in tList
    repeat for each item tItem in tLine
      put tItem & tab after tRowData
    end repeat
    delete last char of tRowData
    put return after tRowData
  end repeat
  delete last char of tRowData
  
  put tRowData into fld "Users"
end mouseUp
