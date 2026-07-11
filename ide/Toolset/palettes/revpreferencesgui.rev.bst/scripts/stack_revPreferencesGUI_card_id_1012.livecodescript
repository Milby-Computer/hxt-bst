Script "stack_revPreferencesGUI_card_id_1012"

/*
# Name: card "Property Profiles" of stack "revPreferencesGUI"
# ID: card id 1012 of stack "revPreferencesGUI"
# Hash: XmG/WLIL5bDmQk+BM7j33A==
*/


on preOpenCard
   set the hilite of button "Don't save changes" to the cREVProfileReadOnly of stack "revPreferences"
   set the hilite of button "create profiles automatically" to the cREVAutoCreateProfiles of stack "revPreferences"
   put the cREVTemplateMasterName of stack "revPreferences" into field "default profile name"
end preOpenCard
