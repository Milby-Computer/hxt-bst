Script "stack_revResourceCenter_button_id_578806"

/*
# Name: button "Add prefix:" of group "Example" of group id 578809 of group "mainContent" of card "InsertingSomeTextBeforeEachLineinaField" of stack "revResourceCenter"
# ID: button id 578806 of group id 578803 of group id 578809 of group id 100260 of card id 100240 of stack "revResourceCenter"
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
