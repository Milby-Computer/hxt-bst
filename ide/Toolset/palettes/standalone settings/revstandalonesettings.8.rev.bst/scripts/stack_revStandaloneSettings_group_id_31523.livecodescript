Script "stack_revStandaloneSettings_group_id_31523"

/*
# Name: group "Android Targets" of card "Android" of stack "revStandaloneSettings"
# ID: group id 31523 of card id 2060 of stack "revStandaloneSettings"
# Hash: pZQUt8ixzqshIAZjhtgt7w==
*/


on mouseUp
   if word 1 of the target is not "button" then
      exit mouseUp
   end if
   
   local tTarget
   put the short name of the target into tTarget
   updateAndroidArch word 2 of tTarget, the hilite of the target
end mouseUp
