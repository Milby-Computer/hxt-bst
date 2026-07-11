Script "stack_revStandaloneSettings_graphic_id_32058"

/*
# Name: graphic "launch-backcolor" of group "Splash" of card "iOS" of stack "revStandaloneSettings"
# ID: graphic id 32058 of group id 3538 of card id 1641 of stack "revStandaloneSettings"
# Hash: qg8D1sgGSyqcgTsrlO5aAQ==
*/


on mouseUp
   answer color with the backColor of me
   if the result is "cancel" then
      exit mouseUp
   end if
   storeSetting "launch-backcolor", it
   set the backColor of me to it
   set the opaque of me to true
   set the hilite of button "Use system background color" to false
end mouseUp
