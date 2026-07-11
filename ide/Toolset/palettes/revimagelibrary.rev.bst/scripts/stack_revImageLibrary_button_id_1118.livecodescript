Script "stack_revImageLibrary_button_id_1118"

/*
# Name: button "Delete..." of card "Images" of stack "revImageLibrary"
# ID: button id 1118 of card id 1002 of stack "revImageLibrary"
# Hash: VaU+X93WbPQ2Ake0VwkhZA==
*/


on mouseUp
  put the label of btn "library chooser" into tStackName
  put the name of this stack into tLibStackName
  if tStackName is among the items of "Standard Images,MetaCard Compatible Icons,Cursors,-" or word 1 to 2 of tStackName is "This Stack"  then
    answer error "You can't delete set" && tStackName & "." with "Cancel" as sheet
    exit mouseUp
  end if
  answer warning "Are you sure you want to delete the image library" && quote & tStackName & quote & "?  This operation cannot be undone." with "Delete" or "Cancel" as sheet
  if it is "cancel" then exit mouseUp
  put "revLib" before tStackName
  hide stack tStackName
  toplevel tStackName
  put the effective fileName of stack tStackName into tFileName
  delete stack tStackName
  if there is a file tFileName then
    delete file tFileName
  end if
  send "preOpenCard" to this cd of stack tLibStackName
end mouseUp

on mouseEnter
  
end mouseEnter
