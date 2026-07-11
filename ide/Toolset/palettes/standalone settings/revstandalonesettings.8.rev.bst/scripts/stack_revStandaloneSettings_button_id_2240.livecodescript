Script "stack_revStandaloneSettings_button_id_2240"

/*
# Name: button "Initial Orientation" of group "User Interface Options" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: button id 2240 of group id 2238 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: ydp/jbdUk3tzyzivs1qf9w==
*/


on menuPick pItemName
   replace space with empty in pItemName
   replace "-" with empty in pItemName
   storeSetting "initial orientation", tolower(pItemName)
   updateOrientationSettings
end menuPick
