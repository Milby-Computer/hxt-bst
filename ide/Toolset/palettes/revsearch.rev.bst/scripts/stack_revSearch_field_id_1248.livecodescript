Script "stack_revSearch_field_id_1248"

/*
# Name: field "Search Term" of card id 1002 of stack "revSearch"
# ID: field id 1248 of card id 1002 of stack "revSearch"
# Hash: AmDrUSgPrdRiSWWBWI237A==
*/


on rawkeyDown
  send "revEnabler" to me in 10 milliseconds
  pass rawkeyDown 
end rawkeyDown

on deleteKey
  send "revEnabler" to me in 10 milliseconds
  pass deleteKey
end deleteKey

on backSpaceKey
  send "revEnabler" to me in 10 milliseconds
  pass backSpaceKey
end backSpaceKey

on cutKey
  send "revEnabler" to me in 10 milliseconds
  pass cutKey
end cutKey

on commandKeyDown
  send "revEnabler" to me in 50 milliseconds
  pass commandKeyDown
end commandKeyDown

on closeField
  send "revEnabler" to me in 10 milliseconds
end closeField

on revEnabler
  if the text of fld "Search Term" of cd 1 of stack "revSearch" is empty then disable btn "Search" of cd 1 of stack "revSearch"
  else enable btn "Search" of cd 1 of stack "revSearch"
end revEnabler
