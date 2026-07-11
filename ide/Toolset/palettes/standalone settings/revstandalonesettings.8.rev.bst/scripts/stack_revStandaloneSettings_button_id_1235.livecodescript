Script "stack_revStandaloneSettings_button_id_1235"

/*
# Name: button "Remove Stack File" of group "Basic Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: button id 1235 of group id 2037 of card id 1013 of stack "revStandaloneSettings"
# Hash: DoQCiJckgKTLH+KAcB4IrQ==
*/


on mouseUp
  local tRemove,tLines,tFiles,tItem
  if the hilitedLines of fld "stackfiles" is not empty then
    put the hilitedLines of fld "stackfiles" into tLines
    put the cStackPaths of fld "stackfiles" into tFiles
    repeat for each item tItem in tLines
      if tItem = 1 then
        answer error "The standalone mainstack can not be removed from the application."
      else
        put line tItem of tFiles & cr after tRemove
      end if
    end repeat
    delete char -1 of tRemove
    revRemoveStackFiles tRemove
  end if
end mouseUp
