Script "stack_revGettingStartedScripts_bkgnd_id_1186"

/*
# Name: bkgnd "Popping up a menu after a delay timer Example" of stack "revGettingStartedScripts"
# ID: bkgnd id 1186 of stack "revGettingStartedScripts"
# Hash: +gZfixAjQdVTFL+j28LE1A==
*/


on preOpenBackground
  set the textColor of char 1 to -1 of field "Example Text" to empty
  set the label of button "Color" to "Change color to green"
end preOpenBackground
