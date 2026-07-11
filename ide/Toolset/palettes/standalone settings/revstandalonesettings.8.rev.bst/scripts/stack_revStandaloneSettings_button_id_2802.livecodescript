Script "stack_revStandaloneSettings_button_id_2802"

/*
# Name: button "Install Location" of group "Basic Application Settings" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: button id 2802 of group id 2073 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: 343RpIw6oe/cJbDXBpiuCw==
*/


on menuPick pItemName
   storeSetting "installLocation", pItemName
   updateSettings
end menuPick
