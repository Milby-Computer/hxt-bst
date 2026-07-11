Script "stack_revStandaloneSettings_button_id_3598"

/*
# Name: button "Status Bar Style" of group id 3593 of group "Basic Settings" of group "Basic Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 3598 of group id 3593 of group id 29811 of group id 30336 of card id 1641 of stack "revStandaloneSettings"
# Hash: J0b+FVISjdLG6b66QFCNJw==
*/


on menuPick pItemName
   replace space with empty in pItemName
   storeSetting "status bar style", pItemName
end menuPick
