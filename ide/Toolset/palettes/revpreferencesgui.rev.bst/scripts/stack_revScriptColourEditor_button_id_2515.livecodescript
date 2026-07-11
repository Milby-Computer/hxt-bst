Script "stack_revScriptColourEditor_button_id_2515"

/*
# Name: button "scheme" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: button id 2515 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: KHMjFHERKpuhdFhSuKgXiA==
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
      
      put the filename of stack "revScriptColourEditorByShaoSean" into tFilePath
      set the itemDelimiter to SLASH
      put "schemes/" & pItemName & ".scheme" into item -1 of tFilePath
      
      set the dgtext of group "colours" to (URL "file://" & tFilePath)
      break
  end switch
end menuPick
