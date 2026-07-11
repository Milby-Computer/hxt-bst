Script "stack_revSuppressMessages_button_id_1012"

/*
# Name: button "OK" of card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# ID: button id 1012 of card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# Hash: 00zr4oD/Wq013ww3t1yc3Q==
*/


on mouseUp
  set the suppressIDE of stack "revPreferences" to the hilite of button "IDE Messages"
  set the suppressedMessages of stack "revPreferences" to field "Suppressed Messages"
  get empty
  repeat with i = 1 to the number of buttons in group "Action"
    if the hilite of button i of group "Action"
    then put the short name of button i of group "Action" & cr after it
  end repeat
  delete last char of it
  set the suppressedActions of stack "revPreferences" to it
  get empty
  repeat with i = 1 to the number of buttons in group "Handler Type"
    if the hilite of button i of group "Handler Type"
    then put the short name of button i of group "Handler Type" & cr after it
  end repeat
  delete last char of it
  set the suppressedTypes of stack "revPreferences" to it
  close this stack
end mouseUp
