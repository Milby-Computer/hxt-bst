Script "stack_revStandaloneSettings_button_id_3607"

/*
# Name: button "Minimum iOS Version" of group id 30343 of group "iOS Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 3607 of group id 30343 of group id 30345 of card id 1641 of stack "revStandaloneSettings"
# Hash: drYEZTja5g/TV7//eSriKg==
*/


on menuPick pItemName
   set the itemDelimiter to "."
   storeSetting "minimum version", item 1 to 2 of (word 1 of pItemName)
end menuPick
