Script "stack_revMenuDialog_field_id_1006"

/*
# Name: field "Menus" of card id 1002 of stack "revMenuDialog" of stack "revMenuManager"
# ID: field id 1006 of card id 1002 of stack "revMenuDialog" of stack "revMenuManager"
# Hash: OH49hmrLX8WoMJ2MwZxXUA==
*/


on mouseDoubleUp
  # OK-2007-09-25: Changed this for clarity
  # click at the loc of btn "OK"
  closeAccept
  pass mouseDoubleUp
end mouseDoubleUp

on mouseDown
  # OK-2007-09-25: Bug 5407, we only enable the button if a group has been selected
  # enable btn "OK"
  if the hilitedLine of me is not empty then
    enable button "OK"
  end if
  pass mouseDown
end mouseDown
