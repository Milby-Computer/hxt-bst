Script "stack_revMenuManager_button_id_5319"

/*
# Name: button "MacOS Preview" of card "Menu Manager" of stack "revMenuManager"
# ID: button id 5319 of card id 1002 of stack "revMenuManager"
# Hash: RiZ+byoyV5Zo8tW0kklYlg==
*/


on mouseUp
  if not the hilite of me then
    set the defaultMenuBar to the long id of group "revMenuBar" of stack revIDEPaletteToStackName("menubar")
  else
    set the defaultMenuBar to the short name of bg id (the cREVMenuID of this stack) \
        of stack (the cREVDefaultStack of this stack)
  end if
end mouseUp
