Script "stack_revResourceCenter_button_id_579901"

/*
# Name: button "Convert Path" of group "Example" of group id 579908 of group "mainContent" of card "Convertingarelativepathtoanabsolutepath" of stack "revResourceCenter"
# ID: button id 579901 of group id 577048 of group id 579908 of group id 102592 of card id 102575 of stack "revResourceCenter"
# Hash: tU3L4VNT3dJODMmYq98GdA==
*/


on mouseUp
  answer absolutePath(field "Path",field "Starting Folder")
end mouseUp

function absolutePath relativePath,startingFolder
  -- make sure this is a relative path:
  if (the platform is "Win32" \
     and char 2 of relativePath is ":") \
     or (char 1 of relativePath is "/") then
    return "Error: path is not a relative path"
  end if
  -- use the current folder as the starting folder by default:
  if startingFolder is empty
  then put the defaultFolder into startingFolder
  if last char of startingFolder is "/"
  then delete last char of startingFolder
  set the itemDelimiter to "/"
  if first item of relativePath is "."
  then delete first item of relativePath
  -- move up one folder for each ".." in the relative path:
  repeat while first item of relativePath is ".."
    delete first item of relativePath -- done with it
    delete last item of startingFolder -- go up one folder
    if startingFolder is empty then
      -- there were too many ".." in the relative path
      return "Error: relative path has too many components"
    end if
  end repeat
  return startingFolder & "/" & relativePath
end absolutePath
