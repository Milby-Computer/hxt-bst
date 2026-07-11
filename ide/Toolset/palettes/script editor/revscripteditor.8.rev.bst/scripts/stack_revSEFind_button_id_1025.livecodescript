Script "stack_revSEFind_button_id_1025"

/*
# Name: button "Toggle Options" of card "Main" of stack "revSEFind" of stack "revNewScriptEditor"
# ID: button id 1025 of card id 1002 of stack "revSEFind" of stack "revNewScriptEditor"
# Hash: hYR9vduO0SjtrfUymQoJlQ==
*/


constant kUpIcon = "205223"
constant kDownIcon = "205222"

on mouseUp
   if the label of me is "+" then
      optionsShow
      set the label of me to "-"
      set the icon of me to kUpIcon
   else
      optionsHide
      set the label of me to "+"
      set the icon of me to kDownIcon
   end if
end mouseUp

command resetIcon
   set the label of me to "+"
   set the icon of me to kDownIcon
end resetIcon
