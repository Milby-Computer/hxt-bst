Script "stack_revResourceCenter_button_id_584233"

/*
# Name: button "Choose..." of group "Example" of group id 584238 of group "mainContent" of card "ListingAllTheUniqueWordsInAPieceOfText" of stack "revResourceCenter"
# ID: button id 584233 of group id 584232 of group id 584238 of group id 113722 of card id 113707 of stack "revResourceCenter"
# Hash: NNOCpUGWceioPlDO6uYEaQ==
*/


on mouseUp
  answer file "Please choose a text file:"
  if it is empty then exit mouseUp -- no file chosen
  put the itemDelimiter into savedDelimiter
  set the itemDelimiter to "/"
  put "File:" && last item of it into field "Filename"
  set the itemDelimiter to savedDelimiter
  put uniqueWordsOf(URL ("file:" & it)) into field "Unique Words"
end mouseUp

function uniqueWordsOf theString
  repeat for each word thisWord in theString
    add 1 to wordsList[thisWord]
  end repeat
  return the keys of wordsList
end uniqueWordsOf
