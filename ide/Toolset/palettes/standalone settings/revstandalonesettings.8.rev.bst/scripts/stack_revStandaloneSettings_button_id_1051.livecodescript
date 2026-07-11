Script "stack_revStandaloneSettings_button_id_1051"

/*
# Name: button "Add File..." of card "Copy Files" of stack "revStandaloneSettings"
# ID: button id 1051 of card id 1027 of stack "revStandaloneSettings"
# Hash: ElTl6gw+k+6xt7MlxqWRMg==
*/


on mouseUp pMouseButton, pOverRide
  if the optionKey is not down then
    if pOverRide is empty then
      answer file "Select a file to add:"
      if it is empty then
        exit mouseUp
      end if
    else
      put pOverride into it
    end if
    put fld "files" into tPrev
    if it is among the lines of tPrev then
      answer error "That file is already included." with "OK"
      exit mouseUp
    end if
    put revRelativePath(it) into line (the number of lines in tPrev+1) of tPrev
    put tPrev into fld "files"
  else
    answer folder "Select a folder to add from:"
    if it is empty then exit mouseUp
    put the directory into tReturn
    set the directory to it
    repeat for each line it in the files
      if not (there is a stack it) then
        next repeat
      end if
      put fld "files" into tPrev
      if it is among the lines of tPrev then
        next repeat
      end if
      put revRelativePath(it) into line (the number of lines in tPrev+1) of tPrev
      put tPrev into fld "files"
    end repeat
    set the directory to tReturn
  end if
  setProps
end mouseUp

function revRelativePath pPath
  local tMainstackPath,tChars
  set the itemDel to "/"
  put item 1 to -2 of the effective filename of stack the cRevTargetStack of this stack & "/" into tMainStackPath
  put the number of chars of tMainStackPath into tChars
  if char 1 to tChars of pPath = tMainStackPath then delete char 1 to tChars of pPath
  return pPath
end revRelativePath
