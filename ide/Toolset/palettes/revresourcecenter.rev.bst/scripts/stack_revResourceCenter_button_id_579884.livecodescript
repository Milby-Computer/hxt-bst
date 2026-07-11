Script "stack_revResourceCenter_button_id_579884"

/*
# Name: button "Print This Card" of group "Example" of group id 579890 of group "mainContent" of card "Printingallthefieldsonacard" of stack "revResourceCenter"
# ID: button id 579884 of group id 577044 of group id 579890 of group id 78015 of card id 78001 of stack "revResourceCenter"
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
