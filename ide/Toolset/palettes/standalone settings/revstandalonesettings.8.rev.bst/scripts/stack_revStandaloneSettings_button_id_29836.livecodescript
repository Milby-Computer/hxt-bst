Script "stack_revStandaloneSettings_button_id_29836"

/*
# Name: button "iOSTabMenu" of card "iOS" of stack "revStandaloneSettings"
# ID: button id 29836 of card id 1641 of stack "revStandaloneSettings"
# Hash: xUW1d5IF3vWnYZZQhTd9UQ==
*/


on showGroup pGroupName
   if pGroupName is "Requirements" then
      put "Requirement" into pGroupName
   end if
   local tCurrentName
   repeat for each line tItemName in text of me
      if tItemName is "Requirements" then
         put "Requirement" into tCurrentName
      else 
         put tItemName into tCurrentName
      end if 
      if tCurrentName is not pGroupName then
         set the disabled of group tCurrentName to true
         hide group tCurrentName
      else
         set the disabled of group tCurrentName to false
         show group tCurrentName
      end if
   end repeat
end showGroup

on menuPick pItemName
   lock screen
   storeSetting "active menu", pItemName
   showGroup pItemName
   unlock screen
end menuPick
