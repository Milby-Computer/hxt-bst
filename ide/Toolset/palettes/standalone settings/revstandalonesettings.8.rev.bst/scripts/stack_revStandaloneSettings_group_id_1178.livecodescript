Script "stack_revStandaloneSettings_group_id_1178"

/*
# Name: group "UNIX" of card "UNIX" of stack "revStandaloneSettings"
# ID: group id 1178 of card id 1035 of stack "revStandaloneSettings"
# Hash: 7uvtlwjlX7Hz3Wm4sCg5kw==
*/


on mouseUp
  repeat with X=1 to the number of btns of me
    set the cRevStandaloneSettings["UNIX",the short name of btn X of me] of stack the cRevTargetStack of this stack to the hilite of btn X of me
  end repeat
  revSetEdit
end mouseUp
