Script "stack_revStandaloneSettings_button_id_3795"

/*
# Name: button "Emscripten" of group "platforms" of group "emscriptenSettings" of card "Emscripten" of stack "revStandaloneSettings"
# ID: button id 3795 of group id 3810 of group id 3820 of card id 3757 of stack "revStandaloneSettings"
# Hash: bdPSZjBrrEYrPjzO7XRSog==
*/


on mouseUp
   set the cRevStandaloneSettings[the short name of me] of stack the cRevTargetStack of this stack to the hilite of me
   buildForEnabled "emscripten"
   revSetEdit
end mouseUp
