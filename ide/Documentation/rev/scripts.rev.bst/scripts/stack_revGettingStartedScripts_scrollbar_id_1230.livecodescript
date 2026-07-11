Script "stack_revGettingStartedScripts_scrollbar_id_1230"

/*
# Name: scrollbar "Red" of group "Setting an RGB color channel of an object Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: scrollbar id 1230 of group id 1223 of card id 1002 of stack "revGettingStartedScripts"
# Hash: Q/VbgnxsEHSXq7tdUsFtFw==
*/


on scrollbarDrag newPosition
  set the redChannel of graphic "Color Swatch" to newPosition
end scrollbarDrag
