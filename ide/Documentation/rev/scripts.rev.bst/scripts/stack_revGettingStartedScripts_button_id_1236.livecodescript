Script "stack_revGettingStartedScripts_button_id_1236"

/*
# Name: button "Sort Titles" of bkgnd "Sorting a list Example" of stack "revGettingStartedScripts"
# ID: button id 1236 of bkgnd id 1235 of stack "revGettingStartedScripts"
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
