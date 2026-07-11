Script "stack_revPreferencesGUI_card_id_1008"

/*
# Name: card "Editor" of stack "revPreferencesGUI"
# ID: card id 1008 of stack "revPreferencesGUI"
# Hash: 4j7/43pF/1HxNDHBnRaV5w==
*/


on preOpenCard
   set the hilite of button "hide errors" to the cSEHideErrors of stack "revPreferences"
   set the hilite of button "hide palettes" to the cSEHidePalettes of stack "revPreferences"
   set the hilite of button "hide message box" to the cSEHideMessageBox of stack "revPreferences"
   send "update" to group "Script Editor"
   send "hxtSetTheHeightOfThisStackTo 446" to this stack in 1 milliseconds
   UpdateColorization
end preOpenCard



private command UpdateColorization
   local tSchemeName
   put revIDEGetPreference("cScriptEditor,colorization,scheme") into tSchemeName
   
   set the text of button "Colorization Scheme" to "Default" & LF & "Revolution Classic" & LF & "One Dark Pro" & LF & "No Colorization"
   -- if the schemes folder exists, then load the scheme files
   if (there is a folder revEnvironmentUserColorSchemesPath()) then
      local tFiles
      put files(revEnvironmentUserColorSchemesPath(), "detailed-utf8") into tFiles
      
      local tSchemeNames
      repeat for each line tFileInfo in tFiles
         if (tFileInfo begins with ".") then next repeat
         put LINEFEED & textDecode(URLDecode(item 1 of tFileInfo), "utf8") after tSchemeNames
      end repeat
      sort tSchemeNames
      replace ".scheme" with EMPTY in tSchemeNames
      set the text of button "Colorization Scheme" to (the text of button "Colorization Scheme" & LF & "(-" & tSchemeNames)
   end if
   set the text of button "Colorization Scheme" to (the text of button "Colorization Scheme" & LF & "(-" & LF & "Custom...")  
   
   set the menuHistory of button "Colorization Scheme" to (lineOffset(tSchemeName, the text of button "Colorization Scheme"))
end UpdateColorization
