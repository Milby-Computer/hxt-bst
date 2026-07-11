Script "stack_Test_Stack_for_revZip"

/*
# Name: stack "Test Stack for revZip"
# ID: stack "Test Stack for revZip"
# Hash: MTm4eoZOh7xMgTtpCtXr7w==
*/


function externalLibrary
  if the platform is "Linux" then
    set the itemDelimiter to slash
    return item 1 to -3 of the filename of me & "/_build/debug/revzip.so"
  else
    return $EXTERNAL_LIBRARY
  end if
end externalLibrary

on preOpenStack
  if the short name of the owner of the target is the short name of me and \
      "revzipExternalWrapper" is not among the lines of the stacksInUse then
    set the visible of the templateStack to false
    set the name of the templateStack to "revzipExternalWrapper"
    set the externals of the templateStack to externalLibrary()
    create stack
    start using stack "revzipExternalWrapper"
  end if
end preOpenStack

on error pError, pDetails
  local tHandler
  put item -2 of line -2 of the executionContexts into tHandler
  
  local tErrorString
  put "The following error ocurred: " & return & \
      "Handler: " & tHandler & return & \
      "Error: " & pError & return & \
      "Details: " & pDetails into tErrorString
  
  answer tErrorString
  exit to top
end error


-- Utils

function tempFolder
  local tFolder
  set the itemDelimiter to slash
  put item 1 to -2 of the filename of me into tFolder
  return tFolder
end tempFolder

on pathEnsure pPath
  set the hideConsoleWindows to true
  get shell("mkdir" && quote & pPath & quote)
end pathEnsure

function filesLegal pFiles
  filter pFiles without "."
  filter pfiles without ".."
  return pfiles
end filesLegal

function binaryEquals pData1, pData2
   if the length of pData1 <> the length of pData2 then
      return false
   end if
   if pData1 is empty and pData2 is empty then
      return true
   end if
   return (pData1 contains pData2)
end binaryEquals

-- Compares all the files in two folders, non recursive
function folderCompare pFolder1, pFolder2
   local tFiles1, tFiles2, tFile, tData1, tData2
   set the directory to pFolder1
   put filesLegal(the files) into tFiles1
   set the directory to pFolder2
   put filesLegal(the files) into tFiles2
   
   if tFiles1 <> tFiles2 then
      return false
   end if
   
   repeat for each line tFile in tFiles1
      put url ("binfile:" & pFolder1 & slash & tFile) into tData1
      put url ("binfile:" & pFolder2 & slash & tFile) into tData2
      
      if the length of tData1 <> the length of tData2 then 
         return false
      end if
      
      if (tData1 is not empty) and (tData2 is not empty) and (not (tData1 contains tData2)) then
         return false
      end if
      
   end repeat
   
   return true
   
end folderCompare

-- Extracts an archive to a folder
on archiveExtractToFolder pArchive, pFolder
  local tItems
   
  pathEnsure pFolder  
  revZipOpenArchive pArchive, "read"
  put revZipEnumerateItems(pArchive) into tItems
  
  repeat for each line tItem in tItems
    revZipExtractItemToFile pArchive, tItem, (pFolder & slash & tItem)
  end repeat
  
  revZipCloseArchive pArchive
end archiveExtractToFolder

-- Creates an archive from a folder
on archiveCreateFromFolder pFolder, pArchive
  local tFiles, tFile
  set the directory to pFolder
  put filesLegal(the files) into tFiles
  
  revZipOpenArchive pArchive, "write"
  
  repeat for each line tFile in tFiles
    revZipAddItemWithFile pArchive, tFile, (pFolder & slash & tFile)
  end repeat
  
  revZipCloseArchive pArchive
  
end archiveCreateFromFolder

-- The tests

on testZipOpenArchive pArchive
  local tResult, tMode, tArchive
  
  put pArchive into tArchive
  
  -- Open the provided archive for read
  try
    revZipOpenArchive tArchive, "read"
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipOpenArchive
    end if
  catch pError
    log "failed", pError && tResult
    exit testZipOpenArchive
  end try
  
  if tArchive is not among the lines of revZipOpenArchives() then
    log "failed", "No error code, archive is not among the open archives"
    exit testZipOpenArchive
  end if
  
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipOpenArchive
  end if
  
  -- Open a new archive for write
  try
    revZipOpenArchive tempFolder() & slash & "Apps3.zip", "write"
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipOpenArchive
    end if
    
  catch pError
    log "failed", pError && tResult
    exit testZipOpenArchive
  end try
  
  if tempFolder() & slash & "Apps3.zip" is not among the lines of revZipOpenArchives() then
    log "failed", "No error code, archive is not among the open archives"
    exit testZipOpenArchive
  end if
  
  revZipCloseArchive tempFolder() & slash & "Apps3.zip"
  put the result into tResult
  delete file tempFolder() & slash & "Apps3.zip"
  
  if tResult is not empty then
    log "failed", tResult
    exit testZipOpenArchive
  end if
  
  -- Open the provided archive for update
  try
    revZipOpenArchive tArchive, "update"
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipOpenArchive
    end if
  catch pError
    log "failed", pError && tResult
    exit testZipOpenArchive
  end try
  
  if tArchive is not among the lines of revZipOpenArchives() then
    log "failed", "No error code, archive is not among the open archives"
    exit testZipOpenArchive
  end if 
  
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipOpenArchive
  end if
  
  -- Open a new archive for update
  try
    revZipOpenArchive tempFolder() & slash & "Apps3.zip", "update"
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipOpenArchive
    end if
  catch pError
    log "failed", pError && tResult
    exit testZipOpenArchive
  end try
  
  if tempFolder() & slash & "Apps3.zip" is not among the lines of revZipOpenArchives() then
    log "failed", "No error code, archive is not among the open archives"
    exit testZipOpenArchive
  end if
  
  revZipCloseArchive tempFolder() & slash & "Apps3.zip"
  put the result into tResult
  delete file tempFolder() & slash & "Apps3.zip"
  if tResult is not empty then
    log "failed", tResult
    exit testZipOpenArchive
  end if
  
  log "passed"
  
