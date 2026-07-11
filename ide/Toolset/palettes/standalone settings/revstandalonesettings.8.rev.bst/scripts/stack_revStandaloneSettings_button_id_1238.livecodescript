Script "stack_revStandaloneSettings_button_id_1238"

/*
# Name: button "renameFiles" of group "moveSubstacks" of group "Advanced Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: button id 1238 of group id 1260 of group id 2036 of card id 1013 of stack "revStandaloneSettings"
# Hash: +o3f1KQrZIaj6PMWKhINxw==
*/


on mouseUp
  local tStackFiles,tStackFile
  put the hilitedStackFiles of fld "stackfiles" into tStackFiles
  repeat for each line tStackFile in tStackFiles
    set the cRevStandaloneSettings["renameGeneric"] of stack tStackFile to the hilite of me
    revSetEdit the short name of stack tStackFile
  end repeat
end mouseUp
