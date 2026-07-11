Script "stack_revStandaloneSettings_field_id_1232"

/*
# Name: field "stackfiles" of group "Basic Options" of card "Stacks" of stack "revStandaloneSettings"
# ID: field id 1232 of group id 2037 of card id 1013 of stack "revStandaloneSettings"
# Hash: B6hOVt65HN1NLpLa8RG3TQ==
*/


on mouseUp
 updateCard
end mouseUp

on selectionChanged
  updateCard
end selectionChanged

on arrowKey
  send "updateCard" to the owner of me in 10 milliseconds
  pass arrowKey
end arrowKey

on dragEnter
  set the acceptDrop to true
end dragEnter

on dragDrop pWhat
  local tFiles
  put the dragData["files"] into tFiles
  if tFiles is not empty then
    revIncludeStackFiles tFiles
  end if
end dragDrop

getProp hilitedStackFiles
  local tStackFiles,tHilitedFiles,tItem
  local tLines
  put the hilitedLines of me into tLines
  put the cStackPaths of me into tStackFiles
  repeat for each item tItem in tLines
    put line tItem of tStackFiles & cr after tHilitedFiles
  end repeat
  delete char -1 of tHilitedFiles
  return tHilitedFiles
end hilitedStackFiles
