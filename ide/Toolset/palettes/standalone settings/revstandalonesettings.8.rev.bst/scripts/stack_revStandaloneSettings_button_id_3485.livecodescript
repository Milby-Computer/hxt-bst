Script "stack_revStandaloneSettings_button_id_3485"

/*
# Name: button "iPhone Intial Orientation" of group "User Interface Options" of group "Basic Settings" of group "Basic Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 3485 of group id 3483 of group id 29811 of group id 30336 of card id 1641 of stack "revStandaloneSettings"
# Hash: RE892f/tSoSJcw4rb9QMUw==
*/


on menuPick pItemName
   replace space with empty in pItemName
   replace "-" with empty in pItemName
   storeSetting "iphone initial orientation", pItemName
   updateOrientationSettings
end menuPick
