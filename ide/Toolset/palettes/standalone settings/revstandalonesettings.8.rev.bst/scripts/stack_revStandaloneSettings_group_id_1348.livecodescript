Script "stack_revStandaloneSettings_group_id_1348"

/*
# Name: group id 1348 of group "Windows" of card "Windows" of stack "revStandaloneSettings"
# ID: group id 1348 of group id 1169 of card id 1016 of stack "revStandaloneSettings"
# Hash: xHNf8rSILSIRXTN87QmTKw==
*/


on keyDown x
  if the length of the text of the target < the cLength[the short name of the target] of this stack \
      or the short name of the target contains "version" or \
      the selectedText of the target <> "" then pass keyDown
end keyDown
