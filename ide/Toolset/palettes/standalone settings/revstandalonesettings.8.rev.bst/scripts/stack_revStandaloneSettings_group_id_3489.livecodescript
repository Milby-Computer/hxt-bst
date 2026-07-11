Script "stack_revStandaloneSettings_group_id_3489"

/*
# Name: group "iPad Initial Orientations" of group "User Interface Options" of group "Basic Settings" of group "Basic Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: group id 3489 of group id 3483 of group id 29811 of group id 30336 of card id 1641 of stack "revStandaloneSettings"
# Hash: pqRvhARpU9Z1Age30M4w2g==
*/


on mouseUp
   if word 1 of the name of the target is not "button" then
      exit mouseUp
   end if
   
   local tOld, tNew
   put fetchSetting("ipad intial orientations") into tOld
   put empty into tNew
   repeat for each item tItem in tOld
      if tItem is not the short name of the target then
         put tItem & comma after tNew
      end if
   end repeat
   if the hilite of the target then
      put the short name of the target & comma after tNew
   end if
   
   -- MM-2011-09-29: Make sure we have atleast one supported oreintation.
   --
   --   if tNew is empty then
   --      put "Portrait" into tNew
   --      set the hilite of button "Portrait" of me to true
   --   end if
   
   storeSetting "ipad intial orientations", tNew
   updateOrientationSettings
end mouseUp
