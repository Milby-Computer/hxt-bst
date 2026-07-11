Script "stack_revStandaloneSettings_button_id_1319"

/*
# Name: button "all" of group "include profiles" of group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1319 of group id 1220 of group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: ONDvCr4Im4C7XzJHUemJTQ==
*/


on mouseUp
  disable field "include profiles"
  set the cRevStandaloneSettings["includeProfiles"] of stack the cRevTargetStack of this stack to "*"
  revSetEdit
  revGetProfileList
end mouseUp
