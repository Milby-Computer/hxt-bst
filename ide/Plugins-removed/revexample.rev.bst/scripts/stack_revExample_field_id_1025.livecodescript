Script "stack_revExample_field_id_1025"

/*
# Name: field "New Field 1" of card "Help" of stack "revExample"
# ID: field id 1025 of card id 1023 of stack "revExample"
# Hash: tIA3u/fYoVQxnCsUSPxjBA==
*/


on linkClicked pLink
  put "mailto:" & pLink into tMailTo
  if the platform is "Win32" then
    put queryRegistry("HKEY_CLASSES_ROOT\mailto\shell\open\command\") \
        into tMailApp
    replace quote & "%1" & quote with tMailTo in tMailApp
    replace "%1" with tMailTo in tMailApp
    open process tMailApp for neither
  else
    --Mac OS
    revGoURL tMailTo
  end if 
end linkClicked
