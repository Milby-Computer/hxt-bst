Script "stack_revStandaloneSettings_field_id_1240"

/*
# Name: field "substackFolder" of group "moveSubstacks" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: field id 1240 of group id 1260 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: lMOzyfYV/PqjrJ3kxadYlw==
*/



on keyDown pWHich
  if pWhich is in ":/\*?<>|" then beep
  else pass keyDown
end keyDown

on closeField
  local tStackFiles,tStackFile
  put the hilitedStackFiles of fld "stackfiles" into tStackFiles
  repeat for each line tStackFile in tStackFiles
    set the cRevStandaloneSettings["substackFolder"] of stack tStackFile to me
    revSetEdit the short name of stack tStackFile
  end repeat
  revSetEdit
end closeField
