Script "stack_revResourceCenter_button_id_579910"

/*
# Name: button "Convert Path" of group "Example" of group id 584271 of group "mainContent" of card "convertinganabsolutepathtoarelativepath" of stack "revResourceCenter"
# ID: button id 579910 of group id 577049 of group id 584271 of group id 104792 of card id 104775 of stack "revResourceCenter"
# Hash: HD9StfLVohtaRg4URuRW6Q==
*/


on mouseUp
  answer relativePath(field "Path",field "Starting Folder")
end mouseUp

function relativePath absolutePath,startingFolder
  -- make sure this is an absolute path:
  if (the platform is "Win32" and \
      (char 1 of absolutePath is not in \
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ" \
      or char 2 of absolutePath is not ":")) \
      or (the platform is not "Win32" and \
      char 1 of absolutePath is not "/") then
    return "Error: path is not an absolute path"
  end if
  -- use the current folder as the starting folder by default:
  if startingFolder is empty
  then put the defaultFolder into startingFolder
  if absolutePath is startingFolder then return "."
  set the itemDelimiter to "/"
  repeat
    if item 1 of startingFolder is item 1 of absolutePath
    then -- they’re in the same disk or folder
      delete item 1 of absolutePath
      delete item 1 of startingFolder
    else exit repeat
  end repeat
  repeat for (the number of items in startingFolder) times
    put "../" before absolutePath
  end repeat
  return absolutePath -- now changed to a relative path
end relativePath
