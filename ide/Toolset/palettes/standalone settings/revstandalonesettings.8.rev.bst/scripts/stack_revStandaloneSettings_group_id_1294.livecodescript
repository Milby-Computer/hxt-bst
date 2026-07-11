Script "stack_revStandaloneSettings_group_id_1294"

/*
# Name: group "inclusions" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: group id 1294 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: IV2YErVaodqBXYORUUkb3A==
*/


on mouseUp   
   set the cRevStandaloneSettings["inclusions"] of \
         stack the cRevTargetStack of this stack to \
         the hilitedButtonName of me
   
   revSetEdit
   send "preOpenCard" to this card
end mouseUp
