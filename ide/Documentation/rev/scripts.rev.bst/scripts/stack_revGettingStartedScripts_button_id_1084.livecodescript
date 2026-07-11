Script "stack_revGettingStartedScripts_button_id_1084"

/*
# Name: button "Sample" of group "Placing a check next to a menu item Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1084 of group id 1083 of card id 1002 of stack "revGettingStartedScripts"
# Hash: /EXYfG0UXAv/cbqTimO2KA==
*/


on menuPick theItem
  put the menuHistory of me into myItemNumber
  if char 1 to 2 of line myItemNumber of me is "!c"
  then delete char 1 to 2 of line myItemNumber of me
  else put "!c" before line myItemNumber of me
  -- This handler just handles the checkmarks. If you
  -- want to do other things in response to a menu choice,
  -- you'll do them here, after the checkmark code. Here's
  -- a simple example:
  answer "You chose" && quote & theItem & quote & "."
end menuPick
