Script "stack_Color_Chooser_button_id_1187"

/*
# Name: button "Chooser Type" of card id 1001 of stack "Color Chooser"
# ID: button id 1187 of card id 1001 of stack "Color Chooser"
# Hash: 6CinK6NlWiUGZUNeU37qfA==
*/


on menuPick newgroup, oldgroup
  hide group oldgroup
  send "resetcontrols" to group newgroup
  show group newgroup
end menuPick
