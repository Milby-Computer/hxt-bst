Script "stack_revStandaloneSettings_group_id_1215"

/*
# Name: group "profiles" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: group id 1215 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: FWusCKj416KkVC8mWbz1ig==
*/


on revGetProfileList
   local tFinalList
   set the cursor to watch
   put revGetPropertyProfilesList() into tFinalList
   put tFinalList into fld "include profiles"
   put tFinalList into btn "set objects"
   unlock cursor
   if tFinalList = "" then
      beep 1
      answer information "There are no profiles in this application"
      click at the loc of btn "remove"
   end if
end revGetProfileList
