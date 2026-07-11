Script "stack_revSuppressMessages_card_id_1002"

/*
# Name: card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# ID: card id 1002 of stack "revSuppressMessages" of stack "revMessageWatcher"
# Hash: 4PHdQUhp5Jym2wA+dzcDwg==
*/


on preOpenCard
  repeat with i = 1 to the number of buttons
    set the hilite of button i to false
  end repeat
  set the hilite of button "IDE Messages" to the suppressIDE of stack "revPreferences"
  put the suppressedMessages of stack "revPreferences" into field "Suppressed Messages"
  get the the suppressedActions of stack "revPreferences"
  repeat for each line l in it
    set the hilite of button l to true
  end repeat
  get the the suppressedTypes of stack "revPreferences"
  repeat for each line l in it
    set the hilite of button l to true
  end repeat
end preOpenCard
