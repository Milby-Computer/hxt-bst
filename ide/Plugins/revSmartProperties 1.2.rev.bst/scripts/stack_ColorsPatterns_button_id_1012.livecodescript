Script "stack_ColorsPatterns_button_id_1012"

/*
# Name: button "OK" of card id 1002 of stack "ColorsPatterns" of stack "SmartProperties"
# ID: button id 1012 of card id 1002 of stack "ColorsPatterns" of stack "SmartProperties"
# Hash: DSi8M6T4Vwlt6t+R/vvPNw==
*/


on mouseUp
  repeat with i=1 to 8
    if the label of this stack is "Colors"
    then put the backgroundColor of btn i of group "BtnsGroup" into line i of temp
    else put the backgroundPattern of btn i of group "BtnsGroup" into line i of temp
  end repeat
  
  set the dialogData to temp
  close this stack
end mouseUp
