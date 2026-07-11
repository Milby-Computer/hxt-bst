Script "stack_revStandaloneSettings_group_id_1266"

/*
# Name: group "platforms" of card "Windows" of stack "revStandaloneSettings"
# ID: group id 1266 of card id 1016 of stack "revStandaloneSettings"
# Hash: I0gUiNJkarbXj1DRVWyj1w==
*/


on mouseUp
   local tEnable
   put false into tEnable
   repeat with x = 1 to the number of buttons of me
      if the hilite of button x of me then
         put revDownloadEngine(the short name of button x of me) into tEnable
         if not tEnable then
            set the hilite of button x of me to false
         end if
      end if
      set the cRevStandaloneSettings[the short name of button x of me] of stack the cRevTargetStack of this stack to the hilite of button x of me
   end repeat
   buildForEnabled "Windows"
   revSetEdit
   uacUpdateUIStatus
   checkUUID
   set the enabled of group "Windows" to tEnable 
end mouseUp
