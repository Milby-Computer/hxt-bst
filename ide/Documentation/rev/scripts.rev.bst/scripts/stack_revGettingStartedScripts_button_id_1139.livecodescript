Script "stack_revGettingStartedScripts_button_id_1139"

/*
# Name: button "Common Lines" of group "Finding common lines in two containers Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1139 of group id 1134 of card id 1002 of stack "revGettingStartedScripts"
# Hash: MnJ69ohVklvpYM83jrxuYA==
*/


on mouseUp
  get commonLines(field "List 1", field "List 2")
  if it is empty then answer "There are no lines in common."
  else answer it
end mouseUp
  
function commonLines firstList,secondList
  repeat for each line thisLine in firstList
    put true into firstArray[thisLine]
  end repeat
  repeat for each line thisLine in secondList
    put true into secondArray[thisLine]
  end repeat
  intersect firstArray with secondArray
  return the keys of firstArray
end commonLines
