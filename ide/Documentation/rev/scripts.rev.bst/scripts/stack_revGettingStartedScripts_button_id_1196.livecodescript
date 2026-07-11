Script "stack_revGettingStartedScripts_button_id_1196"

/*
# Name: button "Print cards with" of group "Printing all cards that contain a word Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1196 of group id 1195 of card id 1002 of stack "revGettingStartedScripts"
# Hash: SBUOX/xsr6h1R2dHkGxhZQ==
*/


on mouseUp
  get field "String"
  if it is empty then beep
  else
    set the defaultStack to the topStack
    answer "Printing all cards that contain “" & it \
        & "” in “" & the title of the defaultStack & "”." \
        with "Cancel" or "OK"
    if it is "OK" then printCardsWith it
  end if
end mouseUp

on printCardsWith stringToFind,fieldName
  unmark all cards
  if fieldName is empty then -- search all fields
    mark cards by finding stringToFind
  else
    mark cards by finding stringToFind in field fieldName
  end if
  print marked cards
end printCardsWith
