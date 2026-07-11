Script "stack_revPreferencesGUI_scrollbar_id_1077"

/*
# Name: scrollbar "grid" of group "Appearance" of card "Appearance" of stack "revPreferencesGUI"
# ID: scrollbar id 1077 of group id 1062 of card id 1008 of stack "revPreferencesGUI"
# Hash: /FJaDcT5faCjvA8gX2qM6w==
*/


on scrollBarDrag x
  if fld (the cTargetField of me) is not an integer then pass scrollBarDrag
  put the endValue of me - x into fld (the cTargetField of me)
  set the gridSize to fld (the cTargetField of me)
  set the cGridSize of stack "revPreferences" to fld (the cTargetField of me)
end scrollBarDrag
