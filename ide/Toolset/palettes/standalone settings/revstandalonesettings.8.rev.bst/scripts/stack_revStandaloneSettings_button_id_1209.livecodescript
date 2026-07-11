Script "stack_revStandaloneSettings_button_id_1209"

/*
# Name: button "remove" of group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1209 of group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: N77iWIr800JRib0xVOEdNQ==
*/


on mouseUp
  disable field "include profiles"
  disable btn "set objects"
  disable group "include profiles"
  set the cRevStandaloneSettings["includeProfiles"] of stack the cRevTargetStack of this stack to ""
  set the cRevStandaloneSettings["setToProfile"] of stack the cRevTargetStack of this stack to ""
  revSetEdit
end mouseUp
