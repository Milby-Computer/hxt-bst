Script "stack_revResourceCenter_button_id_579897"

/*
# Name: button "Check a directory..." of group "Example" of group id 579899 of group "mainContent" of card "Checkwhetheradirectoryordriveiswrite-protected" of stack "revResourceCenter"
# ID: button id 579897 of group id 577047 of group id 579899 of group id 102554 of card id 102543 of stack "revResourceCenter"
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
