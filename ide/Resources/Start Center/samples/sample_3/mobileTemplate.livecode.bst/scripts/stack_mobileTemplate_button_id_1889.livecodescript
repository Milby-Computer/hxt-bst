Script "stack_mobileTemplate_button_id_1889"

/*
# Name: button "theme" of card "template" of stack "mobileTemplate"
# ID: button id 1889 of card id 1868 of stack "mobileTemplate"
# Hash: FlzAHTJN5DJNU15oSvFMUA==
*/


on menuPick pItemName
   local tColor
   
   switch tolower(pItemName)
      case "custom"
         put field "color" into tColor
         if the number of items of tColor is 3 then
            set the theme of this stack to tColor
         end if
         break
         
      default
         set the theme of this stack to pItemName
   end switch
end menuPick
