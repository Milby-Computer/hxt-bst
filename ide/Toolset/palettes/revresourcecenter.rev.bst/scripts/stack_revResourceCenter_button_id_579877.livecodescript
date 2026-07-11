Script "stack_revResourceCenter_button_id_579877"

/*
# Name: button "Print Card" of group "Example" of group id 579880 of group "mainContent" of card "FittingaPrintouttothePage" of stack "revResourceCenter"
# ID: button id 579877 of group id 577042 of group id 579880 of group id 77984 of card id 77973 of stack "revResourceCenter"
# Hash: /GMTfF8yVSpegY5OsUbFHg==
*/


on mouseUp
  put round(field "Margin" * 72) into myMargin
  if myMargin is zero then put 72 into myMargin
  set the defaultStack to the topStack
  printThisCard empty,myMargin
end mouseUp

on printThisCard thePaperSize,theMargin
  if thePaperSize is empty then put 612,792 into thePaperSize
  if theMargin is empty then put 72 into theMargin
  -- get the page area
  set the printMargins to \
     theMargin,theMargin,theMargin,theMargin
  put theMargin,theMargin, \
    item 1 of thePaperSize - theMargin, \
    item 2 of thePaperSize - theMargin \
    into destinationRect
  -- print into that rectangle
  print this card into destinationRect
end printThisCard
