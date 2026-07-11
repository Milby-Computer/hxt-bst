Script "stack_revNewMenu_button_id_1009"

/*
# Name: button "OK" of card id 1002 of stack "revNewMenu" of stack "revMenuManager"
# ID: button id 1009 of card id 1002 of stack "revNewMenu" of stack "revMenuManager"
# Hash: vUzNi73/YHfMmce+/WMNZw==
*/


# OK-2007-09-19 : Bug 5410, refactored to make fixing the bug easier
on mouseUp
  closeAccept
  if the result is not empty then
    pass mouseUp
  end if
end mouseUp

