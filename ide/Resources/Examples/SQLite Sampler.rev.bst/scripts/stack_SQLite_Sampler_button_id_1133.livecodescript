Script "stack_SQLite_Sampler_button_id_1133"

/*
# Name: button "Disconnect" of card "Connecting to SQLite" of stack "SQLite Sampler"
# ID: button id 1133 of card id 1091 of stack "SQLite Sampler"
# Hash: dYZT0//Kz8bFgiQdS8bJBg==
*/


on mouseUp
  global gConID
  local tResult
  revCloseDatabase gConID
  put the result into tResult
  handleRevDBerror tResult
  if the result is not empty then 
    answer warning the result
    exit mouseUp
  end if
  answer information "Connection Terminated "
end mouseUp
