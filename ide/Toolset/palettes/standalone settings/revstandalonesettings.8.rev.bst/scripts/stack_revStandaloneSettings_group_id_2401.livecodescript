Script "stack_revStandaloneSettings_group_id_2401"

/*
# Name: group "permissions" of group "Application Permissions" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: group id 2401 of group id 2352 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: MFNqZtO+JyU81EIiDHFrlw==
*/


on mouseUp
   local tArray
   repeat with i = 1 to the number of buttons of me
      get the short name of button i of me
      if the hilite of button i of me then
         put "true" into tArray[it]
      end if
   end repeat
   set the enabled of button "Allow Http Connections" to the hilite of button "Internet" of me
   storeSetting "application permissions", tArray
end mouseUp
