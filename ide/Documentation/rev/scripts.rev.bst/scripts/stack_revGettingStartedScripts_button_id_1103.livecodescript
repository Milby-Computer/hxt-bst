Script "stack_revGettingStartedScripts_button_id_1103"

/*
# Name: button "Convert Path" of group "Converting an absolute path to a relative path Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1103 of group id 1101 of card id 1002 of stack "revGettingStartedScripts"
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
