Script "stack_Print_Dialog_button_id_1060"

/*
# Name: button "Duplex" of group "Additional Options" of card id 1002 of stack "Print Dialog"
# ID: button id 1060 of group id 6589 of card id 1002 of stack "Print Dialog"
# Hash: m3DykLwt5N5IJC/Amylfgw==
*/


on mouseUp
  if the hilite of me is true then
    enable group "Duplex settings"
  else
    disable group "Duplex settings"
  end if
  updateDuplexImage
  pass mouseup
end mouseUp
