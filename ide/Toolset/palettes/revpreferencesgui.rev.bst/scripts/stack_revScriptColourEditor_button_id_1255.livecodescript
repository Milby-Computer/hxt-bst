Script "stack_revScriptColourEditor_button_id_1255"

/*
# Name: button "colourWell" of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# ID: button id 1255 of card id 1002 of stack "revScriptColourEditor" of stack "revPreferencesGUI"
# Hash: PnaGiHgZGBPBfTBGggCiOA==
*/


on mouseUp
  local tLineA
  
  put the dgDataOfIndex[the dgHilitedIndex of group "colours"] of group "colours" into tLineA
  
  answer color with tLineA["Colour"]
  if (the result = "Cancel") then
    exit mouseUp
  end if
  
  put it into tLineA["Colour"]
  set the backgroundColor of me to it
  set the dgDataOfIndex[the dgHilitedIndex of group "colours"] of group "colours" to tLineA
end mouseUp
