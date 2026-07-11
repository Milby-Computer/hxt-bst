Script "stack_ZipTest_button_id_1008"

/*
# Name: button "ReadTest" of card "card id 1002" of stack "ZipTest"
# ID: button id 1008 of card id 1002 of stack "ZipTest"
# Hash: Vnl+hFwWDBNUlZalHiZBFQ==
*/


on mouseUp
  revZipOpenArchive "c:/read.zip", "read"
  put result() into err
  revZipExtractItemToVariable "c:/read.zip", "foo", pSomeVariable
  revZipCloseArchive "c:\read.zip"
end mouseUp
