Script "stack_revScriptColourEditor_button_id_3023"

/*
# Name: button "schemes" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: button id 3023 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: /z0jtQ7IaM8TMW2/VXSDug==
*/


on menuPick pItemName
   switch pItemName
      case "default"
         set the dgText of group "colours" to (the schemeDefault of this card)
         break
      case "Revolution Classic"
         set the dgText of group "colours" to (the schemeClassic of this card)
         break
      case "No Colorization"
         set the dgText of group "colours" to (the schemeNone of this card)
         break
         
      default        
         local tFilePath
         put revEnvironmentUserColorSchemesPath() & SLASH & pItemName & ".scheme" into tFilePath
         
         local tColourSchemeData
         put URL ("file://" & tFilePath) into tColourSchemeData
         set the dgtext of group "colours" to tColourSchemeData
         break
   end switch
end menuPick


on EnterInField
   ReturnInField
end EnterInField

on ReturnInField
   -- get the current colour scheme
   local tColourScheme
   put the dgText of group "colours" into tColourScheme
   
   local tLabel
   put the label of me into tLabel
   
   -- save out the colour scheme
   SaveOutScheme the label of me, tColourScheme
   
   set the text of me to (the text of me & LINEFEED & tLabel)
   set the menuHistory of me to (lineOffset(tLabel, the text of me))
end ReturnInField
