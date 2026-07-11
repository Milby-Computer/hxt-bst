Script "stack_File_Attribs_button_id_1290"

/*
# Name: button "Snapshot" of card "Snapshot" of stack "File Attribs"
# ID: button id 1290 of card id 1289 of stack "File Attribs"
# Hash: eHLUtKx3NRp7pTM93H8BaQ==
*/


on mouseUp
   local tPng
   
   if there is an image "snapshotimage" then
      delete image "snapshotimage"
      exit mouseUp
   end if
   
   local tLocation
   if the hilite of button "No Status Bar" then
      put the working screenRect into tLocation
   else
      put the screenrect into tLocation
   end if
   export snapshot from rect tLocation to tPng as PNG
   
   if the environment is mobile then
      iphoneControlSet "snapshotbrowser", "visible", false
   end if
   
   create image
   set the name of it to "snapshotimage"
   set the text of it to tPng
   set the loc of it to the loc of this card
   send "resizeSnapshot" to me in 3 seconds
end mouseUp

on resizeSnapshot
   if there is an image "snapshotimage" then
      lock screen
      set the height of image "snapshotimage" to (the height of image "snapshotimage") / 2
      set the width of image "snapshotimage" to (the width of image "snapshotimage") / 2
      set the loc of image "snapshotimage" to the loc of this card
      unlock screen
      send "deletesnapshot" to me in 3 seconds
   end if
end resizeSnapshot

on deleteSnapshot
   if there is an image "snapshotimage" then
      delete image "snapshotimage"
   end if
end deleteSnapshot
