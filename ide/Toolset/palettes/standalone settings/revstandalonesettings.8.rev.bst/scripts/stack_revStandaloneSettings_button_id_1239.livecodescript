Script "stack_revStandaloneSettings_button_id_1239"

/*
# Name: button "Data stacks directory" of group "moveSubstacks" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: button id 1239 of group id 1260 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: wH0Kge3y2dAoBlNiX+SxXA==
*/


on mouseUp
  local tStackFiles,tStackFile
  put the hilitedStackFiles of fld "stackfiles" into tStackFiles
  repeat for each line tStackFile in tStackFiles
    if the hilite of me then
      set the cRevStandaloneSettings["substackFolder"] of stack tStackFile to fld "substackFolder"
    else
      set the cRevStandaloneSettings["substackFolder"] of stack tStackFile to ""
    end if
    revSetEdit the short name of stack tStackFile
  end repeat
  set the enabled of fld "substackFolder" to the hilite of me
end mouseUp
