Script "stack_SQLite_Sampler_button_id_1200"

/*
# Name: button "Delete Database File" of card "Connecting to SQLite" of stack "SQLite Sampler"
# ID: button id 1200 of card id 1091 of stack "SQLite Sampler"
# Hash: wB1h7wwnerwkRbTbHCC9KA==
*/


on mouseUp
  answer question "This will delete the file: appReg.db" with "Cancel" or "OK"
  if it is "Cancel" then exit mouseUp
  if there is a file "appReg.db" then
    delete file "appReg.db"
    if the result is not empty then answer warning the result
  end if
end mouseUp
