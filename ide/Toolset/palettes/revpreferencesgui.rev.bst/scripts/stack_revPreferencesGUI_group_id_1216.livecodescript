Script "stack_revPreferencesGUI_group_id_1216"

/*
# Name: group "double-click" of card "Application Browser" of stack "revPreferencesGUI"
# ID: group id 1216 of card id 1013 of stack "revPreferencesGUI"
# Hash: 8kgdTY0uOj0a/5fot+JVEg==
*/


on mouseDown
  lock messages
  set the menuHistory of the target to lineOffset(the label of the target, the text of the target)
  unlock messages
end mouseDown
