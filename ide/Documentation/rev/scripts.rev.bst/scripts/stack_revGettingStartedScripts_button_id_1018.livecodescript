Script "stack_revGettingStartedScripts_button_id_1018"

/*
# Name: button "Window" of group "Menubar" of group "Responding to a choice in a Window menu Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1018 of group id 1017 of group id 1015 of card id 1002 of stack "revGettingStartedScripts"
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
