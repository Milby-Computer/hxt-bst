Script "stack_revDocsColor_Names_Reference_bkgnd_id_2807"

/*
# Name: bkgnd "revLibraries" of stack "revDocsColor Names Reference"
# ID: bkgnd id 2807 of stack "revDocsColor Names Reference"
# Hash: +8lSEvwyafk1K3v+QAsvIg==
*/


on preOpenBackGround
  repeat with i = 1 to the number of btns in me
    insert script of btn i of me into back
  end repeat
end preOpenBackGround
