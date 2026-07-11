Script "stack_revPreferencesGUI_card_id_1009"

/*
# Name: card "Profiles" of stack "revPreferencesGUI"
# ID: card id 1009 of stack "revPreferencesGUI"
# Hash: FkzGITVwBcxC+UKNf5zi5A==
*/


on preOpenCard
   set the hilite of button "Don't save changes" to the cREVProfileReadOnly of stack "revPreferences"
   set the hilite of button "create profiles automatically" to the cREVAutoCreateProfiles of stack "revPreferences"
   put the cREVTemplateMasterName of stack "revPreferences" into field "default profile name"
end preOpenCard


on OpenCard
   send "hxtSetTheHeightOfThisStackTo 152" to this stack in 0 milliseconds
   --   hxtSetTheHeightOfThisStackTo 152
end OpenCard


