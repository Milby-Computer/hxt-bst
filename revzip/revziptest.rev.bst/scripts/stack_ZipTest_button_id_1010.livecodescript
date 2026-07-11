Script "stack_ZipTest_button_id_1010"

/*
# Name: button "Main Test" of card "card id 1002" of stack "ZipTest"
# ID: button id 1010 of card id 1002 of stack "ZipTest"
# Hash: I06X/hB98fS6DEDpqE9Cyg==
*/


on mouseUp
  global zip_item_data
   
  if the platform is "macos" then
     put "/Users/mark/Desktop/test_archive.zip" into pSomeArchive
     put "/Users/mark/Desktop/danish.txt" into pSomeFile1
     put "/Users/mark/Desktop/tutorial.pdf" into pSomeFile2
  else
    put "c:/some_zip.zip" into pSomeArchive
    put "c:/bigfile.txt" into pSomeFile1
    put "c:/smalfile.txt" into pSomeFile2
  end if
  put "This a test data from variable" into pDataVar
  revZipOpenArchive pSomeArchive, "write"
  revZipAddItemWithFile pSomeArchive, "foo", pSomeFile1
  revZipAddItemWithFile pSomeArchive, "bar", pSomeFile2
  revZipAddItemWithData pSomeArchive, "var.txt", "pDataVar"
  revZipCloseArchive pSomeArchive
  revZipOpenArchive pSomeArchive, "read"
  put revZipEnumerateItems(pSomeArchive) into t_files_list
  put revZipDescribeItem(pSomeArchive, "foo") into t_file_stat
  revZipExtractItemToFile pSomeArchive, "foo", "c:/temp/extract1"
  revZipExtractItemToVariable pSomeArchive, "bar", "zip_item_data"
  revZipCloseArchive pSomeArchive
end mouseUp