end testZipOpenArchive

on testZipOpenArchiveB pArchive
  local tResult, tMode, tArchive
  
  put tempFolder() & slash & "ThisFolderDoesntExist/nonArchive.zip" into tArchive
  
  -- Open a non existant archive for read
  try
    revZipOpenArchive tArchive, "read"
    put the result into tResult
    if tResult is empty then
      log "failed", tResult
      exit testZipOpenArchiveB
    end if
  catch pError
    log "failed", pError && tResult
    exit testZipOpenArchiveB
  end try
  
  if tArchive is among the lines of revZipOpenArchives() then
    log "failed", "No error code, archive is among the open archives, when it should not have been opened."
    exit testZipOpenArchiveB
  end if
  
  try
    revZipCloseArchive tArchive
  end try
  put the result into tResult
  
  -- Open a new archive for write, using a folder that doesnt exist.
  try
    revZipOpenArchive tArchive, "write"
    put the result into tResult
    if tResult is empty then
      log "failed", "archive open returned empty result when an error should have ocurred"
      exit testZipOpenArchiveB
    end if
    
  catch pError
    log "failed", pError && tResult
    exit testZipOpenArchiveB
  end try
  
  if tArchive is among the lines of revZipOpenArchives() then
    log "failed", "Archive is among the lines of the openarchives even though revzipopenarchive returned an error"
    exit testZipOpenArchiveB
  end if
  
  try
    revZipCloseArchive tArchive
    put the result into tResult
    delete file tempFolder() & slash  & "thisFolderDoesntExist" & slash & "Apps3.zip"
  end try
  
  -- Open a non existant archive for update
  try
    revZipOpenArchive tArchive, "update"
    
    put the result into tResult
    if tResult is empty then
      log "failed", "revZipOpenArchive returned an empty result when an error should have ocurred"
      exit testZipOpenArchiveB
    end if
  catch pError
    log "failed", pError && tResult
    exit testZipOpenArchiveB
  end try
  
  if tArchive is among the lines of revZipOpenArchives() then
    log "failed", "Archive is among the lines of the openarchives even though revzipopenarchive returned an error"
    exit testZipOpenArchiveB
  end if 
  
  try
    revZipCloseArchive tArchive
  end try
  
  log "passed"
   
end testZipOpenArchiveB

on testZipCloseArchive pArchive
  local tResult, tArchive
  put pArchive into tArchive
  
  try 
    revZipOpenArchive tArchive, "read"
    revZipCloseArchive tArchive
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipCloseArchive
    end if
  catch pError
    log "failed", pError && tResult
  end try
  
  if tArchive is not among the lines of revZipOpenArchives() then
    log "passed"
  else
    log "failed", "No Error, archive is still among the open archives"
  end if
end testZipCloseArchive

on testZipCloseArchiveB pArchive
  local tResult, tArchive
  put tempFolder() & slash & "ThisFolderDoesntExist/nonArchive.zip" into tArchive
  
  try 
    revZipCloseArchive tArchive
    put the result into tResult
    if tResult is empty then
      log "failed", "tryed to close an un-open archive and no result was returned"
      exit testZipCloseArchiveB
    end if
  end try
  
  log "passed"
end testZipCloseArchiveB

on testZipOpenArchives pArchive
  local tArchive
  put pArchive into tArchive
  revZipOpenArchive tArchive, "read"
  if tArchive is among the lines of revZipOpenArchives() then
    log "passed"
  else
    log "failed", "No Error code, archive is not among the open archives"
  end if
  revZipCloseArchive tArchive
end testZipOpenArchives

on testZipOpenArchivesB pArchive
  -- This is mostly tested elsewhere, just 
  -- check that the expected result is true.
  
  if revZipOpenArchives() is empty then
    log "passed"
  else
    log "failed", "there should be no archives open, but it appears that at least one is"
  end if
end testZipOpenArchivesB

on testZipAddItemWithFile pArchive
  local tFiles, tFile, tFolder
  local tResult, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  put tempFolder() & slash & "Apps3.zip" into tArchive
  
  revZipOpenArchive tArchive, "write"
  
  repeat for each line tFile in tFiles
    try
      revZipAddItemWithFile tArchive, tFile, (tFolder & slash & tFile)
      put the result into tResult
      if tResult is not empty then
        log "failed", tResult
        exit testZipAddItemWithFile
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
  
  revZipCloseArchive tArchive
  put the result into tResult
  
  if the result is not empty then
    log "failed", tResult
    exit testZipAddItemWithFile
  end if
  
  pathEnsure tempFolder() & slash & "temp2"
  archiveExtractToFolder tArchive, tempFolder() & slash & "temp2"
  if folderCompare((tempFolder() & slash & "temp2"),(tempFolder() & slash & "temp")) then
    log "passed"
  else
    log "failed", "No error code, but folders are not the same"
  end if
  
  revDeleteFolder tempFolder() & slash & "temp2"
  delete file tArchive
end testZipAddItemWithFile

