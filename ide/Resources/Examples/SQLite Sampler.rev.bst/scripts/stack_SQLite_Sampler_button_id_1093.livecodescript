Script "stack_SQLite_Sampler_button_id_1093"

/*
# Name: button "Connect to AppReg" of card "Connecting to SQLite" of stack "SQLite Sampler"
# ID: button id 1093 of card id 1091 of stack "SQLite Sampler"
# Hash: kjlVBuqt+pM4QgB8QdpgaA==
*/


on mouseUp
  global gConID
  local tConId
  put revOpenDatabase("sqlite","AppReg3.db",,,,,,) into tConID
  if tConID is "" then 
    answer warning "Problem creating or accessing database!"
  else
    answer information "AppReg Connected! Your connection ID is: " & tConID
    put tConID into gConID
  end if
end mouseUp
