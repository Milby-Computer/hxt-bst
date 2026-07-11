Script "stack_revStandaloneSettings_button_id_1498"

/*
# Name: button "Browse" of group "generalContent" of card "General" of stack "revStandaloneSettings"
# ID: button id 1498 of group id 2882 of card id 1002 of stack "revStandaloneSettings"
# Hash: rZlHv5HGZnmTpSGiuPE4zg==
*/


on mouseUp
   get selectStandaloneBuildFolder()
   if it is not empty then
      set the text of field "Default Build Folder" to it
   end if
end mouseUp
