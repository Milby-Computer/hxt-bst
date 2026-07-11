Script "stack_revEntitlements_button_id_1004"

/*
# Name: button "Tab Menu" of card id 1002 of stack "revEntitlements" of stack "revStandaloneSettings"
# ID: button id 1004 of card id 1002 of stack "revEntitlements" of stack "revStandaloneSettings"
# Hash: e/1qhesWNKhyykK1w9TJSw==
*/


on menuPick pChosenItem, pPreviousTab
   lock screen
   hide group pPreviousTab
   show group pChosenItem   
end menuPick
