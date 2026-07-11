Script "stack_SQLite_Sampler_field_id_1263"

/*
# Name: field "vers" of card "Introduction" of stack "SQLite Sampler"
# ID: field id 1263 of card id 1002 of stack "SQLite Sampler"
# Hash: dsZDWL7ZzmVF7Qdb2AQ0tw==
*/


--> all handlers

on mouseUp
  if the shiftKey is down then
    ask "New Version:" with me
    if it is empty then exit mouseUp
    put it into me
    set the altVers of img "altPlug.png" to it
  end if
end mouseUp
