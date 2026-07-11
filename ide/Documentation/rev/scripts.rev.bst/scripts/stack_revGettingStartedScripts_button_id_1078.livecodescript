Script "stack_revGettingStartedScripts_button_id_1078"

/*
# Name: button "Check a directory..." of group "Check whether a directory or drive is write-protected Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1078 of group id 1077 of card id 1002 of stack "revGettingStartedScripts"
# Hash: 2tG4uWUix5C+ocsfXrEGfA==
*/


on mouseUp
  answer folder "Please choose a folder:"
  if it is empty then exit mouseUp -- no folder chosen
  if canWriteFileTo(it) then answer it & return & "can be written to."
  else answer it & return & "is write-locked."
end mouseUp

function canWriteFileTo theLocation
  put theLocation & "/temp" & random(9999) into randomFileName
  open file randomFileName for write -- try creating a file
  if the result is empty then -- success!
    close file randomFileName
    delete file randomFileName -- get rid of the test file
    return true
  else -- failed - couldn't create a file there
    return false
  end if
end canWriteFileTo