on testZipAddItemWithFileB pArchive
  local tFiles, tFile, tFolder
  local tResult, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  -- First try to add files to a nonexistant archive
  put tempFolder() & slash & "ThisFolderDoesntExist/nonArchive.zip" into tArchive
  
  repeat for each line tFile in tFiles
    try
      revZipAddItemWithFile tArchive, tFile, (tFolder & slash & tFile)
      put the result into tResult
      if tResult is empty then
        log "failed", "attempted to add a file to a non-open archive and no error was returned"
        exit testZipAddItemWithFileB
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
  
  -- Now try adding nonexistant files to an open archive
  
  put pArchive into tArchive
  revZipOpenArchive tArchive, "update"
  try
    revZipAddItemWithFile tArchive, "nonFile.txt", tempFolder() & slash & "ThisFolderDoesntExist/nonFile.txt"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to add a nonexistant file to an open archive and no error was returned."
      exit testZipAddItemWithFileB
    end if
  catch pError
    log "failed", pError && tResult
  end try
   
  revZipCloseArchive tArchive
   
  log "passed"
   
end testZipAddItemWithFileB

command testZipAddUncompressedItemWithFileB pArchive
  local tFiles, tFile, tFolder
  local tResult, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  -- First try to add files to a nonexistant archive
  put tempFolder() & slash & "ThisFolderDoesntExist/nonArchive.zip" into tArchive
  
  repeat for each line tFile in tFiles
    try
      revZipAddItemWithFile tArchive, tFile, (tFolder & slash & tFile)
      put the result into tResult
      if tResult is empty then
        log "failed", "attempted to add a file to a non-open archive and no error was returned"
        exit testZipAddUncompressedItemWithFileB
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
  
  -- Now try adding nonexistant files to an open archive
  
  put pArchive into tArchive
  revZipOpenArchive tArchive, "update"
  try
    revZipAddUncompressedItemWithFile tArchive, "nonFile.txt", tempFolder() & slash & "ThisFolderDoesntExist/nonFile.txt"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to add a nonexistant file to an open archive and no error was returned."
      exit testZipAddUncompressedItemWithFileB
    end if
  catch pError
    log "failed", pError && tResult
  end try
   
  revZipCloseArchive tArchive
   
  log "passed"
   
end testZipAddUncompressedItemWithFileB

command testZipAddUncompressedItemWithFile pArchive
  local tFiles, tFile, tFolder
  local tResult, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  put tempFolder() & slash & "Apps3.zip" into tArchive
  
  revZipOpenArchive tArchive, "write"
  
  repeat for each line tFile in tFiles
    try
      revZipAddUncompressedItemWithFile tArchive, tFile, (tFolder & slash & tFile)
      put the result into tResult
      if tResult is not empty then
        log "failed", tResult
        exit testZipAddUncompressedItemWithFile
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
  
  revZipCloseArchive tArchive
  put the result into tResult
  
  if the result is not empty then
    log "failed", tResult
    exit testZipAddUncompressedItemWithFile
  end if
  
  pathEnsure tempFolder() & slash & "temp2"
  archiveExtractToFolder tArchive, tempFolder() & slash & "temp2"
  if folderCompare((tempFolder() & slash & "temp2"),(tempFolder() & slash & "temp")) then
    log "passed"
  else
    log "failed", "No error code, but folders are not the same"
  end if
  
  revDeleteFolder tempFolder() & slash & "temp2"
  delete file tArchive
end testZipAddUncompressedItemWithFile

on testZipAddItemWithData pArchive
  local tFiles, tFile, tFolder
  local tResult, tData, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  put tempFolder() & slash & "Apps3.zip" into tArchive
  revZipOpenArchive tArchive, "update"
  
  repeat for each line tFile in tFiles
    try
      put url ("binfile:" & tFolder & slash & tFile) into tData
      revZipAddItemWithData tArchive, tFile, "tData"
      put the result into tResult
      if tResult is not empty then
        log "failed", tResult
        exit testZipAddItemWithData
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
   
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipAddItemWithData
  end if
   
  pathEnsure tempFolder() & slash & "temp2"
  archiveExtractToFolder tArchive, tempFolder() & slash & "temp2"
  if folderCompare((tempFolder() & slash & "temp2"),(tempFolder() & slash & "temp")) then
    log "passed"
  else
    log "failed", "No error code, but folders are not the same"
  end if
   
  revDeleteFolder tempFolder() & slash & "temp2"
  delete file tArchive
end testZipAddItemWithData

command testZipAddUncompressedItemWithData pArchive
  local tFiles, tFile, tFolder
  local tResult, tData, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  put tempFolder() & slash & "Apps3.zip" into tArchive
  revZipOpenArchive tArchive, "update"
  
  repeat for each line tFile in tFiles
    try
      put url ("binfile:" & tFolder & slash & tFile) into tData
      revZipAddUncompressedItemWithData tArchive, tFile, "tData"
      put the result into tResult
      if tResult is not empty then
        log "failed", tResult
        exit testZipAddUncompressedItemWithData
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
   
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipAddUncompressedItemWithData
  end if
   
  pathEnsure tempFolder() & slash & "temp2"
  archiveExtractToFolder tArchive, tempFolder() & slash & "temp2"
  if folderCompare((tempFolder() & slash & "temp2"),(tempFolder() & slash & "temp")) then
    log "passed"
  else
    log "failed", "No error code, but folders are not the same"
  end if
   
  revDeleteFolder tempFolder() & slash & "temp2"
  delete file tArchive
end testZipAddUncompressedItemWithData

