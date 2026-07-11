Script "stack_revGettingStartedScripts_button_id_1025"

/*
# Name: button "Add prefix:" of group "Inserting some text before each line in a field Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1025 of group id 1022 of card id 1002 of stack "revGettingStartedScripts"
# Hash: yD/eFja8PIh47ZR3VbaMuA==
*/


on mouseUp
  put prefixed(field "List",field "Prefix") into field "List"
end mouseUp

function prefixed listOfLines,thePrefix
  repeat for each line theLine in listOfLines
    put thePrefix & theLine & return after newList
  end repeat
  return char 1 to -2 of newList -- leave off trailing return
end prefixed
