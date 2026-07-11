Script "stack_revStandaloneSettings_button_id_1210"

/*
# Name: button "selected" of group "include profiles" of group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1210 of group id 1220 of group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: GlIW5UKUL4T3G+pNM/fNnw==
*/


on mouseUp
  local tList
  enable field "include profiles"
  repeat for each item tItem in the hilitedLines of fld "include profiles"
    put line tItem of me &cr after tList
  end repeat
  set the cRevStandaloneSettings["includeProfiles"] of stack the cRevTargetStack of this stack to tList
  revSetEdit
  revGetProfileList
end mouseUp
