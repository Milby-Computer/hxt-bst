Script "stack_revPreferencesGUI_button_id_1160"

/*
# Name: button "Background Color" of group "Script Editor" of card "Script Editor" of stack "revPreferencesGUI"
# ID: button id 1160 of group id 1142 of card id 1010 of stack "revPreferencesGUI"
# Hash: IK8r1iSoJ0l2ULfDfqE5lA==
*/


on menuPick pItemName
   set the cColor of me to nameToColor(pItemName)
   updateSwatches
   pass menuPick
end menuPick

setProp cColor pColor
   lock messages
   set the cColor of me to pColor
   unlock messages
   
   set the label of me to "tempLabel"
   set the label of me to  colorToName(pColor)
end cColor

private function nameToColor pColorName
   switch pColorName
      case "White"
         return "255,255,255"
      break
      case "Custard Yellow"
         return "255,247,215"
      break
      case "Other.."
         # OK-2008-08-01 : Bug 6669
         answer color with the cColor of me
         if it is empty then
            return the cColor of me
         else
            return it
         end if
      break
      default
         return "255,255,255"
   end switch
end nameToColor

private function colorToName pColor
   switch pColor
      case "255,247,215"
         return "Custard Yellow"
      break
      case "255,255,255"
         return "White"
      case empty
         return "White"
      break
      default
         return "Other.."
      break
   end switch
end colorToName
