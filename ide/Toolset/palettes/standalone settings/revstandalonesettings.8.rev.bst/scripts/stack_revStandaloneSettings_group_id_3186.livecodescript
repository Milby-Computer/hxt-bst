Script "stack_revStandaloneSettings_group_id_3186"

/*
# Name: group id 3186 of group "Samsung" of group "In App Purchasing" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: group id 3186 of group id 3182 of group id 3173 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: EXQ4aW+KM7WzVGAUK+nFMA==
*/


on mouseUp
   if the hilite of button "Test Failure"of me then
      get -1
   else if the hilite of button "Production" of me then
      get 0
   else if the hilite of button "Test Success" of me then
      get 1
   end if
   storeSetting "samsungIapMode", it
   updateInAppPurchaseSettings
end mouseUp
