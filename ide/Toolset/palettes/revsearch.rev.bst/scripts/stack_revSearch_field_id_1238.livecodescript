Script "stack_revSearch_field_id_1238"

/*
# Name: field "Replace" of bkgnd "Controls" of stack "revSearch"
# ID: field id 1238 of bkgnd id 1149 of stack "revSearch"
# Hash: wp3mtCJCLKjd871A/LbH9Q==
*/


on keyDown
  send "revEnabler" to me in 10 milliseconds
  pass keyDown
end keyDown

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

on closeField
  send "revEnabler" to me in 10 milliseconds
end closeField

on revEnabler
   -- MM-2011-08-08: Always enable replace button allowing for replace with empty
   enable btn "Replace" of cd 1 of stack "revSearch"
   --if the text of fld "Replace" of cd 1 of stack "revSearch" is empty then disable btn "Replace" of cd 1 of stack "revSearch"
   --else enable btn "Replace" of cd 1 of stack "revSearch"
end revEnabler
