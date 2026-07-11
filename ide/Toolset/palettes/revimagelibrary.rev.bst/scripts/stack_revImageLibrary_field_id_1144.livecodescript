Script "stack_revImageLibrary_field_id_1144"

/*
# Name: field "description" of card "Objects" of stack "revImageLibrary"
# ID: field id 1144 of card id 1150 of stack "revImageLibrary"
# Hash: BQfa4if/WZmt5NqEnheRRA==
*/


on closeField
  put line (the hilitedLines of fld "objects list") of fld "objects list" into tCardName
  put the cStackName of fld "objects list" into tStackName
  set the cDescription of cd tCardName of stack tStackName to me
  save stack tStackName
end closeField
