Script "stack_revStandaloneSettings_button_id_1052"

/*
# Name: button "Remove Entry" of card "Copy Files" of stack "revStandaloneSettings"
# ID: button id 1052 of card id 1027 of stack "revStandaloneSettings"
# Hash: br808mVBZlt62ZzFA7Bc2Q==
*/


on mouseUp
  if the hilitedLines of fld "files" is not empty then
    put the hilitedLines of fld "files" into tLines
    repeat with X=the number of items in tLines down to 1
      delete line (item X of tLines) of fld "files"
    end repeat
    setProps
  end if
end mouseUp
