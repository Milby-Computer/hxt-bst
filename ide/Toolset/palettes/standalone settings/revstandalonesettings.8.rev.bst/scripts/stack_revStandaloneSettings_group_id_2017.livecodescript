Script "stack_revStandaloneSettings_group_id_2017"

/*
# Name: group "iPhone" of card "iOS" of stack "revStandaloneSettings"
# ID: group id 2017 of card id 1641 of stack "revStandaloneSettings"
# Hash: DKWJyeULPiL8rfgg9ecl7Q==
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
   
   revSetEdit
   set the enabled of group "Windows" to tEnable
   set the visible of btn "Windowschecked" to tEnable
   
   uacUpdateUIStatus
   checkUUID
end mouseUp
