Script "stack_revStandaloneSettings_field_id_1048"

/*
# Name: field "files" of card "Copy Files" of stack "revStandaloneSettings"
# ID: field id 1048 of card id 1027 of stack "revStandaloneSettings"
# Hash: yDUDc62YAKGSfRNxI4UQPw==
*/


on mouseUp
  if the hilitedLines of me <> "" then 
    enable btn "Remove Entry"
  else
    disable btn "Remove Entry"
  end if
end mouseUp

on arrowKey
  send "mouseUp" to me in 10 milliseconds
  pass arrowKey
end arrowKey

on dragEnter
  set the acceptDrop to true
end dragEnter

on dragDrop pWhat
  put the dragData["files"] into tFiles
  if tFiles is not empty then
    repeat for each line l in tFiles
      if l is not empty then
        send "mouseUp"&& 1,l to btn "add file..."
      end if
    end repeat
  end if
end dragDrop
