Script "stack_revStandaloneSettings_button_id_2619"

/*
# Name: button "Signing" of group "Basic Application Settings" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: button id 2619 of group id 2073 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: c6hIiML7GCr3tmoaXz3tWw==
*/


on menuPick pItemName
   storeSetting "signing", pItemName
   updateSettings
end menuPick
