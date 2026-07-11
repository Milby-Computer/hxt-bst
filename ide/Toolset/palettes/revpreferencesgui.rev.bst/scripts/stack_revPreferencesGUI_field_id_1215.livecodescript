Script "stack_revPreferencesGUI_field_id_1215"

/*
# Name: field "object type" of card "Application Browser" of stack "revPreferencesGUI"
# ID: field id 1215 of card id 1013 of stack "revPreferencesGUI"
# Hash: 9xGqWC8c4jrI/hdJAZSaLA==
*/


on selectionChanged
  put revSelObjectType() into tType
  switch tType
  case "Stacks"
    put "Toplevel" into tMenuItem
    break
  case "Cards"
    put "Go" into tMenuItem
    break
  case "Controls"
    put empty into tMenuItem
    break
  default
    put "play" into tMenuItem
    break
  end switch
  repeat with i = 1 to the num of btns in grp "double-click"
    put tMenuItem into line 3 of btn i of grp "double-click"
  end repeat
  set the label of btn "double-click" to the cABDoubleClick[tType] of stack "revPreferences"
  set the label of btn "command double-click" to the cABCommandDoubleClick[tType] of stack "revPreferences"
  set the label of btn "option double-click" to the cABOptionDoubleClick[tType] of stack "revPreferences"
end selectionChanged
