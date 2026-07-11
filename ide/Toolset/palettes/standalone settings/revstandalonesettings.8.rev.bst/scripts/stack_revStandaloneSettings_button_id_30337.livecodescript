Script "stack_revStandaloneSettings_button_id_30337"

/*
# Name: button "Build for iOS" of group "buildbutton" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 30337 of group id 30346 of card id 1641 of stack "revStandaloneSettings"
# Hash: KgPNPkksRb6liviOy6Bkjw==
*/


on mouseUp
   set the cRevStandaloneSettings["ios"] of stack the cRevTargetStack of this stack to the hilite of button 1 of me
   if the hilite of button 1 of me then
      buildForEnabled "ios"
   end if
   revSetEdit
   updateIosSettingState
end mouseUp
