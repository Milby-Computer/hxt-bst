Script "stack_revStandaloneSettings_button_id_1214"

/*
# Name: button "set objects" of group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1214 of group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: eIzDzIOowesvNVgvL8OpjA==
*/


on menuPick pWhich
  set the cRevStandaloneSettings["setToProfile"] of stack the cRevTargetStack of this stack to pWhich
  revSetEdit
end menuPick
