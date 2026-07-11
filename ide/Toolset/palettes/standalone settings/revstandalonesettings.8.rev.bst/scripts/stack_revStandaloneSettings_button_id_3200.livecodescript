Script "stack_revStandaloneSettings_button_id_3200"

/*
# Name: button "usePixelScaling" of group "Windows" of card "Windows" of stack "revStandaloneSettings"
# ID: button id 3200 of group id 1169 of card id 1016 of stack "revStandaloneSettings"
# Hash: uezqw5ewW0L2MfK53x1C2Q==
*/


on mouseUp
   set the cRevStandaloneSettings["Windows,usePixelScaling"] of stack the cRevTargetStack of this stack to the hilite of me
   revSetEdit
end mouseUp
