Script "stack_revStandaloneSettings_button_id_1237"

/*
# Name: button "moveSubstacks" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: button id 1237 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: EWCc0STRlHK78kAAvqgB+Q==
*/


on mouseUp
  local tStackFiles,tStackFile
  put the hilitedStackFiles of fld "stackfiles" into tStackFiles
  repeat for each line tStackFile in tStackFiles
    set the cRevStandaloneSettings["moveSubstacks"] of stack tStackFile to the hilite of me
    revSetEdit the short name of stack tStackFile
  end repeat
  set the enabled of group "moveSubstacks" to the hilite of me
end mouseUp
