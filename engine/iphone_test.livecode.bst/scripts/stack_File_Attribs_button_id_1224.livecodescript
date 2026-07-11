Script "stack_File_Attribs_button_id_1224"

/*
# Name: button "Test revZip" of card "Externals" of stack "File Attribs"
# ID: button id 1224 of card id 1222 of stack "File Attribs"
# Hash: P0jOXytc4fNNBilbxXRPmA==
*/


on mouseUp
   /*set the externals of the templateStack to \
         (specialFolderPath("engine") & slash & "revzip-4_2.dylib") & return & \
         (specialFolderPath("engine") & slash & "revzip-device.dylib")
   create invisible stack "RevZipExternal"
   put the externalPackages of stack "RevZipExternal" & return & \
         the externalCommands of stack "RevZipExternal" & return & \
         the externalFunctions of stack "RevZipExternal" & return into field 1
   delete stack "RevZipExternal"*/
   
   local tArchive
   put specialFolderPath("Documents") & slash & "myarchive.zip" into tArchive
   revZipOpenArchive tArchive, "write"
   put revZipOpenArchives() & return into field 1
   
   local tMyData
   put "Hello World!" into tMyData
   revZipAddItemWithData tArchive, "test.txt", "tMyData"
   revZipCloseArchive tArchive
   
   revZipOpenArchive tArchive, "read"
   put revZipEnumerateItems(tArchive) & return after field 1
   
   local tMyVar
   revZipExtractItemToVariable tArchive, "test.txt", "tMyVar"
   put tMyVar & return after field 1
   revZipCloseArchive tArchive
end mouseUp
