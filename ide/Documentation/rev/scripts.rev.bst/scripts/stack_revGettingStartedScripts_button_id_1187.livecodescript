Script "stack_revGettingStartedScripts_button_id_1187"

/*
# Name: button "Colors" of bkgnd "Popping up a menu after a delay timer Example" of stack "revGettingStartedScripts"
# ID: button id 1187 of bkgnd id 1186 of stack "revGettingStartedScripts"
# Hash: npcN53GHPPDMMUDNnZEz8A==
*/


on menuPick theColor
  set the label of button "Color" to "Change color to" && toLower(theColor)
end menuPick
