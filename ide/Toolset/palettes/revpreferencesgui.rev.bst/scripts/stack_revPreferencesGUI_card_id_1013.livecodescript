Script "stack_revPreferencesGUI_card_id_1013"

/*
# Name: card "Application Browser" of stack "revPreferencesGUI"
# ID: card id 1013 of stack "revPreferencesGUI"
# Hash: t2w1t4Um8Bj9/W4wVTRBbw==
*/


on preOpenCard
  revRefreshABprefs
end preOpenCard

on revRefreshABprefs 
  set the hilitedLine of fld "object type" to 1
  send "selectionChanged" to fld "object type"
  set the hilite of btn "Show audio clips" to the cShowAudioclips of stack "revPreferences"
  set the hilite of btn "Show video clips" to the cShowVideoclips of stack "revPreferences"
end revRefreshABprefs

function revSelObjectType
   local tType
   put line (the hilitedLine of fld "object type") of fld "object type" into tType
   replace space with empty in tType
   return tType
end revSelObjectType
