Script "stack_revImageLibrary_button_id_1156"

/*
# Name: button "Delete1" of group "Buttons" of card "Objects" of stack "revImageLibrary"
# ID: button id 1156 of group id 1167 of card id 1150 of stack "revImageLibrary"
# Hash: 9hqLDdulEzP8CqnBqpAnsw==
*/


on mouseUp
  put line (the hilitedLines of fld "objects list") of fld "objects list" into tCardName
  put the cStackName of fld "objects list" into tStackName
  answer "Really delete" && tCardName & "?" with "Cancel" or "Delete" as sheet
  if it is "Cancel" then exit mouseUp
  delete cd tCardname of stack tStackName
  save stack tStackName
  send "menuPick" && the label of btn "library chooser" to btn "Library chooser"
end mouseUp
