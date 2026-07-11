Script "stack_revScriptColourEditor_button_id_1254"

/*
# Name: button "italic" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: button id 1254 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: rx7gPZuy2ZmAvYAw1ryD2A==
*/


on mouseUp
  local tLineA
  
  put the dgDataOfIndex[the dgHilitedIndex of group "colours"] of group "colours" into tLineA
  
  if (the hilite of me is FALSE) then
    if (tLineA["Attributes"] contains COMMA) then
      replace ",italic" with EMPTY in tLineA["Attributes"]
    else
      put "none" into tLineA["Attributes"]
    end if
  else
    if (tLineA["Attributes"] = "none") then
      put "italic" into tLineA["Attributes"]
    else
      put ",italic" after tLineA["Attributes"]
    end if
  end if
  
  set the dgDataOfIndex[the dgHilitedIndex of group "colours"] of group "colours" to tLineA
end mouseUp
