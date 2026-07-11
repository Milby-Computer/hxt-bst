Script "stack_revStandaloneSettings_group_id_2268"

/*
# Name: group "Device Capabilities" of group "device requirements" of group "Requirements and Restrictions" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: group id 2268 of group id 2264 of group id 2255 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: P+2BkNy7W41mySwxYpLdCQ==
*/


local sLinkedPermissions = "hardware.microphone,RECORD_AUDIO|hardware.location.gps,ACCESS_FINE_LOCATION|hardware.location.network,ACCESS_COARSE_LOCATION|hardware.camera,CAMERA"

on mouseUp
   local tArray
   local tPermissions
   
   repeat with i = 1 to the number of groups of me
      get the short name of group i of me
      if the hilite of button 1 of group i of me then
         put "true" into tArray[it]
      else if the hilite of button 2 of group i of me then
         put "false" into tArray[it]
      end if
   end repeat
   #set the linedelimiter to "|"
   #repeat for each line tLine in sLinkedPermissions
   #   if tArray[item 1 of tLine] is not empty then
   #      put true into tPermissions[item 2 of tLine]
   #   end if
   #end repeat
   storeSetting "device capabilities", tArray
   #storeSetting "capability permissions", tPermissions
end mouseUp
