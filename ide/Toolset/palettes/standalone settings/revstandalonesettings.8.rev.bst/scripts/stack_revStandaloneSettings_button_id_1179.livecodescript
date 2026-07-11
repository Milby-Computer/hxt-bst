Script "stack_revStandaloneSettings_button_id_1179"

/*
# Name: button "errorDialog" of card "Bug Reports" of stack "revStandaloneSettings"
# ID: button id 1179 of card id 1017 of stack "revStandaloneSettings"
# Hash: /aoHc8IgeFccu0FGsNx1mg==
*/


on mouseUp
  set the enabled of group "errorDialog" to the hilite of me
  -- OK-2007-09-26 : Bug 5436
  set the visible of button "BugsChecked" of group "checks" to the hilite of me
  set the cRevStandaloneSettings["errorDialog"] of stack the cRevTargetStack of this stack to the hilite of me
  revSetEdit
end mouseUp
