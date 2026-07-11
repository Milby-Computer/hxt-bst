Script "stack_revPreferencesGUI_button_id_1119"

/*
# Name: button "Font Size" of group "Script Editor" of card "Editor" of stack "revPreferencesGUI"
# ID: button id 1119 of group id 1114 of card id 1008 of stack "revPreferencesGUI"
# Hash: M2Kvb7jw5SYio6BFEXPvaw==
*/


on menuPick pItemName
   set the cSize of me to labelToSize(the label of me)
   pass menuPick
end menuPick

private function labelToSize pLabel
   if pLabel is "Default" then
      return empty
   else
      return pLabel
   end if
end labelToSize

private function sizeToLabel pFont
   if pFont is empty then
      return "Default"
   else
      return pFont
   end if
end sizeToLabel

setProp cSize pSize
   lock messages
   set the cSize of me to pSize
   unlock messages
   
   set the label of me to "tempLabel"
   set the label of me to sizeToLabel(pSize)
end cSize
