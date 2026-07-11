Script "stack_revSEEditBreakpoint_button_id_1033"

/*
# Name: button "Handler" of group "Watch" of card id 1002 of stack "revSEEditBreakpoint" of stack "revNewScriptEditor"
# ID: button id 1033 of group id 1026 of card id 1002 of stack "revSEEditBreakpoint" of stack "revNewScriptEditor"
# Hash: i4fTWjbBC9IrKyxwOsoAGw==
*/


on menuPick pItemName
   set the cHandler of this stack to pItemName
   updateWatch
end menuPick
