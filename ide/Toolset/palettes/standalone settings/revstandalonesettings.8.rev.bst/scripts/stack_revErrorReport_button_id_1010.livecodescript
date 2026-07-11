Script "stack_revErrorReport_button_id_1010"

/*
# Name: button "Save" of card id 1002 of stack "revErrorReport" of stack "revStandaloneSettings"
# ID: button id 1010 of card id 1002 of stack "revErrorReport" of stack "revStandaloneSettings"
# Hash: 0pqT10i16vFpiAwKhrycmg==
*/


on mouseUp
  ask file "Save error report:" 
  if it <> "" and the result <> "cancel" then
    put the cReport of this stack & cr &cr&"Comments: "&fld "comments" into url ("file:"&it)
  end if
end mouseUp
