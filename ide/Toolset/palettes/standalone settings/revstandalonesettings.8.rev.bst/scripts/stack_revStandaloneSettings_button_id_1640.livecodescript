Script "stack_revStandaloneSettings_button_id_1640"

/*
# Name: button "Add Folder..." of card "Copy Files" of stack "revStandaloneSettings"
# ID: button id 1640 of card id 1027 of stack "revStandaloneSettings"
# Hash: URqILp5HKWca3/6FjjrAdA==
*/


on mouseUp pMouseButton, pOverRide
   answer folder "Select a folder to add from:"
   if it is empty then
      exit mouseUp
   end if
   
   local tPrev
   put field "files" into tPrev
   put revRelativePath(it) & slash & "*" into line (the number of lines in tPrev + 1) of tPrev
   put tPrev into field "files"
   setProps
end mouseUp
