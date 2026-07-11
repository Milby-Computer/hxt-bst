Script "stack_Popovers_button_id_1003"

/*
# Name: button "Info" of card id 1002 of stack "Popovers"
# ID: button id 1003 of card id 1002 of stack "Popovers"
# Hash: JEPL6L8WZyGSjTjKmowxpg==
*/


on MouseUp
   popover stack "MyPopover" anchored to button "Info" edge "right"
   --   popover stack "MyPopover" anchored to button "Info"   -- edge defaults to bottom
   --   popover stack "MyPopover"                              -- centres on current stack
   wait 2 seconds with messages
   set the text of field "Name" of stack "MyPopover" to "world"
end MouseUp
