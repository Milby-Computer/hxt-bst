Script "stack_revStandaloneSettings_group_id_1190"

/*
# Name: group "errorDialog" of card "Bug Reports" of stack "revStandaloneSettings"
# ID: group id 1190 of card id 1017 of stack "revStandaloneSettings"
# Hash: waVYiaMIwy4XuiCa9Sm0bw==
*/


on closeField
  set the cRevStandaloneSettings["ErrorDialog,"&the short name of the target] of stack the cRevTargetStack of this stack to the text of the target
  revSetEdit
  pass closeField
end closeField

on returnInField
  set the cRevStandaloneSettings["ErrorDialog,"&the short name of the target] of stack the cRevTargetStack of this stack to the text of the target
  revSetEdit
  pass returnInField
end returnInField

on tabKey
  set the cRevStandaloneSettings["ErrorDialog,"&the short name of the target] of stack the cRevTargetStack of this stack to the text of the target
  revSetEdit
  pass tabKey
end tabKey

on mouseUp
  if word 1 of the target = "button" then
    set the cRevStandaloneSettings["ErrorDialog,"&the short name of the target] of stack the cRevTargetStack of this stack to the hilite of the target
    revSetEdit
  end if
  pass mouseUp
end mouseUp
