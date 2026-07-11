Script "stack_revImageLibrary_button_id_1162"

/*
# Name: button "Import File..." of group "Buttons" of card "Images" of stack "revImageLibrary"
# ID: button id 1162 of group id 1165 of card id 1002 of stack "revImageLibrary"
# Hash: IIs5ZqQNmnyRreSeRLMNAg==
*/


on mouseUp
  local tStackName
  put revLibraryStackName(the label of btn "library chooser") into tStackName
  if word 1 to 2 of the label of btn "library chooser" <> "This Stack" then
    set the defaultStack to tStackName
    go inv stack tStackName
    revImportImageFile
    compact stack tStackName
    save stack tStackName
    close stack tStackName
  else
    # OK-2007-11-29 : Bug 5562, don't change the defaultStack until its required
    revImportImageFile the long id of the topStack
  end if
  send "menuPick" && quote & the label of btn "library chooser" of stack "revImageLibrary" & quote to btn "library chooser" of stack "revImageLibrary"
end mouseUp
