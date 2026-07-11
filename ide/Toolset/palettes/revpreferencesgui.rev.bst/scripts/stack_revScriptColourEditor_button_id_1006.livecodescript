Script "stack_revScriptColourEditor_button_id_1006"

/*
# Name: button "colourize" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: button id 1006 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: ZvlRlTsRRTA0MPeM2AB4ew==
*/



/**
* User clicked the "Colourize" button.
* Set the Rev preference for the colorization scheme to"custom".
* Do the colourization handler (card script of this stack)
*/
on mouseUp
   local tPrefConfigData
   put the dgText of group "colours" into tPrefConfigData
   
   SaveOutScheme the label of button "schemes", tPrefConfigData
   
   replace TAB with SPACE in tPrefConfigData
   
   revIDESetPreference "cScriptEditor,colorization,scheme", the label of button "schemes"
   revIDESetPreference "cScriptEditor,colorization,config", tPrefConfigData
   
   --   set the "cScriptEditor,colorization,scheme" of stack "revPreferences" to (the label of button "schemes")
   --   set the "cScriptEditor,colorization,config" of stack "revPreferences" to tPrefConfigData
   
   colourize
end mouseUp
