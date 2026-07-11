Script "stack_revMenuManager_button_id_4855"

/*
# Name: button "Insert Divider" of bkgnd "Menu Items:" of stack "revMenuManager"
# ID: button id 4855 of bkgnd id 3226 of stack "revMenuManager"
# Hash: VjfB/+vym3wMd2U2Orj6ZQ==
*/


on mouseUp
  revNewMenuItem "divider"
end mouseUp

setProp cREVDisabled pDisabled
  if pDisabled then
    disable me
  else
    enable me
  end if
end cREVDisabled
