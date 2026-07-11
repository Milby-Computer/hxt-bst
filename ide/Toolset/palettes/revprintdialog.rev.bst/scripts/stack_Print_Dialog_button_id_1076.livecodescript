Script "stack_Print_Dialog_button_id_1076"

/*
# Name: button "Browse" of group "Print Target" of card id 1002 of stack "Print Dialog"
# ID: button id 1076 of group id 1442 of card id 1002 of stack "Print Dialog"
# Hash: nwhlGdVgRFU5VzMEVGIpPQ==
*/


on mouseUp
  local tFile
  ask file "Please choose file to print to" with type outputFileType(the platform)
  put it into tFile
  if tFile is empty then
    exit mouseUp
  end if
  
  put tFile into field "Filename"
end mouseUp

function outputFileType pPlatform
  switch pPlatform
  case "win32"
    return "All files|*|"
    break
  case "macos"
    return "PDF files|PDF|"
    break
  case "linux"
    return "PostScript files|PS|"
    break
  end switch
end outputFileType

