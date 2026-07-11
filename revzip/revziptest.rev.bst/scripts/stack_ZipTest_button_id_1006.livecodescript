Script "stack_ZipTest_button_id_1006"

/*
# Name: button "Test2" of card "card id 1002" of stack "ZipTest"
# ID: button id 1006 of card id 1002 of stack "ZipTest"
# Hash: vIrnqqw1AoL2eH/UPGtNnQ==
*/


on mouseUp
  put "c:/test.zip" into pSomeArchive
  put "c:/file1.txt" into pSomeFile1
  put "c:/file2.txt" into pSomeFile2
  revZipOpenArchive pSomeArchive, "write"
  revZipAddItemWithFile pSomeArchive, "foo", pSomeFile1
  revZipCloseArchive pSomeArchive
  revZipOpenArchive pSomeArchive, "update"
  revZipAddItemWithFile pSomeArchive, "bar", pSomeFile2
  revZipCloseArchive pSomeArchive 
end mouseUp
