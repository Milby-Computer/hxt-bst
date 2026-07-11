Script "stack_Color_Chooser_button_id_1202"

/*
# Name: button "ink" of card id 1001 of stack "Color Chooser"
# ID: button id 1202 of card id 1001 of stack "Color Chooser"
# Hash: 7+10JDb3VzkP0pI7enuRdA==
*/


on menuPick which
  if the selectedObject is empty then exit menuPick
  set the ink of the selectedObject to which
end menuPick
