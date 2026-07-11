Script "stack_revStandaloneSettings_button_id_3193"

/*
# Name: button "In App Purchasing" of group "In App Purchasing" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: button id 3193 of group id 3173 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: ksQlh6H7wgN1PwtDmGREHw==
*/


on mouseUp
   storeSetting "inAppPurchasing", the hilite of me
   updateInAppPurchaseSettings
end mouseUp