on testZipAddItemWithDataB pArchive
  local tFiles, tFile, tFolder
  local tResult, tData, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  -- First try to add files to a nonexistant archive
  put tempFolder() & slash & "ThisFolderDoesntExist/nonArchive.zip" into tArchive
  
  repeat for each line tFile in tFiles
    try
      put url ("binfile:" & tFolder & slash & tFile) into tData
      revZipAddItemWithData tArchive, tFile, "tData"
      put the result into tResult
      if tResult is empty then
        log "failed", "attempted to add data to a non-open archive and no error was returned"
        exit testZipAddItemWithDataB
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
  
  -- As any data could be added to an archive, this is the only appropriate test.
  
  log "passed"
end testZipAddItemWithDataB

command testZipAddUncompressedItemWithDataB pArchive
  local tFiles, tFile, tFolder
  local tResult, tData, tArchive
  
  put tempFolder() & slash & "temp" into tFolder
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  -- First try to add files to a nonexistant archive
  put tempFolder() & slash & "ThisFolderDoesntExist/nonArchive.zip" into tArchive
  
  repeat for each line tFile in tFiles
    try
      put url ("binfile:" & tFolder & slash & tFile) into tData
      revZipAddUncompressedItemWithData tArchive, tFile, "tData"
      put the result into tResult
      if tResult is empty then
        log "failed", "attempted to add data to a non-open archive and no error was returned"
        exit testZipAddUncompressedItemWithDataB
      end if
    catch pError
      log "failed" & pError && tResult
    end try
  end repeat
  
  -- As any data could be added to an archive, this is the only appropriate test.
  
  log "passed"
end testZipAddUncompressedItemWithDataB


on testZipReplaceItemWithFile pArchive
  local tFolder, tItems, tArchive, tResult
  local tFiles, tData
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  revZipOpenArchive tArchive, "update"
  
  if there is no file (tempFolder() & slash & "replace.txt") then
    log "failed", "Unable to carry out test because the following file is needed, please create it. " & tempFolder() & slash & "replace.txt"
    exit testZipReplaceItemWithFile
  end if
  
  put revZipEnumerateItems(tArchive) into tItems
  repeat for each line tItem in tItems
    try
      revZipReplaceItemWithFile tArchive, tItem, (tempFolder() & slash & "replace.txt")
      put the result into tResult
      if tResult is not empty then
        log "failed", tResult
        exit testZipReplaceItemWithFile
      end if
    catch pError
      log "failed", pError && tResult
    end try
  end repeat
  
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipReplaceItemWithFile
  end if
  
  archiveExtractToFolder tArchive, (tempFolder() & slash & "temp2")
  
  set the directory to tempFolder() & slash & "temp2"
  put filesLegal(the files) into tFiles
  
  repeat for each line tFile in tFiles
    if url ("binfile:" & tempFolder() & slash & "replace.txt") <> url ("binfile:" & tempFolder() & slash & "temp2" & slash & tFile) then
      log "failed", "File " & tFile & " does not match the text to replace with"
      exit testZipReplaceItemWithFile
    end if
  end repeat
  
  set the directory to tempfolder()
  revDeleteFolder (tempfolder() & slash & "temp2")
  
  log "passed"
  
end testZipReplaceItemWithFile

on testZipReplaceItemWithFileB pArchive
  local tFolder, tItems, tArchive, tResult
  local tFiles, tData
  put tempFolder() & slash & "temp" into tFolder
  
  put pArchive into tArchive
   
  
  -- First try to replace an item in a non-open archive
  try
    revZipReplaceItemWithFile tArchive, "nonItem", (tempFoldder() & slash & "replace.txt")
    put the result into tResult
    if tResult is empty then
      log "failed", "Attempted to replace an item in a non-open archive, and no error was returned"
      exit testZipReplaceItemWithFileB
    end if
  end try
   
   
  -- Now open the archive, and try replacing an item that isnt present in the archive.
  put pArchive into tArchive
  revZipOpenArchive tArchive, "update"
  try
    revZipReplaceItemWithFile tArchive, "nonItem", (tempFolder() & slash & "replace.txt")
    put the result into tResult
    if tResult is empty then
      log "failed", "Attempted to replace a non-existant item in an archive and no error was returned"
      exit testZipReplaceItemWithFileB
    end if
  end try
   
   
  -- Next try to replace an item with a file that doesnt exist in an open archive
  put revZipEnumerateItems(tArchive) into tItems
  repeat for each line tItem in tItems
    try
      revZipReplaceItemWithFile tArchive, tItem, (tempFolder() & slash & "thisFolderDoesntExist" & slash & "replace.txt")
      put the result into tResult
      if tResult is empty then
        log "failed", "Attempted to replace an item in an archive with a nonexistant file and no error was returned"
        exit testZipReplaceItemWithFileB
      end if
    catch pError
      log "failed", pError && tResult
    end try
  end repeat
   
  revZipCloseArchive tArchive
  
  log "passed"
   
end testZipReplaceItemWithFileB

on testZipReplaceItemWithData pArchive
  local tFolder, tItems, tArchive, tResult
  local tFiles, tData
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  revZipOpenArchive tArchive, "update"
   
  put revZipEnumerateItems(tArchive) into tItems
  repeat for each line tItem in tItems
    try
      put url ("binfile:" & tempFolder() & slash & "replace.txt") into tData
      revZipReplaceItemWithData tArchive, tItem, "tData"
      put the result into tResult
      if tResult is not empty then
        log "failed", tResult
        exit testZipReplaceItemWithData
      end if
    catch pError
      log "failed", pError && tResult
    end try
  end repeat
   
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipReplaceItemWithData
  end if
  
  archiveExtractToFolder tArchive, (tempFolder() & slash & "temp2")
   
  set the directory to tempFolder() & slash & "temp2"
  put filesLegal(the files) into tFiles
   
  repeat for each line tFile in tFiles
    if url ("binfile:" & tempFolder() & slash & "replace.txt") <> url ("binfile:" & tempFolder() & slash & "temp2" & slash & tFile) then
      log "failed", "File " & tFile & " does not match the text to replace with"
      exit testZipReplaceItemWithData
    end if
  end repeat
   
  set the directory to tempFolder()
  revDeleteFolder tempFolder() & slash & "temp2"
  put the result into tResult
   
  log "passed"
   
