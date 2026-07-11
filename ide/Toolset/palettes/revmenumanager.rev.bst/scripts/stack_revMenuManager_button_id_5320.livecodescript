Script "stack_revMenuManager_button_id_5320"

/*
# Name: button "MacOS Menu Bar" of card "Menu Manager" of stack "revMenuManager"
# ID: button id 5320 of card id 1002 of stack "revMenuManager"
# Hash: BA6oX0lv2S1W1XDvOCrF1w==
*/


on mouseUp
  revCheckNameChanged
  if the hilite of me then
    --set menubar    
    set the menubar of stack (the cREVDefaultStack of this stack) to the short name \
        of bg id (the cREVMenuID of this stack) of stack (the cREVDefaultStack of this stack)
  else
    set the menubar of stack (the cREVDefaultStack of this stack) to empty
  end if
  pass mouseUp
end mouseUp
