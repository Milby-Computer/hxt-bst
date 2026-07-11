Script "stack_revNavigator_button_id_1075"

/*
# Name: button "Do" of group "commandControls" of group "commandGroup" of card "display" of stack "revNavigator"
# ID: button id 1075 of group id 1076 of group id 1100 of card id 1002 of stack "revNavigator"
# Hash: dtm4FaIeyqU8J5MHve9ONA==
*/


on mouseUp
  set the commandCode of me to fld "command"
  doCode
end mouseUp

on doCode
  put the commandCode of me into tCommandCode
  put the commandScript of me into tScript
  replace "--tCommandCode" with tCommandCode in tScript
  set the script of group "commandControls" to tScript
  --put tScript
  if the result is not empty then
    answer "Script Error" with "OK"
    put tScript
    exit doCode
  end if
  doCommand
end doCode
