Script "stack_revGettingStartedScripts_button_id_1181"

/*
# Name: button "Choose..." of group "Listing all the unique words in a piece of text Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1181 of group id 1180 of card id 1002 of stack "revGettingStartedScripts"
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
