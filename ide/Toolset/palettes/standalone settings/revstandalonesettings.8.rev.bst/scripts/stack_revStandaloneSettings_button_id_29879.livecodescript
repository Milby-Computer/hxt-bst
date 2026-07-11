Script "stack_revStandaloneSettings_button_id_29879"

/*
# Name: button "Remove Entry" of group "URL Query" of group "Requirement" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 29879 of group id 29881 of group id 30344 of card id 1641 of stack "revStandaloneSettings"
# Hash: H39h1iKgeo2V4Z8o1P14wA==
*/


on mouseUp
   local tLines
   if the hilitedLines of fld "urlwhitelist" is not empty then
      put the hilitedLines of fld "urlwhitelist" into tLines
      repeat with X=the number of items in tLines down to 1
         delete line (item X of tLines) of fld "urlwhitelist"
      end repeat
      storeSetting "urlwhitelist", fld "urlwhitelist"
   end if
end mouseUp
