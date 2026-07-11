Script "stack_revGettingStartedScripts_bkgnd_id_1265"

/*
# Name: bkgnd "Inserting line breaks to hard wrap text Example" of stack "revGettingStartedScripts"
# ID: bkgnd id 1265 of stack "revGettingStartedScripts"
# Hash: W7pDss21YxKRhZsCKs3/yA==
*/


on preOpenBackground
  put the originalText of field "Example Text" into field "Example Text"
  put "30" into field "Line Length"
end preOpenBackground
