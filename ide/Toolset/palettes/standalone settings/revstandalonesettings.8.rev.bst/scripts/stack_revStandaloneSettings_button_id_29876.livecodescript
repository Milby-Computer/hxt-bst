Script "stack_revStandaloneSettings_button_id_29876"

/*
# Name: button "Add" of group "URL Query" of group "Requirement" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 29876 of group id 29881 of group id 30344 of card id 1641 of stack "revStandaloneSettings"
# Hash: N5+296YJwpHVaS3YUkT+/w==
*/


on mouseUp pOverRide
   local tPrev
   ask "Please enter the URL to whitelist"
   if it is empty then
      exit mouseUp
   end if
   put fld "urlwhitelist" into tPrev
   if it is among the lines of tPrev then
      answer information "That URL is already included." with "OK"
      exit mouseUp
   end if
   put it into line (the number of lines in tPrev+1) of tPrev
   put tPrev into fld "urlwhitelist"
   storeSetting "urlwhitelist", tPrev
end mouseUp
