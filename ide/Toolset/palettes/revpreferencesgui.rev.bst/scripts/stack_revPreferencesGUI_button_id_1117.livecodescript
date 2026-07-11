Script "stack_revPreferencesGUI_button_id_1117"

/*
# Name: button "Font" of group "Script Editor" of card "Editor" of stack "revPreferencesGUI"
# ID: button id 1117 of group id 1114 of card id 1008 of stack "revPreferencesGUI"
# Hash: ssPG79rnOTAKWP9W9jlM+w==
*/


on menuPick pItemName
   set the cFont of me to labelToFont(the label of me)
   pass menuPick
end menuPick

private function labelToFont pLabel
   if pLabel is "Default" then
      return empty
   else
      return pLabel
   end if
end labelToFont

private function fontToLabel pFont
   if pFont is empty then
      return "Default"
   else
      return pFont
   end if
end fontToLabel

setProp cFont pFont
   lock messages
   set the cFont of me to pFont
   unlock messages
   
   set the label of me to "tempLabel"
   set the label of me to fontToLabel(pFont)
end cFont
