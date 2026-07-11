Script "stack_revResourceCenter_button_id_579861"

/*
# Name: button "Colors" of group "Example" of group id 579865 of group "mainContent" of card "Poppingupamenuafteradelaytimer" of stack "revResourceCenter"
# ID: button id 579861 of group id 577036 of group id 579865 of group id 80378 of card id 80366 of stack "revResourceCenter"
# Hash: npcN53GHPPDMMUDNnZEz8A==
*/


on menuPick theColor
  set the label of button "Color" to "Change color to" && toLower(theColor)
end menuPick
