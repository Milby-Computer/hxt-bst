Script "stack_revPreferencesGUI_card_id_1009"

/*
# Name: card "Profiles" of stack "revPreferencesGUI"
# ID: card id 1009 of stack "revPreferencesGUI"
# Hash: m/Dmd1e/88FdPYWDiqKDSw==
*/


on preOpenCard
   set the hilite of button "Don't save changes" to the cREVProfileReadOnly of stack "revPreferences"
   set the hilite of button "create profiles automatically" to the cREVAutoCreateProfiles of stack "revPreferences"
   put the cREVTemplateMasterName of stack "revPreferences" into field "default profile name"
end preOpenCard


on OpenCard
   hxtSetTheHeightOfThisStackTo 152
end OpenCard


