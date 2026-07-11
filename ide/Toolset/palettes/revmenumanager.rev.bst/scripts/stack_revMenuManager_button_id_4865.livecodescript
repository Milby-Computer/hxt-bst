Script "stack_revMenuManager_button_id_4865"

/*
# Name: button "Shortcut" of bkgnd "Menu Item Controls" of stack "revMenuManager"
# ID: button id 4865 of bkgnd id 3265 of stack "revMenuManager"
# Hash: MY2Dt6Bpl0uPOeG43u9tLg==
*/



setProp cREVDisabled pDisabled
   if pDisabled then
      disable me
      --if the platform is "MacOS" then
      --set the icon of me to 202565
      --else
      --set the icon of me to 202566
      --end if
   else
      enable me
      --if the platform is "MacOS" then
      --set the icon of me to 202544
      --else
      --set the icon of me to 202546
   --end if
end if
end cREVDisabled
