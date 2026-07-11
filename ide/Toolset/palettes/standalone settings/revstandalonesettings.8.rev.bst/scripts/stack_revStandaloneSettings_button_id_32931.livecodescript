Script "stack_revStandaloneSettings_button_id_32931"

/*
# Name: button "entitlements" of group "OSX" of card "OS X" of stack "revStandaloneSettings"
# ID: button id 32931 of group id 1221 of card id 1015 of stack "revStandaloneSettings"
# Hash: llhfFElLB0j99n3+XuhH0g==
*/


-- Sent when the mouse is released after clicking
-- pMouseButton specifies which mouse button was pressed
on mouseUp pMouseButton
   set the cTargetStack of stack "revEntitlements" to getTargetStackName()
   set the cEnclosingFolder of stack "revEntitlements" to utilityTargetStackPath()
   --   toplevel stack "revEntitlements"
   popover stack "revEntitlements" anchored to button "entitlements" edge "top"
end mouseUp
