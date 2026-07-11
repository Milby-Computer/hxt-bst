Script "stack_revResourceCenter_button_id_579729"

/*
# Name: button "Sort Titles" of group "Example" of group id 584247 of group "mainContent" of card "SortingAList" of stack "revResourceCenter"
# ID: button id 579729 of group id 577015 of group id 584247 of group id 113786 of card id 113772 of stack "revResourceCenter"
# Hash: /AFEx8HKyrBSvKNNM7YwcQ==
*/


on mouseDown
  sort lines of field "Example Titles" by withoutLeadingArticle(each)
end mouseDown

function withoutLeadingArticle theTitle
  get word 1 of theTitle
  if it is "The" or it is "An" or it is "A" then
    -- we don't want to use it for the sort:
    delete word 1 of theTitle
  end if
  return theTitle
end withoutLeadingArticle
