Script "stack_revStandaloneSettings_button_id_32084"

/*
# Name: button "Allow Http Connections" of group "Application Permissions" of group "Android Settings" of card "Android" of stack "revStandaloneSettings"
# ID: button id 32084 of group id 2352 of group id 2072 of card id 2060 of stack "revStandaloneSettings"
# Hash: tmb6wwzmTrmBFW6+DdTgCA==
*/


on mouseUp
   storeSetting "allow http", the hilited of me
end mouseUp
