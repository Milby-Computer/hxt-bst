Script "stack_revMenuManager_button_id_5610"

/*
# Name: button "Edit Menu Bar Script" of bkgnd "Menubar" of stack "revMenuManager"
# ID: button id 5610 of bkgnd id 3260 of stack "revMenuManager"
# Hash: TQ8PA81WXDcZGg0oy/gTtA==
*/


on mouseUp
  if the cAnswerDialog of fld "Menu Name" or the cAnswerDialog of fld "Item Name" then exit mouseUp
  revCheckNameChanged
  edit script of bg id (the cREVMenuID of this stack) \
      of stack (the cREVDefaultStack of this stack)
  pass mouseUp
end mouseUp
