Script "stack_revScriptColourEditor_button_id_1253"

/*
# Name: button "bold" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: button id 1253 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: qLhbh9KhoqMMcopAIDBvPQ==
*/


on mouseUp
  local tLineA
  
  put the dgDataOfIndex[the dgHilitedIndex of group "colours"] of group "colours" into tLineA
  
  if (the hilite of me is FALSE) then
    if (tLineA["Attributes"] contains COMMA) then
      replace "bold," with EMPTY in tLineA["Attributes"]
    else
      put "none" into tLineA["Attributes"]
    end if
  else
    if (tLineA["Attributes"] = "none") then
      put "bold" into tLineA["Attributes"]
    else
      put "bold," before tLineA["Attributes"]
    end if
  end if
  
  set the dgDataOfIndex[the dgHilitedIndex of group "colours"] of group "colours" to tLineA
end mouseUp
