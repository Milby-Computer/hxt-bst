Script "stack_revStandaloneSettings_button_id_3748"

/*
# Name: button "32bit_only" of group id 30343 of group "iOS Settings" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 3748 of group id 30343 of group id 30345 of card id 1641 of stack "revStandaloneSettings"
# Hash: m20UKYO7yn1TNWPFZi05nA==
*/


on mouseUp
   -- SN-2015-03-30: [[ Bug 14794 ]] Add the new standalone parameter
   --  32-bit only
   storeSetting "32-bit only", the hilite of me
end mouseUp
