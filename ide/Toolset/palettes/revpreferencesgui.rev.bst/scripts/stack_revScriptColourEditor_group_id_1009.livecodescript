Script "stack_revScriptColourEditor_group_id_1009"

/*
# Name: group "colours" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: group id 1009 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: UpDflSsAt7iiylDTt1siOw==
*/


on mouseUp
  local tLineA
  
  lock screen
  
  set the hilite of btn "bold" to FALSE
  set the hilite of btn "italic" to FALSE
  
  put the dgDataOfLine[the dgHilitedLine of me] of me into tLineA
  
  repeat for each item tItemName in tLineA["Attributes"]
    if (tItemName = "none") then exit repeat
    set the hilite of button tItemName to TRUE
  end repeat
  
  set the backgroundColor of button "colourWell" to tLineA["Colour"]
end mouseUp