end testZipReplaceItemWithData

on testZipReplaceItemWithDataB pArchive
  local tFolder, tItems, tArchive, tResult
  local tFiles, tData
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
   
  put url ("binfile:" & tempFolder() & slash & "replace.txt") into tData
  
  -- First replace an item in a non-open archive
  try
    revZipReplaceItemWithData tArchive, "nonItem", "tData"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to replace an item in a non-open archive and no error message was returned"
      exit testZipReplaceItemWithDataB
    end if
  end try
   
  -- Then replace an item that doesnt exist in an open archive
  revZipOpenArchive tArchive, "update"
  try
    revZipReplaceItemWithData tArchive, "nonItem", "tData"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to replace a nonexistant item in an open archive and no error message was returned"
      exit testZipReplaceItemWithDataB
    end if
  end try
  revZipCloseArchive tArchive
   
  log "passed"
end testZipReplaceItemWithDataB

on testZipRenameItem pArchive
  local tArchive, tFolder, tItems, tOldName, tResult
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  
  revZipOpenArchive tArchive, "update"
  put revZipEnumerateItems(tArchive) into tItems
  put line 1 of tItems into tOldName
  
  try
    revZipRenameItem tArchive, tOldName, "renamedItem1"
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipRenameItem
    end if
  catch pError
    log "failed", pError && tResult    
  end try
  
  put revZipEnumerateItems(tArchive) into tItems
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipRenameItem
  end if
  
  if line 1 of tItems = "renamedItem1" then
    log "passed"
  else
    log "failed", "item should be named renamedItem1, and is actually named " & line 1 of tItems
  end if
end testZipRenameItem

command testZipGetAttributes pArchive
   revZipOpenArchive pArchive, "read"
   
   local tItems
   put revZipEnumerateItems(pArchive) into tItems
   
   local tItem
   put line 1 of  tItems into tItem
   
   try
      local tAttributes
      put revZipGetItemAttributes(pArchive, tItem) into tAttributes
      breakpoint
   end try
   
   revZipCloseArchive pArchive
end testZipGetAttributes

on testZipSetAttributes pArchive
  local tArchive, tFolder, tItems, tOldName, tResult
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  
  revZipOpenArchive tArchive, "update"
  put revZipEnumerateItems(tArchive) into tItems
  put line 1 of tItems into tOldName
  
  try
    --revZipSetItemAttributes tArchive, tOldName, 3, baseConvert("755", 8, 10) * (2 ^ 16)
    revZipSetItemAttributes tArchive, tOldName, 19, swapEndian16(baseConvert("755", 8, 10)) * (2 ^ 16)
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipSetAttributes
    end if
  catch pError
    log "failed", pError && tResult    
  end try
  
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
  end if
  
  put url ("binfile:" & tArchive) into url ("binfile:C:/Documents and Settings/Oliver/Desktop/archive.zip")
  
  log "passed"
end testZipSetAttributes

function swapEndian16 pNumber
  --  local tConvertedNumber
  --  repeat for each char tByte in pNumber
  --    put toggleEndianness(tByte) after tConvertedNumber
  --  end repeat
  --  put tConvertedNumber
  local tLo, tHi
  put pNumber mod 256 into tLo
  put pNumber div 256 into tHi
  return tLo * 256 + tHi
end swapEndian16

private function toggleEndianness pValue
  if pValue < 0 or pValue > 255 then
    return empty
  end if
  
  local tBits
  put baseConvert(pValue, 10, 2) into tBits
  
  local tReversedBits
  repeat for each char tBit in tBits
    put tBit before tReversedBits
  end repeat
  
  local tConvertedValue
  put baseConvert(tReversedBits, 2, 10) into tConvertedValue
  return tConvertedValue
end toggleEndianness

on testZipRenameItemB pArchive
  local tArchive, tFolder, tItems, tOldName, tResult
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  
  --revZipOpenArchive tArchive, "update"
  --put revZipEnumerateItems(tArchive) into tItems
  --put line 1 of tItems into tOldName
  
  -- First try to rename an item in a non-open archive
  
  try 
    revZipRenameItem tArchive, "nonItem", "renamedNonItem"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to rename a file in a non open archive and no error message was returned"
      exit testZipRenameItemB
    end if
  end try
  
  -- Now open the archive and try renaming a nonexistant item
  
  revZipOpenArchive tArchive, "update"
  try
    revZipRenameItem tArchive, "nonItem", "renamedNonItem"
    put the result into tResult
    if tResult is empty then
      log "failed", "Attempted to rename a nonexistant item in an open archve and no error message was returned"
      exit testZipRenameItemB
    end if
  end try
  revZipCloseArchive tArchive
  
  log "passed"
end testZipRenameItemB

