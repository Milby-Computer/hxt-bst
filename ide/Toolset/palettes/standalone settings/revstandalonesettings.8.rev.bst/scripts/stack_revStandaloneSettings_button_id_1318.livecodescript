Script "stack_revStandaloneSettings_button_id_1318"

/*
# Name: button "set" of group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1318 of group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: 8mzg0KDLb94k+excB2OwYQ==
*/


on mouseUp
  disable field "include profiles"
  disable group "include profiles"
  enable btn "set objects"
  set the cRevStandaloneSettings["includeProfiles"] of stack the cRevTargetStack of this stack to ""
  set the cRevStandaloneSettings["setToProfile"] of stack the cRevTargetStack of this stack to the label of btn "set objects"
  revSetEdit
  revGetProfileList
end mouseUp
