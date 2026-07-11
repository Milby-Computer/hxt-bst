Script "stack_revStandaloneSettings_field_id_1211"

/*
# Name: field "include profiles" of group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: field id 1211 of group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: 5KfhSHuaaouiHBJThHOXVA==
*/


on mouseUp
  local tList
  repeat for each item tItem in the hilitedLines of me
    put line tItem of me &cr after tList
  end repeat
  set the cRevStandaloneSettings["includeProfiles"] of stack the cRevTargetStack of this stack to tList
  revSetEdit
end mouseUp
