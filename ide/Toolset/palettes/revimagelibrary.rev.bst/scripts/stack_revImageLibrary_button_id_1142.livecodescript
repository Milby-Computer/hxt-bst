Script "stack_revImageLibrary_button_id_1142"

/*
# Name: button "Delete" of card "Objects" of stack "revImageLibrary"
# ID: button id 1142 of card id 1150 of stack "revImageLibrary"
# Hash: ZVbXNIc2SwxE0TaC44bGew==
*/


on mouseUp
  put the cStackName of fld "objects list" into tStackName
  put the name of this stack into tLibStackName
  if tStackName is "revDefaultLibrary" then
    answer error "The standard library cannot be deleted." with "OK" as sheet
    exit mouseUp
  end if
  answer warning "Really delete library" && tStackName & "?  This cannot be undone."  with "Cancel" or "Delete" as sheet
  if it is "cancel" then exit mouseUp
  put the fileName of stack tStackName into tFilePath
  delete stack tStackName
  delete file tFilePath
  set the defaultStack to tLibStackName
  preOpenCard
end mouseUp
