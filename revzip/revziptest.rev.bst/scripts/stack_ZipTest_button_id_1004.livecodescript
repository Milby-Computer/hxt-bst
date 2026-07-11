Script "stack_ZipTest_button_id_1004"

/*
# Name: button "card id 1002" of card "card id 1002" of stack "ZipTest"
# ID: button id 1004 of card id 1002 of stack "ZipTest"
# Hash: aluh7CMtOkGEyD7/kT8nCg==
*/


on mouseUp
  revZipOpenArchive "c:/new.zip", "write"
  put result() into err
  if err is not empty then
    answer err
  else
    answer file "Select file to add in new archive"
    if it is not empty then
      put it into addfilename
      revZipAddItemWithFile "c:/new.zip", "newdatafile", addfilename
      put result() into err
      if err is not empty then
        answer err
      end if
      revZipCloseArchive "c:/new.zip"
    end if
  end if
  revZipOpenArchive "c:/update.zip", "update"
  put result() into err
  if err is not empty then
    answer err
  end if
  put "kdjjfglkj lkjs jlkj ldksjfklj lkjlkdfj lkjlk jlskdjflk jlkj" into testdata
  revZipAddItemWithData "c:/update.zip", "/testdir/datavar", "testdata"
  put result() into err
  if err is not empty then
    answer err
  end if
  put revZipOpenArchives() into openlist
  revZipCloseArchive "c:/update.zip"
end mouseUp
