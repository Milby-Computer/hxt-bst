Script "stack_revResourceCenter_button_id_579881"

/*
# Name: button "Print cards with" of group "Example" of group id 579883 of group "mainContent" of card "Printingallcardsthatcontainaword" of stack "revResourceCenter"
# ID: button id 579881 of group id 577043 of group id 579883 of group id 77997 of card id 77987 of stack "revResourceCenter"
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
