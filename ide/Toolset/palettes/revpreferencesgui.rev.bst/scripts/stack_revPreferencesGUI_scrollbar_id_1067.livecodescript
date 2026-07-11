Script "stack_revPreferencesGUI_scrollbar_id_1067"

/*
# Name: scrollbar "grid" of card "Appearance" of stack "revPreferencesGUI"
# ID: scrollbar id 1067 of card id 1006 of stack "revPreferencesGUI"
# Hash: 3i/njgGTD26vS13JaNZbCw==
*/


on scrollBarDrag x
   if fld (the cTargetField of me) is not an integer then pass scrollBarDrag
   --  put the endValue of me - x into fld (the cTargetField of me)
   put x into fld (the cTargetField of me)
   set the gridSize to fld (the cTargetField of me)
   set the cGridSize of stack "revPreferences" to fld (the cTargetField of me)
end scrollBarDrag
