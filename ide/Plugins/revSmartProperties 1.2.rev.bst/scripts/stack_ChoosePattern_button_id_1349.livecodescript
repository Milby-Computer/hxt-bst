Script "stack_ChoosePattern_button_id_1349"

/*
# Name: button "OK" of card id 1002 of stack "ChoosePattern" of stack "SmartProperties"
# ID: button id 1349 of card id 1002 of stack "ChoosePattern" of stack "SmartProperties"
# Hash: +QFlRtno4GbnLsFrP0lxqg==
*/


on mouseUp
  repeat with i=1 to the number of groups of group "PatternsGroup"
    if the filled of group i of group "PatternsGroup"
    then
      get i
      exit repeat
    end if
  end repeat
  
  set the dialogData to it
  close this stack
end mouseUp
