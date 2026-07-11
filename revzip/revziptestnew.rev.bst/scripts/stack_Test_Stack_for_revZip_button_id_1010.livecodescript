Script "stack_Test_Stack_for_revZip_button_id_1010"

/*
# Name: button "Extract Files" of card id 1002 of stack "Test Stack for revZip"
# ID: button id 1010 of card id 1002 of stack "Test Stack for revZip"
# Hash: itc/cRE37H4/ZJBy2H4zgQ==
*/


on mouseUp
  local tArchive, tFolder, tItems
  set the hideConsoleWindows to true
  put the text of field "Archive To Open" into tArchive
  put the text of field "Temp Folder" into tFolder
  
  revZipOpenArchive tArchive, "read"
  put revZipEnumerateItems(tArchive) into tItems
  breakpoint
  
  repeat for each line tItem in tItems
    pathEnsure (tFolder & slash & tItem)
    revZipExtractItemToFile tArchive, tItem, (tFolder & slash & tItem)
  end repeat
  
  revZipCloseArchive tArchive
end mouseUp
