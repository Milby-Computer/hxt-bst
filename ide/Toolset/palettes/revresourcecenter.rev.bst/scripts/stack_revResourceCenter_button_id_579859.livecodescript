Script "stack_revResourceCenter_button_id_579859"

/*
# Name: button "Window" of group "Menubar" of group "Example" of group id 584260 of group "mainContent" of card "Respondingtoachoiceinawindowmenu" of stack "revResourceCenter"
# ID: button id 579859 of group id 579858 of group id 577035 of group id 584260 of group id 100314 of card id 100301 of stack "revResourceCenter"
# Hash: OSt16SfnUMIzF9HN72XtCw==
*/


on menuPick -- goes in the menu button script
  -- This handler assumes the button has a custom property
  -- named "stackNamesList" that contains the names of
  -- the stacks listed in the menu
  put line (the menuHistory of me) \
     of the currentStacksList of me into chosenStackName
  go stack chosenStackName
  if the result is not empty then beep -- couldn't find stack
end menuPick 
