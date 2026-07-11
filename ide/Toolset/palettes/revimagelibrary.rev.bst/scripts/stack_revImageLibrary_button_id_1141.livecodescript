Script "stack_revImageLibrary_button_id_1141"

/*
# Name: button "New" of card "Objects" of stack "revImageLibrary"
# ID: button id 1141 of card id 1150 of stack "revImageLibrary"
# Hash: joBweKmK9ZeXuG/3+eskkg==
*/


on mouseUp
  ask "Enter a name for the new library:" as sheet
  if it is empty then exit mouseUp
  put the name of this stack into tLibStackName
  put "rev" & it into tNewName
  put revEnvironmentUserResourcesPath("Object Libraries",true) into tDirectoryPath
  put revAbsoluteFolderListing(revEnvironmentUserResourcesPath("Object Libraries",true)) into tStacksList
  set the name of the templateStack to tNewName
  set the destroyStack of the templateStack to false
  set the visible of the templateStack to false
  create stack
  reset the templateStack
  set the mainStack of stack tNewName to tNewName
  save stack tNewName as (tDirectoryPath & "/" & tNewName & ".rev")
  lock screen
  preOpencard
  send "menuPick" && quote & tNewName & quote to btn "library chooser" of tLibStackName
  set the label of btn "library chooser" of tLibStackName to char 4 to -1 of tNewName
  unlock screen
end mouseUp
