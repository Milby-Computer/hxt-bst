Script "stack_revStandaloneSettings_group_id_3178"

/*
# Name: group id 3178 of group "Store" of group "In App Purchasing" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: group id 3178 of group id 3176 of group id 3173 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: oIwjAdukmVuE4yWqGEMZZw==
*/


on mouseup
   if the hilite of button  "Google" of me then
      get "Google"
   else if the hilite of button "Amazon" of me then
      get "Amazon"
   else if the hilite of button "Samsung" of me then
      get "Samsung"
   end if
   storeSetting "billingProvider", it
   updateInAppPurchaseSettings
end mouseup
