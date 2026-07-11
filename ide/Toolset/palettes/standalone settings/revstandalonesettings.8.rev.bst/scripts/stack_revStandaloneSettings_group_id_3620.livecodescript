Script "stack_revStandaloneSettings_group_id_3620"

/*
# Name: group "Device Capabilities" of group id 3616 of group "Basic Settings" of group "Basic Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: group id 3620 of group id 3616 of group id 3461 of group id 30336 of card id 1641 of stack "revStandaloneSettings"
# Hash: 7IRqxTxKF9VSJ2YavSY9Lw==
*/


on mouseUp
   -- MM-2012-03-07: [[ BUG 10060 ]] Make sure all requirements are checked
   local tArray
   repeat with i = 1 to 18
      get the short name of group i of me
      if the hilite of button 1 of group i of me then
         put "true" into tArray[it]
      else if the hilite of button 2 of group i of me then
         put "false" into tArray[it]
      end if
   end repeat
   storeSetting "device capabilities", tArray
   updateSettings
end mouseUp
