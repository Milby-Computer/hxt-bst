Script "stack_revStandaloneSettings_button_id_32077"

/*
# Name: button "Use system background color" of group "Splash" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 32077 of group id 3538 of card id 1641 of stack "revStandaloneSettings"
# Hash: bP1Ebjrpdd/AXJrRdQcCbw==
*/


on mouseUp
   if the hilite of me then
      storeSetting "launch-backcolor", empty
      set the opaque of graphic "launch-backcolor" to false
   else
      storeSetting "launch-backcolor", "0,0,0"
      set the backColor of graphic "launch-backcolor" to 0,0,0
      set the opaque of graphic "launch-backcolor" to true
   end if
end mouseUp
