Script "stack_revResourceCenter_button_id_579827"

/*
# Name: button "Common Lines" of group "Example" of group id 579835 of group "mainContent" of card "FindingCommonLinesInTwoContainers" of stack "revResourceCenter"
# ID: button id 579827 of group id 577027 of group id 579835 of group id 113665 of card id 113650 of stack "revResourceCenter"
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