on testZipDeleteItem pArchive
  local tArchive, tFolder, tItems, tDeletedItem, tResult
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
   
  revZipOpenArchive tArchive, "update"
  put the result into tResult
  
  put revZipEnumerateItems(tArchive) into tItems
  put line 1 of tItems into tDeletedItem
  
  try
    revZipDeleteItem tArchive, tDeletedItem
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipDeleteItem
    end if
  catch pError
    log "failed", pError && tResult
  end try
  
  put revZipEnumerateItems(tArchive) into tItems
  
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipDeleteItem
  end if
   
  if tDeletedItem is among the lines of tItems then
    log "failed", "item is still in the archive"
  else
    log "passed"
  end if
   
end testZipDeleteItem

on testZipDeleteItemB pArchive
  local tArchive, tFolder, tItems, tDeletedItem, tResult
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
   
  -- First try to delete an item from a non open archive
  try 
    revZipDeleteItem tArchive, "nonItem"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to delete an item from a non-open archive and no error message was returned"
      exit testZipDeleteItemB
    end if
  end try
  
  -- Then try to delete a nonexistant item from an open archive
  revZipOpenArchive tArchive, "update"
  try
    revZipDeleteItem tArchive, "nonItem"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to delete a nonexistant item from an open archive and no error message was returned"
      exit testZipDeleteItemB
    end if
  end try
  revZipCloseArchive tArchive
   
  log "passed"
end testZipDeleteItemB

on testZipEnumerateItems pArchive
  local tFiles, tItems, tFolder, tArchive, tResult
  
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  revZipOpenArchive tArchive, "read"
  
  try 
    put revZipEnumerateItems(tArchive) into tItems
    put the result into tResult
  catch pError
    log "failed", pError && tResult
  end try
  
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipEnumerateItems
  end if
  
  set the directory to tFolder
  put filesLegal(the files) into tFiles
  
  if the last char of tItems is return then delete the last char of tItems
  
  if tFiles = tItems then
    log "passed"
  else
    log "failed", "No error code, but the items in the archive don't match the files in the folder it was made from"
  end if
   
end testZipEnumerateItems

on testZipEnumerateItemsB pArchive
  local tFiles, tItems, tFolder, tArchive, tResult
  
  try 
    put revZipEnumerateItems(tArchive) into tItems
    put the result into tResult
    if tResult is not empty then
      log "failed", "attempted to list the items in a non-open archive and some data was returned"
      exit testZipEnumerateItemsB
    end if
  end try
  
  log "passed"
   
end testZipEnumerateItemsB

on testZipDescribeItem pArchive
  local tFiles, tItems, tFolder, tArchive, tResult, tDetails
  local tCompressions = "none,shrink,reduce_1,reduce_2,reduce_3,reduce_4,implode,deflate,deflate64,pkware_implode"
  
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
   
  revZipOpenArchive tArchive, "read"
  
  put revZipEnumerateItems(tArchive) into tItems
  put revZipDescribeItem(tArchive,line 2 of tItems) into tDetails
   
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipDescribeItem
  end if
   
  if tDetails is empty then
    log "failed", "returned empty"
    exit testZipDescribeItem
  end if
   
  if the number of items of tDetails <> 6 then
    log "failed", "incorrect number of items returned, expected 6, got " & the number of items of tDetails
    exit testZipDescribeItem
  end if
   
  if item 1 of tDetails is not a number or item 1 of tDetails < 0 then
    log "failed", "index is wrong, should be positive integer, actually " & item 1 of tDetails
    exit testZipDescribeItem
  end if
   
  if item 2 of tDetails is not a number or item 2 of tDetails < 0 then
    log "failed", "crc is incorrect, expected positive integer, got " & item 2 of tDetails
    exit testZipDescribeItem
  end if
   
  if item 3 of tDetails is not a number or item 3 of tDetails < 0 then
    log "failed", "size is incorrect, expected positive integer, got " & item 3 of tDetails
    exit testZipDescribeItem
  end if
   
  if item 4 of tDetails is not a number or item 5 of tDetails < 0 then
    log "failed", "mtime is incorrect, expected positive integer, got " & item 5 of tDetails
    exit testZipDescribeItem
  end if
   
  if item 5 of tDetails is not a number or item 5 of tDetails < 0 then
    log "failed", "compressed_size is incorrect, expected positive integer, got " & item 5 of tDetails
    exit testZipDescribeItem
  end if
   
  if item 6 of tDetails is not among the items of tCompressions then
    log "failed", "compression method is incorrect, expected one of " & tCompressions & ", got " & item 6 of tDetails
    exit testZipDescribeItem
  end if
   
  log "passed"
end testZipDescribeItem

on testZipDescribeItemB pArchive
  local tFiles, tItems, tFolder, tArchive, tResult, tDetails
  local tCompressions = "none,shrink,reduce_1,reduce_2,reduce_3,reduce_4,implode,deflate,deflate64,pkware_implode"
  
  try
    put revZipDescribeItem(tArchive,"nonItem") into tDetails
  end try
  if tDetails is not empty then
    log "failed", "attempted to describe an item in a non-open archive and got some data returned"
    exit testZipDescribeItemB
  end if
   
  put pArchive into tArchive
  revZipOpenArchive tArchive, "read"
  try
    put revZipDescribeItem(tArchive,"nonItem") into tDetails
  end try
  if tDetails is not empty then
    log "failed", "attempted to describe a nonexistant item in an open archive"
    exit testZipDescribeItemB
  end if
  revZipCloseArchive tArchive 
   
  log "passed"
end testZipDescribeItemB

