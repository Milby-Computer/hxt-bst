Script "stack_revImageLibrary_button_id_1127"

/*
# Name: button "Delete...1" of group "Buttons" of card "Images" of stack "revImageLibrary"
# ID: button id 1127 of group id 1165 of card id 1002 of stack "revImageLibrary"
# Hash: s8DLyNoA0kpSoIq76J2NfQ==
*/


on mouseup
  answer warning "Really delete image ID" && word -1 of fld "image id" & "from this image library?" with "Cancel" or "Delete" as sheet
  if it is "Cancel" then exit mouseUp
  put the label of btn "library chooser" into pWhich
  put revLibraryStackName(pWhich) into tStackName
  put word -1 of fld "image id" into tImageID
  set the defaultStack to tStackName
  repeat with c = 1 to the number of cds
    repeat with i = 1 to the number of images in cd c
      if the ID of image i of cd c is tImageID then
        delete image i of cd c
        exit repeat
      end if
    end repeat
  end repeat
  save this stack
  send "menuPick" && quote & the label of btn "library chooser" of stack "revImageLibrary" & quote to btn "library chooser" of stack "revImageLibrary"
end mouseup
