Script "stack_revResourceCenter_button_id_579833"

/*
# Name: button "Uncommon Lines" of group "Example" of group id 579836 of group "mainContent" of card "FindingLinesThatAreNotCommonToTwoContainers" of stack "revResourceCenter"
# ID: button id 579833 of group id 577028 of group id 579836 of group id 113683 of card id 113667 of stack "revResourceCenter"
# Hash: mWo9wIf89BwIx3wnmy6nAQ==
*/


on mouseUp
  get uncommonLines(field "List 1", field "List 2")
  if it is empty then answer "There are no differing lines."
  else answer it
end mouseUp
 
function uncommonLines firstList,secondList
  -- find lines in the first list but not the second list:
  repeat for each line thisLine in firstList
    if thisLine is not in secondList then -- include this line
      put "-" && thisLine & return after uncommon
    end if
  end repeat
  -- find lines in the second list but not the first list:
  repeat for each line thatLine in secondList
    if thatLine is not in firstList then -- include this line
      put "+" && thatLine & return after uncommon
    end if
  end repeat
  if last char of uncommon is return
  then delete last char of uncommon -- strip trailing return
  return uncommon
end uncommonLines