on testZipExtractToVariable pArchive
  local tFiles, tItems, tFolder, tArchive, tResult
  local tData, tExtractedData
  
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  revZipOpenArchive tArchive, "read"
  put the result into tResult
  put revZipEnumerateItems(tArchive) into tItems
  put the result into tResult
   
  repeat for each line tItem in tItems  
    put url ("binfile:" & tempFolder() & slash & "temp" & slash & tItem) into tData
    put empty into tExtractedData
    revZipExtractItemToVariable tArchive, tItem, "tExtractedData"
    put the result into tResult
    if tResult is not empty then
      log "failed", tResult
      exit testZipExtractToVariable
    end if
    if not binaryEquals(tData,tExtractedData) then
      log "failed", "data in file is not the same as extracted data for file " & tItem
      exit testZipExtractToVariable
    end if
  end repeat
  
  revZipCloseArchive tArchive
  put the result into tResult
  if tResult is not empty then
    log "failed", tResult
    exit testZipExtractToVariable
  end if
   
  log "passed"
   
end testZipExtractToVariable


on testZipExtractToVariableB pArchive
  local tFiles, tItems, tFolder, tArchive, tResult
  local tData, tExtractedData
  
  put pArchive into tArchive
  
  -- Unopen archive
  try
    revZipExtractItemToVariable tArchive, "nonItem", "tExtractedData"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to extract to variable an item from a nonopen archive and no error was returned"
      exit testZipExtractToVariableB
    end if
  end try
  
  revZipOpenArchive tArchive, "read"
  try
    revZipExtractItemToVariable tArchive, "nonItem", "tExtractedData"
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to extract to variable a nonexistant item from an open archive and no error was returned"
      exit testZipExtractToVariableB
    end if
  end try
  revZipCloseArchive tArchive
   
  log "passed"
   
end testZipExtractToVariableB

on testZipExtractToFile pArchive
  local tFiles, tItems, tFolder, tArchive, tResult
  local tData, tExtractedData
  
  put tempFolder() & slash & "temp" into tFolder
  put pArchive into tArchive
  archiveCreateFromFolder tFolder, tArchive
  put revZipEnumerateItems(tArchive) into tItems
   
  repeat for each line tItem in tItems  
    put url ("binfile:" & tempFolder() & slash & "temp" & slash & tItem) into tData
    revZipExtractItemToFile tArchive, tItem, tempFolder() & slash & "extractedData.txt"
    if tData <> url ("binfile:" & tempfolder() & slash & "extractedData.txt") then
      log "failed", "data in file is not the same as extracted data for file " & tItem
      exit testZipExtractToFile
    end if
  end repeat
   
  delete file (tempFolder() & slash & "extractedData.txt")
  
  log "passed"
   
end testZipExtractToFile

on testZipExtractToFileB pArchive
  local tFiles, tItems, tFolder, tArchive, tResult
  local tData, tExtractedData, tFile
  
  put pArchive into tArchive
  put tempFolder() & slash & "extractedData.txt" into tFile
  
  try  
    revZipExtractItemToFile tArchive, "nonItem", tFile
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to extract an item to file from a non-open archive, and no error was returned"
      exit testZipExtractToFileB
    end if
  end try
   
  revZipOpenArchive tArchive, "read"
  try  
    revZipExtractItemToFile tArchive, "nonItem", tFile
    put the result into tResult
    if tResult is empty then
      log "failed", "attempted to extract a nonexistant item to file from an open archive, and no error was returned"
      exit testZipExtractToFileB
    end if
  end try
  revZipCloseArchive tArchive
  
  log "passed"
   
end testZipExtractToFileB

command testZipBug5088 pArchive
   local tArchive
   answer file "Please select a zip archive that was created by Mac OS X"
   put it into tArchive
   
   if there is no file tArchive then
      log "failed", "User failed to provided required test file"
      exit testZipBug5088
   end if
   
   # According to the bug report either adding a file to this archive or 
   # removing an existing one will mess up the other items in it.
   local tData
   put "this is a test" into tData
   
   # Create a test file to add to the archive
   local tFile
   put tempFolder() & "/Bug 5088.txt" into tFile
   if there is a file tFile then
      log "failed", "This test needs to write to the file : " & tFile & " but it already exists, aborting"
      exit testZipBug5088
   end if
   
   put tData into url ("file:" & tFile)
   
   # Open the archive for update
   local tResult
   revZipOpenArchive tArchive, "update"
   put the result into tResult
   if tResult is not empty then
      log "failed", "Failed to open the archive with error: " & tResult
      delete file tFile
      exit testZipBug5088
   end if
   
   # List the items, check that the archive contains at least one other item, and that it doesn't
   # contain an item that clashes with the one we want to add.
   local tItemList
   put revZipEnumerateItems(tArchive) into tItemList
   if "Bug 5088.txt" is among the lines of tItemList then
      log "failed", "The selected archive must not contain an item called Bug 5088.txt"
      delete file tFile
      exit testZipBug5088
   end if
   
   if tItemList is empty then
      log "failed", "The selected archive must have at least one item in it to reproduce the bug"
      delete file tFile
      exit testZipBug5088
   end if
   
   local tItemName
   put line 1 of tItemList into tItemName
   local tBefore
   revZipExtractItemToVariable tArchive, tItemName, "tBefore"
   put the result into tResult
   if tResult is not empty then
      log "failed", "Couldnt extract file from archive with error: " & tResult & " unable to determine if bug fixed"
      exit testZipBug5088
   end if
   
   # Attempt to add the file
   revZipAddItemWithFile tArchive, "Bug 5088.txt", tFile
   put the result into tResult
   if tResult is not empty then
      log "failed", "Failed to add item to archive with error: " & tResult
      delete file tFile
      exit testZipBug5088
   end if
   
   revZipCloseArchive tArchive
   
   # We need to close and re-open the archive to see the bug, as its in the code that writes the archive to disk on closing.
   revZipOpenArchive tArchive, "update"
   
   # Now attempt to extract one of the other files in the archive.
   local tAfter
   revZipExtractItemToVariable tArchive, tItemName, "tAfter"
   put the result into tResult
   if tResult is not empty then
      log "failed", "Couldnt extract file from archive with error: " & tResult & " Bug not fixed"
      delete file tFile
      exit testZipBug5088
   end if
   
   if not binaryEquals(tBefore, tAfter) then
      log "failed", "Item " & line 1 of tItemList & " has been corrupted by addition of file to archive by rev"
      delete file tFile
      exit testZipBug5088
   end if
   
   revZipCloseArchive tArchive
   
   delete file tFile
   
   log "passed"
