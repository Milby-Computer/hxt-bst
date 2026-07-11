Script "stack_revStandaloneSettings_button_id_1267"

/*
# Name: button "include" of group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1267 of group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: kn9/7+7Y4vh0YNroaqQnSQ==
*/


on mouseUp
  disable field "include profiles"
  enable group "include profiles"
  disable btn "set objects"
  set the hilitedButtonName of group "include profiles" to "all"
  set the cRevStandaloneSettings["includeProfiles"] of stack the cRevTargetStack of this stack to "*"
   set the cRevStandaloneSettings["setToProfile"] of stack the cRevTargetStack of this stack to ""
  revSetEdit
  revGetProfileList
end mouseUp
