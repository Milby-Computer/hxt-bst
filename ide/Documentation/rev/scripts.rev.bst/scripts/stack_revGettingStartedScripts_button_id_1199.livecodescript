Script "stack_revGettingStartedScripts_button_id_1199"

/*
# Name: button "Print This Card" of group "Printing all the fields on a card Example" of card id 1002 of stack "revGettingStartedScripts"
# ID: button id 1199 of group id 1198 of card id 1002 of stack "revGettingStartedScripts"
# Hash: 13vvocTmO3QqU2BAnEYznQ==
*/


on mouseUp
  printAllFields
end mouseUp

on printAllFields
  repeat with thisField = 1 to the number of fields
    -- collect data in collectedFields variable:
    put "<p><b>" & the short name of field thisField \
       & ":</b></p>" \
       & the htmlText of field thisField after collectedFields
  end repeat
  -- print the variable
  revShowPrintDialog false, true
  revPrintText collectedFields
end printAllFields
