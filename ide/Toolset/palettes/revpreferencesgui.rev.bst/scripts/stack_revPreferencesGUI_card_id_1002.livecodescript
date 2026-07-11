Script "stack_revPreferencesGUI_card_id_1002"

/*
# Name: card "General" of stack "revPreferencesGUI"
# ID: card id 1002 of stack "revPreferencesGUI"
# Hash: 0cFAMf8S0kkYEPqbU9YaAQ==
*/


on preOpenCard   
   set the hilite of button "Descriptions on properties" of me to the cLanguageNames of card 1 of stack "revPreferences" is false
   set the hilite of button "Language names on properties" of me to not the hilite of button "Descriptions on properties" of me
   set the hilite of button "navigation arrows" of me to the cNavigationArrows of stack "revPreferences"
   set the hilite of button "opt edit script shortcut" of me to the cREVScriptShortcut of stack "revPreferences"
   set the hilite of button "context menus work on Rev dev stacks" of me to the cRevPopups of stack "revPreferences"
   set the hilite of button "show revolution stacks" of me to the cShowRevolutionStacks of stack "revPreferences"
   put the cEditorpath of stack "revpreferences" into field "external editor" of me
   put the httpProxy into field "http proxy" of card "general"
   
   get the cCrashReportStyle of stack "revPreferences"
   if it is empty then
      get "Small"
   end if
   set the label of button "Crash Report Style" of me to it
end preOpenCard


on OpenCard
   send "hxtSetTheHeightOfThisStackTo 362" to this stack in 1 milliseconds
end OpenCard
