Script "stack_revScriptColourEditor_button_id_1006"

/*
# Name: button "colourize" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: button id 1006 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: Tjz6cscZEcqyUiepMkGMdw==
*/



/**
* User clicked the "Colourize" button.
* Set the Rev preference for the colorization scheme to"custom".
* Do the colourization handler (card script of this stack)
*/
on mouseUp
   constant kPrefScheme = "cScriptEditor,colorization,scheme"
   constant kPrefConfig = "cScriptEditor,colorization,config"
   local tPrefConfigData
   
   put the dgText of group "colours" into tPrefConfigData
   replace TAB with SPACE in tPrefConfigData
   
   set the label of button "Colorization Scheme" of stack "revPreferencesGUI" to "Custom..."
   set the kPrefScheme of stack "revPreferences" to "Custom"
   set the kPrefConfig of stack "revPreferences" to tPrefConfigData
   
   colourize
end mouseUp
