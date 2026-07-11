Script "stack_File_Attribs_button_id_1292"

/*
# Name: button "Show / Hide Browser" of card "Snapshot" of stack "File Attribs"
# ID: button id 1292 of card id 1289 of stack "File Attribs"
# Hash: pyQ/TmMPhCuwHVc+Nx74Hw==
*/


on mouseUp
   iphoneControlGet "snapshotbrowser", "visible"
   iphoneControlSet "snapshotbrowser", "visible", not the result
end mouseUp