end testZipBug5088

on testZipMemLeak pArchive
  log "passed"
end testZipMemLeak

-- Normal tests, with correct data
function testEnumerateAll
   --return "AddItemWithFile"
   --return "GetAttributes"
   return "AddItemWithData,AddItemWithFile,CloseArchive,DeleteItem,DescribeItem,EnumerateItems,ExtractToFile,ExtractToVariable,OpenArchive,OpenArchives,RenameItem,ReplaceItemWithData,ReplaceItemWithFile,AddUncompressedItemWithData,AddUncompressedItemWithFile,SetAttributes,Bug5088,GetAttributes"
   --return "MemLeak" --ReplaceItemWithData,ReplaceItemWithFile"
end testEnumerateAll

-- Bad data tests
function testEnumerateAllBad
  return "AddItemWithDataB,AddItemWithFileB,CloseArchiveB,DeleteItemB,DescribeItemB,EnumerateItemsB,ExtractToFileB,ExtractToVariableB,OpenArchiveB,OpenArchivesB,RenameItemB,ReplaceItemWithDataB,ReplaceItemWithFileB,AddUncompressedItemWithFileB,AddUncompressedItemWithDataB"
end testEnumerateAllBad

on testRunAll
  local tTests, tArchive, tCommand, tResult
  put testEnumerateAll() into tTests
  
  logInit
  log "begin", "Running All tests"
  
  if there is no folder (tempFolder() & slash & "temp") then
    log "failed", "Unable to run tests, please create a folder with some test files in it at this location: " & tempFolder() & slash & "temp"
    exit testRunAll
  end if
  
  
  repeat for each item tTest in tTests
    log "begin", tTest
    
    put tempFolder() & slash & "Apps2.zip" into tArchive
    archiveCreateFromFolder tempFolder() & slash & "temp", tArchive
    
    -- Set the callback
    revZipSetProgressCallback "logCallback"
    
    put "testZip" & tTest && quote & tArchive & quote into tCommand
    do tCommand
    
    if tArchive is among the items of revZipOpenArchives() then
      --revZipCloseArchive tArchive
    end if
    
    repeat while the number of lines of revZipOpenArchives() > 0 
      revZipCloseArchive (line 1 of revZipOpenArchives())
    end repeat
    
    delete file tArchive
    put the result into tResult
    if tResult is not empty then
      breakpoint
    end if
    
    log "end", tTest
  end repeat
  
  log "end", "Running All tests"
  
end testRunAll

on testRunMemLeak
  local tFile = "C:/Apps2.zip"
  --  revZipOpenArchive tFile, "write"
  --  revZipAddItemWithFile tFile, "testItem", "C:/add.txt"
  --  revZipCloseArchive tFile
  archiveCreateFromFolder tempFolder() & slash & "temp", tFile
end testRunMemLeak

on testRunAllBadData
  local tTests, tArchive, tCommand, tResult
  put testEnumerateAllBad() into tTests
   
  logInit
  log "begin", "Running All tests with Bad data"
   
  repeat for each item tTest in tTests
    log "begin", tTest
    
    put tempFolder() & slash & "Apps2.zip" into tArchive
    archiveCreateFromFolder tempFolder() & slash & "temp", tArchive
    
    put "testZip" & tTest && quote & tArchive & quote into tCommand
    do tCommand
    
    if tArchive is among the items of revZipOpenArchives() then
      --revZipCloseArchive tArchive
    end if
    
    repeat while the number of lines of revZipOpenArchives() > 0 
      revZipCloseArchive (line 1 of revZipOpenArchives())
    end repeat
    
    delete file tArchive
    put the result into tResult
    if tResult is not empty then
      breakpoint
    end if
    
    log "end", tTest
  end repeat
  
  
   
  log "end", "Running All tests with Bad data"
end testRunAllBadData


on log
  local tParams, tType, tDetails, tIndent, tColor, tHTML
  local tOldHTML
  
  put params() into tParams
  delete word 1 of tParams
  put char 2 to -2 of item 1 of tParams into tType
  put item 2 to -1 of tParams into tDetails
  
  if tType is among the items of "failed,passed" then
    put tab into tIndent
  else
    put empty into tIndent
  end if
  
  put "black" into tColor
  if tType is "failed" then put "red" into tColor
  if tType is "passed" then put "green" into tColor
  
  put "<p><font color=" & quote & tColor & quote & ">" into tHTML
  put tIndent after tHTML
  put tType after tHTML
  put "</font>" after tHTML
  if tDetails is not empty then
    put ":" after tHTML
  end if
  put tDetails after tHTML
  put "</p>" after tHTML
  
  lock screen
  put the htmlText of field "log" into tOldHTML
  set the htmltext of field "log" to tOldHTML & tHTML
  unlock screen
  
end log

on logInit
  put empty into field "log"
  put empty into field "Callback log"
end logInit

on logCallback
  local tParams
  put params() into tParams
  put tParams into field "Callback Log"
end logCallback
