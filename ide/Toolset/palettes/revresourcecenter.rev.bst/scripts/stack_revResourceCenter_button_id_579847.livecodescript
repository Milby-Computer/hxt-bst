Script "stack_revResourceCenter_button_id_579847"

/*
# Name: button "Sample" of group "Example" of group id 584258 of group "mainContent" of card "Placingachecknexttoamenuitem" of stack "revResourceCenter"
# ID: button id 579847 of group id 577032 of group id 584258 of group id 100328 of card id 100316 of stack "revResourceCenter"
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
