Script "stack_revSETemplate_button_id_1022"

/*
# Name: button "Compile" of group "Toolbar" of card "Main" of stack "revSETemplate" of stack "revNewScriptEditor"
# ID: button id 1022 of group id 1021 of card id 1002 of stack "revSETemplate" of stack "revNewScriptEditor"
# Hash: nd8txZ6SCFNzGXmS66XJVg==
*/


on mouseUp
  local tCompilationResult
  actionCompile
  put the result into tCompilationResult
  if tCompilationResult is empty then
    disable me
  end if
end mouseUp
