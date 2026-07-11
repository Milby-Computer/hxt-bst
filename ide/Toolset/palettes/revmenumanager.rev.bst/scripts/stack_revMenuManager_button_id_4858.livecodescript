Script "stack_revMenuManager_button_id_4858"

/*
# Name: button "Edit..." of bkgnd "Menubar" of stack "revMenuManager"
# ID: button id 4858 of bkgnd id 3260 of stack "revMenuManager"
# Hash: kPMhryj98dgQ5Z/KEQe39g==
*/


on mouseUp
  if the cAnswerDialog of field "Menu Name" or the cAnswerDialog of field "Item Name" then
    exit mouseUp
  end if
  
  revCheckNameChanged
  modal "revMenuDialog"
  if the cREVResult of stack "revMenuDialog" is not "OK" then
    pass mouseUp
  end if
  
  revEditMenubar
end mouseUp
